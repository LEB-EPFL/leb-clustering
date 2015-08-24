% Script for making overlay plot for publication.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2015/08/18 $ $REVISION: 0.1 $
% 
%% Read localization data into memory.
workDir = '/media/douglass/My Book/Kyle/Telomere_Data/11_06_2014_FISH_HelaS_L/HelaL/Molecule_Lists/wild_type/';
fName = '11_06_2014_wild_type_FOV3.txt';


imgDir = '/media/douglass/My Book/Kyle/Telomere_Data/11_06_2014_FISH_HelaS_L/HelaL/wild_type/';
fNameImg = [imgDir '11_06_2014_wild_type_FOV3.jp2'];

data = tdfread([workDir fName]);

%% Filter out unnecessary columns and condition data for input to DBSCAN.
dataF = [data.Xc data.Yc data.Zc data.Length];

%% Remove localizations with on times less than maxOnTime
maxOnTime = 10;

%Separate onTimes from the rest of the data.
onTimes = dataF(:,end);
dataF = dataF(onTimes <= maxOnTime,1:3);

%% Cluster localizations using DBSCAN.
% k - number of objects in a neighborhood of an object 
% (minimal number of objects considered as a cluster)
% Eps - neighborhood radius, if not known avoid this parameter or put []
k = 8;
Eps = 65;
tic
[class, type] = dbscan(dataF, k, Eps);
toc

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
% Minimum number of labels/telomere assuming 100% labeling efficiency: 220
% Maximum number of labels/telomere assuming 100% labeling efficiency: 1670
minLoc = 50;

clustersF = clusters(cellfun(@length, clusters) > minLoc);

%% Manually remove spurious cluster (it would have been manually filtered out)
% (index obtained by personal investigation of Rg value)
clustersF = [clustersF(1:6); clustersF(8:end)];

%% Filter out clusters that lie within a given distance of the z-borders
zAxisDist = 300;

%  Find average z position of each cluster
zAvg = cellfun(@mean, clustersF, 'UniformOutput', false);
for ctr = 1:length(zAvg)
    zAvg{ctr} = zAvg{ctr}(3);
end
zAvg = cell2mat(zAvg);

clustersF = clustersF(abs(zAvg) <= zAxisDist);
numClustersF = length(clustersF);


%% Plot clustered points on top of wide field images.
% dateLength = 11;
% removeLength = 9;
% fType = '.jp2';
% fNameImg = [fName(1:dateLength) 'WF' fName(dateLength:end-removeLength) fType];

% Distance-to-pixel conversion factor
dist2pixX = 1/162;
dist2pixY = 1/158.5;

img = imread(fNameImg);
imshow(img, [min(img(:)) max(img(:))])
hold on
for ctr = 1:numClustersF
    plot(dist2pixX * clustersF{ctr}(:,1), dist2pixY * clustersF{ctr}(:,2), '+', 'Color', rand(3,1))
end
hold off

%% Find moments of the distribution of localizations within the clusters.
% Rows of M1 are the first moments of the distribution for each coordinate
% of the localizations within a single cluster.
%
% M2 is the diagonal of the covariance matrix computed from the
% (Xc, Yc, Zc) positions of the points within a cluster. Each row is the
% covariance matrix diagonal of a different cluster.
M1 = cell2mat(cellfun(@mean, clustersF, 'UniformOutput', false));
M2 = cell2mat(cellfun(@second_central_moment, clustersF, 'UniformOutput', false));

% Magnitude of the second moment
M2Mag = sqrt(sum(M2,2));

%% Compute transverse radius of gyration
Rg = sqrt(sum(M2(:,1:2), 2));

% %% Create a mapping from Rg onto a MATLAB colormap for plotting
% map = colormap('parula');
% 
% % Max and min Rg values, for setting colorbars
% maxRg = max(Rg);
% minRg = min(Rg) - 1; % -1 prevents indexing errors later
% 
% % Distance-to-pixel conversion factor
% dist2pixX = 1/162.6;
% dist2pixY = 1/158.8;
% 
% ax  = axes();
% img = imread(fNameImg);
% imshow(img, [min(img(:)) max(img(:))], 'Parent', ax)
% set(gcf, 'units', 'normalized', 'outerposition', [0 0 1 1]);
% 
% hold on
% for ctr = 1:numClustersF
%     % Rg of current cluster
%     currRg = Rg(ctr);
%     
%     % Find relative position of current Rg in the full range of Rg values
%     currColor = uint8(ceil((currRg - minRg)/(maxRg - minRg) * length(map)));
%     
%     plot(dist2pixX * clustersF{ctr}(:,1), dist2pixY * clustersF{ctr}(:,2), '.', 'Color', map(currColor,:))
% end
% hold off
% 
% xlim([125, 189])
% ylim([154, 218])

% %% Make a color bar image
% testImage = ones(256, 256);
% testImage(50:100, 50:100) = 0;
% imshow(testImage)
% colormap('parula');
% cbar = colorbar;
% set(cbar, 'Ticks', [0,1])
% set(cbar, 'TickLabels', {num2str(uint8(minRg)), num2str(uint8(maxRg))})

%% Plot a single cluster and its Rg
clusterNum = 17;
currRg = Rg(clusterNum) * sqrt(3/2);
scatter(clustersF{clusterNum}(:,1), clustersF{clusterNum}(:,2), 36, 'FaceColor', 'k')
hold on

% Plot the radius of gyration for this cluster
t = linspace(0, 2*pi, 1000);
x = currRg * cos(t) + M1(clusterNum,1);
y = currRg * sin(t) + M1(clusterNum,2);
plot(x, y, 'b', 'LineWidth', 4)
hold off
axis tight
axis equal

set(gca, 'XTickLabel', '')
set(gca, 'YTickLabel', '')
set(gca, 'Visible', 'Off')

