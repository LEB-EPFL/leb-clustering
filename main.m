% The main script for analyzing the telomere data and producing reports.
%
% This script should be run after the analysis workflow is determined from
% data_mining.m.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/08/26 $ $REVISION: 0.8 $
%
%% Use parallel processing to speed up computation? (use 'false' if unsure)
useParallel = true;

% if useParallel
%     matlabpool open
% end

%% Define clustering and filtering parameters.
% k - number of objects in a neighborhood of an object 
% (minimal number of objects considered as a cluster)
% Eps - neighborhood radius, if not known avoid this parameter or put []
% minLoc - Discard all clusters with localizations fewer than this number.
k = 8;
Eps = 65;
minLoc = 50;

%% Designate the files for analysis.
% All datasets are comparisons between two populations, typically Hela L
% cells and Hela S cells, or between two different transfections.
% Therefore, each experiment consists of two datasets.

%==========================================================================
% 11-06-2014 FISH Original data
%==========================================================================
data(1).shortName = '11-06-2014 FISH';
data(1).rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Verena/11_06_2014_FISH_HelaS_L/11_06_2014_FISH_Hela_S_L/';
data(1).dataset1Dir = '11_06_2014_Hela_L_FISH/Hela L FISH molecule lists/';
data(1).dataset2Dir = '11_06_2014_Hela_S_FISH/Hela S FISH molecule lists/';
data(1).dataset1ShortName = 'L dataset';
data(1).dataset2ShortName = 'S dataset';
data(1).distributions1 = [];
data(1).distributions2 = [];
data(1).fits = [];

%==========================================================================
% 29-07-2014 SmchD1
%==========================================================================
data(2).shortName = '29-07-2014 SmchD1 pSuper';
data(2).rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/29_07_2014_HelaS_L_SmchD1_KD_FISH/29_07_2014_HelaS_L_SmchD1_KD_FISH_Mol_lists/';
data(2).dataset1Dir = '29_07_2014_HelaL_SmchD1_pSuper_mol_list/';
data(2).dataset2Dir = '29_07_2014_HelaS_SmchD1_pSuper_mol_list/';
data(2).dataset1ShortName = 'L dataset';
data(2).dataset2ShortName = 'S dataset';
data(2).distributions1 = [];
data(2).distributions2 = [];
data(2).fits = [];

data(3).shortName = '29-07-2014 SmchD1 pLVP041';
data(3).rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/29_07_2014_HelaS_L_SmchD1_KD_FISH/29_07_2014_HelaS_L_SmchD1_KD_FISH_Mol_lists/';
data(3).dataset1Dir = '29_07_2014_HelaL_SmchD1_pLVP041_mol_list/';
data(3).dataset2Dir = '29_07_2014_HelaS_SmchD1_pLVP041_mol_list/';
data(3).dataset1ShortName = 'L dataset';
data(3).dataset2ShortName = 'S dataset';
data(3).distributions1 = [];
data(3).distributions2 = [];
data(3).fits = [];

data(4).shortName = '29-07-2014 SmchD1 pLVP042';
data(4).rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/29_07_2014_HelaS_L_SmchD1_KD_FISH/29_07_2014_HelaS_L_SmchD1_KD_FISH_Mol_lists/';
data(4).dataset1Dir = '29_07_2014_HelaL_SmchD1_pLVP042_mol_list/';
data(4).dataset2Dir = '29_07_2014_HelaS_SmchD1_pLVP042_mol_list/';
data(4).dataset1ShortName = 'L dataset';
data(4).dataset2ShortName = 'S dataset';
data(4).distributions1 = [];
data(4).distributions2 = [];
data(4).fits = [];

%==========================================================================
% 30-07-2014 SmchD1
%==========================================================================
data(5).shortName = '30-07-2014 SmchD1 pSuper';
data(5).rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
data(5).dataset1Dir = '30_07_2014_HelaL_SmchD1_pSuper_mol_list/';
data(5).dataset2Dir = '30_07_2014_HelaS_SmchD1_pSuper_mol_list/';
data(5).dataset1ShortName = 'L dataset';
data(5).dataset2ShortName = 'S dataset';
data(5).distributions1 = [];
data(5).distributions2 = [];
data(5).fits = [];

