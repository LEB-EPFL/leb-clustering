% Process the data from the telomere experiments.
%
% Inputs:
%   dataF  - N X 3 array of unclustered point coordinates.
%   k      - Number of objects in a neighborhood of an cluster
%   Eps    - Neighborhood radius, if not known put []
%   minLoc - Minimum number of points in a cluster
%   maxLoc - Maximum number of points in a cluster
%            (set to Inf if there's no upper bound filtering)
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/12/03 $ $REVISION: 1.4 $
%

function [distr] = process_data(dataF, k, Eps, minLoc, maxLoc)
%% Cluster localizations using DBSCAN.
% k - number of objects in a neighborhood of an object 
% (minimal number of objects considered as a cluster)
% Eps - neighborhood radius, if not known avoid this parameter or put []
[class, ~] = dbscan(dataF, k, Eps);

%% Separate clusters.
numClusters = max(class);
clusters = cell(numClusters,1);

for ctr = 1:numClusters
    clusters{ctr} = dataF(class == ctr, :);
end

% Save noise points in a separate array.
noise = dataF(class == -1, :);

%% Filter the clusters by number of localizations.
% Remove clusters with fewer than minLoc localizations
cellLength = cellfun(@length, clusters);
clustersF = clusters(cellLength > minLoc & cellLength < maxLoc);
numClustersF = length(clustersF);

%% Find moments of the distribution of localizations within the clusters.
% Rows of M1 are the first moments of the distribution for each coordinate
% of the localizations within a single cluster.
%
% M2 is the diagonal of the covariance matrix computed from the
% (Xc, Yc, Zc) positions of the points within a cluster. Each row is the
% covariance matrix diagonal of a different cluster.
M1 = cell2mat(cellfun(@mean, clustersF, 'UniformOutput', false));
M2 = cell2mat(cellfun(@second_central_moment, clustersF, 'UniformOutput', false));

% Radius of gyration
Rg = sqrt(sum(M2,2));

%% Count the number of localizations within each cluster and noise points.
numLoc = zeros(numClustersF,1);

for ctr = 1:numClustersF
    [numLoc(ctr), ~] = size(clustersF{ctr});
end

%% Determine the volume of the complex hull defined by the clusters.
% See: <http://scicomp.stackexchange.com/questions/8089/volume-of-3d-convex-hull-of-small-point-sets-all-on-the-hull>
volume = zeros(numClustersF,1);

for ctr = 1:numClustersF
    DT = DelaunayTri(clustersF{ctr});
    try
        t = DT.Triangulation;
        e1 = clustersF{ctr}(t(:,2),:) - clustersF{ctr}(t(:,1),:);
        e2 = clustersF{ctr}(t(:,3),:) - clustersF{ctr}(t(:,1),:);
        e3 = clustersF{ctr}(t(:,4),:) - clustersF{ctr}(t(:,1),:);
        V = abs(dot(cross(e1,e2,2),e3,2))/6;
        volume(ctr) = sum(V);
    catch
        display('Unable to compute volume of the current cluster. Delaunay triangulation may not exist.')
        display('Setting volume of current cluster to 0...')
        volume(ctr) = 0;
    end
end

%% Assign computed values to data structure for return.
distr.M1 = M1;
distr.M2 = M2;
% Error handling in case M2 is empty
if isempty(M2)
    distr.RgTrans = [];
else
    % Factor of sqrt(3/2) converts to a 3D Rg
    distr.RgTrans = sqrt(3/2) * sqrt(M2(:,1) + M2(:,2)); 
end
distr.Rg = Rg;
distr.numLoc = numLoc;
distr.volume = volume;
end

function M2 = second_central_moment(X)
% second_central_moment Determines the second central moment of an array.
%
% M2 = second_central_moment(X) returns the second central moment of the
% data in the columns of the array X.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/07/29 $ $REVISION: 0.1 $
% 
    N = size(X,1);
    Xbar = mean(X);
    M2 = sum((X - repmat(Xbar, N, 1)).^2) / N;
end