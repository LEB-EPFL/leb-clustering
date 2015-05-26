% Perform automatic clustering and filtering on the telomere localizations.
%
% Inputs:
%   dataF     - N X 3 array of unclustered point coordinates
%   fileName  - Name of the current localization data file
%   k         - Number of objects in a neighborhood of an cluster
%   Eps       - Neighborhood radius, if not known put []
%   minLoc    - Minimum number of points in a cluster
%   maxLoc    - Maximum number of points in a cluster
%               (set to Inf if there's no upper bound filtering)
%   zAxisDist - Remove clusters with centers of mass that are greater than
%               +/- this distance from the 0 nm z-plane.
%   maxOnTime - Maximum number of frames that a molecule can be on for
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2015/05/21 $ $REVISION: 2.0 $
% $FORMER NAME: process_data.m $
%

function [autoFilteredData] = auto_filter_data(dataF, fileName, k, Eps, minLoc, maxLoc, zAxisDist, maxOnTime)

%% Save inputs for cataloging
autoFilteredData.fileName  = fileName;
autoFilteredData.k         = k;
autoFilteredData.Eps       = Eps;
autoFilteredData.minLoc    = minLoc;
autoFilteredData.maxLoc    = maxLoc;
autoFilteredData.zAxisDist = zAxisDist;
autoFilteredData.maxOnTime = maxOnTime;

%% Remove localizations on for more than maxOnTime frames.
%Separate onTimes from the rest of the data.
onTimes = dataF(:,end);
dataF = dataF(onTimes <= maxOnTime,1:3);

%% Cluster localizations using DBSCAN.
% k - number of objects in a neighborhood of an object 
% (minimal number of objects considered as a cluster)
% Eps - neighborhood radius, if not known avoid this parameter or put []
[class, ~] = dbscan(dataF, k, Eps);

%% Separate clusters into a class array.
numClusters = max(class);
clusters = cell(numClusters,1);

for ctr = 1:numClusters
    clusters{ctr} = dataF(class == ctr, :);
end

% Save noise points in a separate array.
noise = dataF(class == -1, :);

%% Filter the clusters by number of localizations.
%  Remove clusters with fewer than minLoc localizations
cellLength   = cellfun(@length, clusters);
clustersF    = clusters(cellLength > minLoc & cellLength < maxLoc);

%% Filter out clusters that lie within a given distance of the z-borders
%  Find average z position of each cluster
zAvg = cellfun(@mean, clustersF, 'UniformOutput', false);
for ctr = 1:length(zAvg)
    zAvg{ctr} = zAvg{ctr}(3);
end
zAvg = cell2mat(zAvg);

clustersF = clustersF(abs(zAvg) <= zAxisDist);

%% Return the cluster and noise data
autoFilteredData.clusters = clustersF;
autoFilteredData.noise    = noise;
end