data(6).shortName = '30-07-2014 SmchD1 pLVP041';
data(6).rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
data(6).dataset1Dir = '30_07_2014_HelaL_SmchD1_pLVP041_mol_list/';
data(6).dataset2Dir = '30_07_2014_HelaS_SmchD1_pLVP041_mol_list/';
data(6).dataset1ShortName = 'L dataset';
data(6).dataset2ShortName = 'S dataset';
data(6).distributions1 = [];
data(6).distributions2 = [];
data(6).fits = [];

data(7).shortName = '30-07-2014 SmchD1 pLVP042';
data(7).rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
data(7).dataset1Dir = '30_07_2014_HelaL_SmchD1_pLVP042_mol_list/';
data(7).dataset2Dir = '30_07_2014_HelaS_SmchD1_pLVP042_mol_list/';
data(7).dataset1ShortName = 'L dataset';
data(7).dataset2ShortName = 'S dataset';
data(7).distributions1 = [];
data(7).distributions2 = [];
data(7).fits = [];

%==========================================================================
% 05-08-2014 Hela L LRif1
%==========================================================================
data(8).shortName = '05-08-2014 Hela L siGfp';
data(8).rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/05_08_2014_HelaL_LRif1_KD_FISH/05_08_2014_HelaL_LRif1_Mol_Lists/';
data(8).dataset1Dir = '05_08_2014_HelaL_LRif1_siGfp_mol_lists/';
data(8).dataset2Dir = '05_08_2014_HelaL_LRif1_siGfp_tr2_mol_lists/';
data(8).dataset1ShortName = '1st transfection';
data(8).dataset2ShortName = '2nd transfection';
data(8).distributions1 = [];
data(8).distributions2 = [];
data(8).fits = [];

data(9).shortName = '05-08-2014 Hela L si1LRif1';
data(9).rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/05_08_2014_HelaL_LRif1_KD_FISH/05_08_2014_HelaL_LRif1_Mol_Lists/';
data(9).dataset1Dir = '05_08_2014_HelaL_LRif1_si1LRif1_mol_lists/';
data(9).dataset2Dir = '05_08_2014_HelaL_LRif1_si1LRif1_tr2_mol_lists/';
data(9).dataset1ShortName = '1st transfection';
data(9).dataset2ShortName = '2nd transfection';
data(9).distributions1 = [];
data(9).distributions2 = [];
data(9).fits = [];

data(10).shortName = '05-08-2014 Hela L si6LRif1';
data(10).rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/05_08_2014_HelaL_LRif1_KD_FISH/05_08_2014_HelaL_LRif1_Mol_Lists/';
data(10).dataset1Dir = '05_08_2014_HelaL_LRif1_si6LRif1_mol_lists/';
data(10).dataset2Dir = '05_08_2014_HelaL_LRif1_si6LRif1_tr2_mol_lists/';
data(10).dataset1ShortName = '1st transfection';
data(10).dataset2ShortName = '2nd transfection';
data(10).distributions1 = [];
data(10).distributions2 = [];
data(10).fits = [];

%==========================================================================
% 11-08-2014 TrF2
%==========================================================================
data(11).shortName = '11-08-2014 pSuper';
data(11).rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/';
data(11).dataset1Dir = '11_08_2014_HeLaL_KD_Smchd1_TRF2_pSuper_non filtered/';
data(11).dataset2Dir = '11_08_2014_HeLaS_KD_Smchd1_TRF2_pSuper_non filtered/';
data(11).dataset1ShortName = 'L dataset';
data(11).dataset2ShortName = 'S dataset';
data(11).distributions1 = [];
data(11).distributions2 = [];
data(11).fits = [];

data(12).shortName = '11-08-2014 pLVP041';
data(12).rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/';
data(12).dataset1Dir = '11_08_2014_HeLaL_KD_Smchd1_TRF2_pLVP041_non filtered/';
data(12).dataset2Dir = '11_08_2014_HeLaS_KD_Smchd1_TRF2_pLVP041_non filtered/';
data(12).dataset1ShortName = 'L dataset';
data(12).dataset2ShortName = 'S dataset';
data(12).distributions1 = [];
data(12).distributions2 = [];
data(12).fits = [];

