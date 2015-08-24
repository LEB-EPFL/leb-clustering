% Script for data mining in the telomere data.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/08/05 $ $REVISION: 0.4 $
% 
%% Read localization data into memory.
%workDir = 'Z:\LEB\Users\Kyle-Michael-Douglass\Projects\Telomeres\';
%workDir = '/mnt/LEBZ/Users/Kyle-Michael-Douglass/Projects/Telomeres/';
%workDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/11_08_2014_HeLaS_KD_Smchd1_TRF2_pLVP TRF2/';
%workDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/08_09_2014_HelaS_L_Trf1_Trf2_KD_DAPI_FISH_mol_lists/08_09_2014_HelaS_DAPI_FISH_TRF2_TRF1_KD/';
%workDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Verena/11_06_2014_FISH_HelaS_L/11_06_2014_FISH_Hela_S_L/11_06_2014_Hela_L_FISH/Hela L FISH molecule lists/';
%workDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/HelaS/Molecule_Lists/TRF2/';
workDir = '/media/douglass/My Book/Kyle/Telomere_Data/11_06_2014_FISH_HelaS_L/HelaL/Molecule_Lists/wild_type/';

fName = '11_06_2014_wild_type_FOV3.txt';
%fName = '11_06_2014_FISH_HelaL_slide2_8_list.txt';
%fName = '11_06_2014_FISH_HelaS_slide3_7_list.txt';
%fName = '11_06_2014_FISH_HelaS_slide3_10_list.txt';
%fName = 'test_data.txt';
%fName = '11_08_2014_HeLa L_SmchD1_Trf2_KD_FISH_pLVP Trf2_2.txt';
%fName = '11_08_2014_HeLa S_SmchD1_Trf2_KD_FISH_pLVP Trf2_1_list.txt';
%fName = '11_08_2014_HeLa S_SmchD1_Trf2_KD_FISH_pSuper_1.txt';
%fName = '11_08_2014_HeLa S_SmchD1_Trf2_KD_FISH_pLVP Trf2_5_list.txt';
%fName = '08_09_2014_HelaS_DAPI_FISH_TRF2_TRF1_KD_1_list.txt';

%imgDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLa S_SMCHD1_Trf2_KD_FISH_pSuper/';
%fNameImg = [imgDir '11_08_2014_WF_HeLa S_SMCHD1_Trf2_KD_pSuper_1.jp2'];

imgDir = '/media/douglass/My Book/Kyle/Telomere_Data/11_06_2014_FISH_HelaS_L/HelaL/wild_type/';
fNameImg = [imgDir '11_06_2014_wild_type_FOV3.jp2'];

% imgDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLa L_SMCHD1_Trf2_KD_FISH_pLVPTrf2/';
% fNameImg = [imgDir '11_08_2014_WF_HeLa L_SMCHD1_Trf2_KD_pLVTP Trf2_2.jp2'];

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

%% Check histogram of localization types.
%hist(type)

%% Filter noise localizations out of data.
% DBSCAN labels noise, border, and core points as -1, 0, and 1, respect.
% datacl = datac(type >= 0,:);
% classcl = class(type >= 0);

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
%% Plot 3D scatter plot of all data points.
scatter3(dataF(:,1),dataF(:,2),dataF(:,3), '.k')
axis equal
grid on

%% Plot filtered clusters in 3D.
% See, for example, <http://stackoverflow.com/questions/5492806/plotting-a-surface-from-a-set-of-interior-3d-scatter-points-in-matlab>
hold on
for ctr = 1:numClustersF
    DT = DelaunayTri(clustersF{ctr});
    hullFacets = convexHull(DT);
    
    trisurf(hullFacets,DT.X(:,1),DT.X(:,2),DT.X(:,3),'FaceColor',rand(1,3))
    axis equal
end
hold off
grid on

%% Plot 3D scatter plot of cluster points and noise points.
hold on
for ctr = 1:numClustersF
    scatter3(clustersF{ctr}(:,1), clustersF{ctr}(:,2), clustersF{ctr}(:,3),'.')
end
% This also assumes that noise is the last row.
scatter3(noise(:,1), noise(:,2), noise(:,3),'k+','SizeData',10)
hold off
axis equal
grid on

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
    t = DT.Triangulation;
    e1 = clustersF{ctr}(t(:,2),:) - clustersF{ctr}(t(:,1),:);
    e2 = clustersF{ctr}(t(:,3),:) - clustersF{ctr}(t(:,1),:);
    e3 = clustersF{ctr}(t(:,4),:) - clustersF{ctr}(t(:,1),:);
    V = abs(dot(cross(e1,e2,2),e3,2))/6;
    volume(ctr) = sum(V);
end

%% Plot the histogram of second central moments.
hist(M2)
title('Distribution of the variances from clustered groups of localizations about the x, y, and z axes')
xlabel('Variance, nm^2')
ylabel('Number of occurrences')
legend('M_x^2', 'M_y^2', 'M_z^2')
grid on

%% Plot the histogram of magnitude of second moments.
hist(M2Mag)
title('Distribution of the magnitudes of the standard deviation from clustered groups of localizations')
xlabel('Standard deviation, nm')
ylabel('Number of occurrences')
grid on

%% Plot the histogram of the number of localizations.
hist(numLoc)
title('Distribution of the number of localizations per cluster')
xlabel('Number of localizations')
ylabel('Number of occurrences')
grid on

%% Plot the histogram of the volumes of the complex hulls.
hist(volume)
title('Distribution of the volumes of the complex hulls of the clusters')
xlabel('Volume, nm^3')
ylabel('Number of occurrences')
grid on

%% Make a scatter plot of the magnitude of M2 vs. the cube root of volume.
x = volume.^(1/3);
y = M2Mag;

p = polyfit(x, y, 1);
linearFit = polyval(p, x);
resid = y - linearFit;
SSresid = sum(resid.^2);
SStotal = (length(y) -1) * var(y);
Rsq = 1 - SSresid/SStotal;

scatter(volume.^(1/3),M2Mag)
hold on
plot(volume.^(1/3), linearFit, 'k')
hold off
title('Second central moments vs the cube root of volume of clusters')
xlabel('Cube root of volume, nm')
ylabel('(|M^2|)^{1/2}, nm')
legend('Size of clusters', ['Linear regression (R^2 = ' num2str(Rsq, '%.2f') ')'], 'Location', 'SouthEast')
grid on