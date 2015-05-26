function [M1, M2, RgTrans, Rg, numLoc, volume] = computeClusterStats(clusters)
% Takes a cell array of clusters and computes their statistics.
numClusters = length(clusters);

%% Find moments of the distribution of localizations within the clusters.
% Rows of M1 are the first moments of the distribution for each coordinate
% of the localizations within a single cluster.
%
% M2 is the diagonal of the covariance matrix computed from the
% (Xc, Yc, Zc) positions of the points within a cluster. Each row is the
% covariance matrix diagonal of a different cluster.
M1 = cellfun(@mean, clusters, 'UniformOutput', false);
M2 = cellfun(@second_central_moment, clusters, 'UniformOutput', false);

%% Count the number of localizations within each cluster and noise points.
numLoc = zeros(numClusters,1);

for ctr = 1:numClusters
    [numLoc(ctr), ~] = size(clusters{ctr});
end

%% Determine the volume of the complex hull defined by the clusters.
% See: <http://scicomp.stackexchange.com/questions/8089/volume-of-3d-convex-hull-of-small-point-sets-all-on-the-hull>
volume = zeros(numClusters, 1);

for ctr = 1:numClusters
    DT = DelaunayTri(clusters{ctr});
    try
        t = DT.Triangulation;
        e1 = clusters{ctr}(t(:,2),:) - clusters{ctr}(t(:,1),:);
        e2 = clusters{ctr}(t(:,3),:) - clusters{ctr}(t(:,1),:);
        e3 = clusters{ctr}(t(:,4),:) - clusters{ctr}(t(:,1),:);
        V = abs(dot(cross(e1,e2,2),e3,2))/6;
        volume(ctr) = sum(V);
    catch
        display('Unable to compute volume of the current cluster. Delaunay triangulation may not exist.')
        display('Setting volume of current cluster to 0...')
        volume(ctr) = 0;
    end
end

%% Assign computed values to data structure for return.
M1 = cell2mat(M1);
M2 = cell2mat(M2);

% Radius of gyration
Rg = sqrt(sum(M2,2));

% Error handling in case M2 is empty
if isempty(M2)
    RgTrans = [];
else
    % Factor of sqrt(3/2) converts to a 3D Rg
    RgTrans = sqrt(3/2) * sqrt(M2(:,1) + M2(:,2)); 
end

end

function M2 = second_central_moment(X)
% second_central_moment Determines the second central moment of an array.
%
% M2 = second_central_moment(X) returns the second central moment of the
% data in the columns of the array X.

    N = size(X,1);
    Xbar = mean(X);
    M2 = sum((X - repmat(Xbar, N, 1)).^2) / N;
end