data(13).shortName = '11-08-2014 pLVP042';
data(13).rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/';
data(13).dataset1Dir = '11_08_2014_HeLaL_KD_Smchd1_TRF2_pLVP042_non filtered/';
data(13).dataset2Dir = '11_08_2014_HeLaS_KD_Smchd1_TRF2_pLVP042_non filtered/';
data(13).dataset1ShortName = 'L dataset';
data(13).dataset2ShortName = 'S dataset';
data(13).distributions1 = [];
data(13).distributions2 = [];
data(13).fits = [];

data(14).shortName = '11-08-2014 TrF2';
data(14).rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/';
data(14).dataset1Dir = '11_08_2014_HeLaL_KD_Smchd1_TRF2_pLVP TRF2_non filtered/';
data(14).dataset2Dir = '11_08_2014_HeLaS_KD_Smchd1_TRF2_pLVP TRF2_non filtered/';
data(14).dataset1ShortName = 'L dataset';
data(14).dataset2ShortName = 'S dataset';
data(14).distributions1 = [];
data(14).distributions2 = [];
data(14).fits = [];

%==========================================================================
% 13-08-2014 TrF2
%==========================================================================
data(15).shortName = '13-08-2014 pSuper';
data(15).rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list_not_filtered/';
data(15).dataset1Dir = '13_08_2014_HelaL_SmchD1_TRF2_KD_FISH_pSuper_Mol_list_not_filtered/';
data(15).dataset2Dir = '13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_pSuper_Mol_list_not_filtered/';
data(15).dataset1ShortName = 'L dataset';
data(15).dataset2ShortName = 'S dataset';
data(15).distributions1 = [];
data(15).distributions2 = [];
data(15).fits = [];

data(16).shortName = '13-08-2014 pLVP041';
data(16).rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list_not_filtered/';
data(16).dataset1Dir = '13_08_2014_HelaL_SmchD1_TRF2_KD_FISH_pLVP041_Mol_list_not_filtered/';
data(16).dataset2Dir = '13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_pLVP041_Mol_list_not_filtered/';
data(16).dataset1ShortName = 'L dataset';
data(16).dataset2ShortName = 'S dataset';
data(16).distributions1 = [];
data(16).distributions2 = [];
data(16).fits = [];

data(17).shortName = '13-08-2014 pLVP042';
data(17).rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list_not_filtered/';
data(17).dataset1Dir = '13_08_2014_HelaL_SmchD1_TRF2_KD_FISH_pLVP042_Mol_list_not_filtered/';
data(17).dataset2Dir = '13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_pLVP042_Mol_list_not_filtered/';
data(17).dataset1ShortName = 'L dataset';
data(17).dataset2ShortName = 'S dataset';
data(17).distributions1 = [];
data(17).distributions2 = [];
data(17).fits = [];

data(18).shortName = '13-08-2014 TrF2';
data(18).rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list_not_filtered/';
data(18).dataset1Dir = '13_08_2014_HelaL_SmchD1_TRF2_KD_FISH_TRF2_Mol_list_not_filtered/';
data(18).dataset2Dir = '13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_TRF2_Mol_list_not_filtered/';
data(18).dataset1ShortName = 'L dataset';
data(18).dataset2ShortName = 'S dataset';
data(18).distributions1 = [];
data(18).distributions2 = [];
data(18).fits = [];

%% Verify that all directories are correct.
for dirCtr = 1:length(data)
    completeDir1 = [data(dirCtr).rootDir data(dirCtr).dataset1Dir];
    completeDir2 = [data(dirCtr).rootDir data(dirCtr).dataset2Dir];
    
    A = exist(completeDir1, 'dir');
    B = exist(completeDir2, 'dir');
    
    if A == 0
        error(['Error: directory ' completeDir1 ' does not exist.'])
    elseif B == 0
        error(['Error: directory ' completeDir2 ' does not exist.'])
    end
end
clear dirCtr

%% Primary processing loop.

for dataCtr = 1:length(data)
% Loops over all the data files defined above.
disp(['Processing dataset ' data(dataCtr).shortName])

completeDir1 = [data(dataCtr).rootDir data(dataCtr).dataset1Dir];
completeDir2 = [data(dataCtr).rootDir data(dataCtr).dataset2Dir];

LFiles = dir(completeDir1);
SFiles = dir(completeDir2);

%% Filter out upper level directors.
LFiles = LFiles(3:end);
SFiles = SFiles(3:end);

%% Process the data within each file.
clear LProcData SProcData
LProcData(length(LFiles),1).M1 = 0;
LProcData(length(LFiles),1).M2 = 0;
LProcData(length(LFiles),1).M2Mag = 0;
LProcData(length(LFiles),1).numLoc = 0;
LProcData(length(LFiles),1).volume = 0;

SProcData(length(SFiles),1).M1 = 0;
SProcData(length(SFiles),1).M2 = 0;
SProcData(length(SFiles),1).M2Mag = 0;
SProcData(length(SFiles),1).numLoc = 0;
SProcData(length(SFiles),1).volume = 0;

% process_data(fileName) is custom function call.
if useParallel
    parfor ctr = 1:length(LFiles)
        LFileName = [completeDir1 LFiles(ctr).name];
        LData = tdfread(LFileName);
        LDataF = [LData.Xc LData.Yc LData.Zc];
        LProcData(ctr) = process_data(LDataF, k, Eps, minLoc);
    end
    parfor ctr = 1:length(SFiles)
        SFileName = [completeDir2 SFiles(ctr).name];
        SData = tdfread(SFileName);
        SDataF = [SData.Xc SData.Yc SData.Zc];
        SProcData(ctr) = process_data(SDataF, k, Eps, minLoc);
    end
else
    for ctr = 1:length(LFiles)
        LFileName = [completeDir1 LFiles(ctr).name];
        LData = tdfread(LFileName);
        LDataF = [LData.Xc LData.Yc LData.Zc];
        LProcData(ctr) = process_data(LDataF, k, Eps, minLoc);
    end
    for ctr = 1:length(SFiles)
        SFileName = [completeDir2 SFiles(ctr).name];
        SData = tdfread(SFileName);
        SDataF = [SData.Xc SData.Yc SData.Zc];
        SProcData(ctr) = process_data(SDataF, k, Eps, minLoc);
    end
end

%% Combine distrubtions from all elements of the data structures.
LAllData = struct('M1', [], 'M2', [], 'M2Mag', [], 'numLoc', [], 'volume', []);
SAllData = struct('M1', [], 'M2', [], 'M2Mag', [], 'numLoc', [], 'volume', []);

for ctr = 1:length(LFiles)
    LAllData.M1 = cat(1, LAllData.M1, LProcData(ctr).M1);
    LAllData.M2 = cat(1, LAllData.M2, LProcData(ctr).M2);
    LAllData.M2Mag = cat(1, LAllData.M2Mag, LProcData(ctr).M2Mag);
    LAllData.numLoc = cat(1, LAllData.numLoc, LProcData(ctr).numLoc);
    LAllData.volume = cat(1, LAllData.volume, LProcData(ctr).volume);
end

for ctr = 1:length(SFiles)
    SAllData.M1 = cat(1, SAllData.M1, SProcData(ctr).M1);
    SAllData.M2 = cat(1, SAllData.M2, SProcData(ctr).M2);
    SAllData.M2Mag = cat(1, SAllData.M2Mag, SProcData(ctr).M2Mag);
    SAllData.numLoc = cat(1, SAllData.numLoc, SProcData(ctr).numLoc);
    SAllData.volume = cat(1, SAllData.volume, SProcData(ctr).volume);
end

%% Create the bins for plotting the distributions from above.
% First, it is determined which of the two datasets, S or L, has the
% largest and smallest values in each field. Next, the bins are determined
% by partitioning the range between between these values into numBins
% equally-sized intervals. These bins are used to normalize the
% distributions.
numBins = 20;
bins = struct('M1', [], 'M2', [], 'M2Mag', [], 'numLoc', [], 'volume', []);
fields = fieldnames(bins);

for ctr = 1:numel(fields)
    minBin = min([min(LAllData.(fields{ctr})(:)) min(SAllData.(fields{ctr})(:))]);
    maxBin = max([max(LAllData.(fields{ctr})(:)) max(SAllData.(fields{ctr})(:))]);
    bins.(fields{ctr}) = linspace(minBin, maxBin, numBins);    
end

% Write distributions out to the external data structure.
clear distributions1 distributions2
data(dataCtr).distributions1 = LAllData;
data(dataCtr).distributions2 = SAllData;

%% Plot the normalized distributions of the cluster statistics.
close all
[LN, LBIN] = histc(LAllData.M2, bins.M2);
[SN, SBIN] = histc(SAllData.M2, bins.M2);

disp(['Distributions for data set ' data(dataCtr).shortName])

% Set the size of the figure window.
subplot(2,2,1)
hFig = gcf();
set(hFig, 'Position', [100, 100, 1600, 1000])

% Second order moments along x, y, and z.
% Compute the normalization factor.
dx = diff(bins.M2);
dx = dx(1);

LNorm = sum(dx * LN);
SNorm = sum(dx * SN);

bar(bins.M2, [LN ./ repmat(LNorm, size(LN,1), 1), SN ./ repmat(SNorm, size(SN,1), 1)], 'histc')
legend('Long M_x^2', 'Long M_y^2', 'Long M_z^2', 'Short M_x^2', 'Short M_y^2', 'Short M_z^2')
title('Second moments about x,y, and z for long and short data sets')
xlabel('M^2, nm^2')
ylabel('Normalized frequency')
grid on

% Plot the normalized distributions of other quantities. (Plots normalized
% distributions for the magnitude of the square root of the radius of
% gyration, the number of localizations, and the volume.)
for ctr = 3:4
    [LN, LBIN] = histc(LAllData.(fields{ctr}), bins.(fields{ctr}));
    [SN, SBIN] = histc(SAllData.(fields{ctr}), bins.(fields{ctr}));
    
    % Compute the normalization factor.
    dx = diff(bins.(fields{ctr}));
    dx = dx(1);
    LNorm = sum(dx * LN);
    SNorm = sum(dx * SN);
    
    % Write to subplots 2 and 3.
    subplot(2,2, ctr - 1)
    bar(bins.(fields{ctr}), [LN / LNorm, SN / SNorm], 'histc')
    grid on
end

% Radius of gyration
subplot(2,2,2)
title('Square root of the radius of gyration of the clusters of points for L and S datasets')
xlabel('Square root of radius of gyration, nm')
ylabel('Normalized frequency')
legend('L dataset', 'S dataset')

% Number of localizations
subplot(2,2,3)
title('Number of localizations per cluster')
xlabel('Number of localizations')
ylabel('Normalized frequency')
legend('L dataset', 'S dataset')

% Volume
subplot(2,2,4)
minBin = min([min(LAllData.volume.^(1/3)) min(SAllData.volume.^(1/3))]);
maxBin = max([max(LAllData.volume.^(1/3)) max(SAllData.volume.^(1/3))]);
binsVol3 = linspace(minBin, maxBin, numBins); 
[LN, LBIN] = histc((LAllData.volume).^(1/3), binsVol3);
[SN, SBIN] = histc((SAllData.volume).^(1/3), binsVol3);

dx = diff(binsVol3);
dx = dx(1);
LNorm = sum(dx * LN);
SNorm = sum(dx * SN);

bar(binsVol3, [LN/ LNorm, SN / SNorm], 'histc')
title('Cube root of cluster volumes (characteristic linear size)')
xlabel('Volume^{(1/3)}, nm')
ylabel('Normalized frequency')
legend('L dataset', 'S dataset')
grid on

%% Perform a nonlinear least squares regression on Rg vs. number of localizations
% For a good discussion on fitting in Matlab, particularly robust fitting,
% see:
% <http://www.mathworks.ch/ch/help/curvefit/least-squares-fitting.html>

% For analytical expressions of the coefficients from nonlinear least
% squares fitting to a power law, see:
% <http://mathworld.wolfram.com/LeastSquaresFittingPowerLaw.html>

f = fittype('a*x.^b');

disp(['Scaling for data set ' data(dataCtr).shortName])

% Work with the first dataset.
FigHandle = figure('Position', [100, 100, 800, 800]);
subplot(2,1,1)
x1 = LAllData.numLoc;
y1 = LAllData.M2Mag;

[fit1,gof1,fitinfo1] = fit(x1,y1,f,'StartPoint',[17 0.33]);

residuals = fitinfo1.residuals;

I = abs(residuals) > 1.5 * std(residuals);
outliers = excludedata(x1,y1,'indices',I);

fitNoOutliers1 = fit(x1,y1,f,'StartPoint', [17 0.33], 'Exclude',outliers);

fitRobust1 = fit(x1,y1,f,'StartPoint',[17 0.33],'Robust','on');

plot(fit1,'b-', x1, y1, 'k.', outliers, 'm*')
hold on
plot(fitNoOutliers1,'r--')
plot(fitRobust1,'g-')
legend( 'Data', 'Outliers', 'Original fit', 'Fit with outliers excluded', 'Robust fit' )
hold off
grid on
title(data(dataCtr).dataset1ShortName)
xlabel('Number of localizations')
ylabel('R_g, nm')
xlim([0 700])
ylim([0 300])

% Work with the second dataset.
subplot(2,1,2)
x2 = SAllData.numLoc;
y2 = SAllData.M2Mag;

[fit2,gof2,fitinfo2] = fit(x2,y2,f,'StartPoint',[17 0.33]);

residuals = fitinfo2.residuals;

I = abs(residuals) > 1.5 * std(residuals);
outliers = excludedata(x2,y2,'indices',I);

fitNoOutliers2 = fit(x2,y2,f,'StartPoint', [17 0.33], 'Exclude',outliers);

fitRobust2 = fit(x2,y2,f,'StartPoint',[17 0.33],'Robust','on');

pause(1) % Ensures that the fit has time to work before plotted.
plot(fit2,'b-', x2, y2, 'k.', outliers, 'm*')
hold on
plot(fitNoOutliers2,'r--')
plot(fitRobust2,'g-')
legend( 'Data', 'Outliers', 'Original fit', 'Fit with outliers excluded', 'Robust fit' )
hold off
grid on
title(data(dataCtr).dataset2ShortName)
xlabel('Number of localizations')
ylabel('R_g, nm')
xlim([0 700])
ylim([0 300])

% Store fits in the external data array.
clear fits
data(dataCtr).fits.fit1 = fit1;
data(dataCtr).fits.fitNoOutliers1 = fitNoOutliers1;
data(dataCtr).fits.fitRobust1 = fitRobust1;
data(dataCtr).fits.fit2 = fit2;
data(dataCtr).fits.fitNoOutliers2 = fitNoOutliers2;
data(dataCtr).fits.fitRobust2 = fitRobust2;

%% Report statistics from distributions.
disp(['Statistics for experiment ' data(dataCtr).shortName '.'])
disp(['Number of clusters, L dataset: ' num2str(length(LAllData.numLoc), '%d')])
disp([' '])
disp(['Mean square root of the radius of gyration, L dataset: ' num2str(mean(LAllData.M2Mag), '%.2f') ' nm'])
disp(['Standard deviation: ' num2str(std(LAllData.M2Mag), '%.2f') ' nm'])
disp(' ')
disp(['Mean cube root of volume, L dataset: ' num2str(mean(LAllData.volume.^(1/3)), '%.2f') ' nm'])
disp(['Standard deviation: ' num2str(std(LAllData.volume.^(1/3)), '%.2f') ' nm'])
disp(' ')
disp(['Mean number of localizations, L dataset: ' num2str(mean(LAllData.numLoc), '%.2f')])
disp(['Standard deviation: ' num2str(std(LAllData.numLoc), '%.2f')])
disp('-------------------------------------------------------')
disp(['Number of clusters, S dataset: ' num2str(length(SAllData.numLoc), '%d') ])
disp([' '])
disp(['Mean square root of the radius of gyration, S dataset: ' num2str(mean(SAllData.M2Mag), '%.2f') ' nm'])
disp(['Standard deviation: ' num2str(std(SAllData.M2Mag), '%.2f') ' nm'])
disp(' ')
disp(['Mean cube root of volume, S dataset: ' num2str(mean(SAllData.volume.^(1/3)), '%.2f') ' nm'])
disp(['Standard deviation: ' num2str(std(SAllData.volume.^(1/3)), '%.2f') ' nm'])
disp(' ')
disp(['Mean number of localizations, S dataset: ' num2str(mean(SAllData.numLoc), '%.2f')])
disp(['Standard deviation: ' num2str(std(SAllData.numLoc), '%.2f')])
disp(' ')

end % Ends loop over datasets.