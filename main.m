% The main script for analyzing the telomere data and producing reports.
%
% This script should be run after the analysis workflow is determined from
% data_mining.m.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/07/31 $ $REVISION: 0.2 $
%
%% Use parallel processing to speed up computation? (use 'false' if unsure)
useParallel = true;

if useParallel
    matlabpool open
end

%% Designate the files for analysis.
dataRootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Verena/11_06_2014_FISH_HelaS_L/11_06_2014_FISH_Hela_S_L/';
dataSetLDir = '11_06_2014_Hela_L_FISH/Hela L FISH molecule lists/';
dataSetSDir = '11_06_2014_Hela_S_FISH/Hela S FISH molecule lists/';

LFiles = dir([dataRootDir dataSetLDir]);
SFiles = dir([dataRootDir dataSetSDir]);
%% Filter out anomalously long file name and upper level directors.
LFiles = LFiles(3:end-1);
SFiles = SFiles(3:end-1);

%% Process the data within each file.
LProcData(length(LFiles),1).M1 = 0;
LProcData(length(LFiles),1).M2 = 0;
LProcData(length(LFiles),1).M2Mag = 0;
LProcData(length(LFiles),1).numLoc = 0;
LProcData(length(LFiles),1).volume = 0;
LProcData(length(LFiles),1).fileName = 0;
LProcData(length(LFiles),1).shortName = 0;
SProcData = LProcData;


% process_data(fileName) is custom function call.
if useParallel
    parfor ctr = 1:length(LFiles)
        LFileName = [dataRootDir dataSetLDir LFiles(ctr).name];
        SFileName = [dataRootDir dataSetSDir SFiles(ctr).name];
        
        LProcData(ctr) = process_data(LFileName);
        SProcData(ctr) = process_data(SFileName);

        LProcData(ctr).shortName = LFiles(ctr).name;
        SProcData(ctr).shortName = SFiles(ctr).name;
    end    
else
    for ctr = 1:length(LFiles)
        LFileName = [dataRootDir dataSetLDir LFiles(ctr).name];
        SFileName = [dataRootDir dataSetSDir SFiles(ctr).name];

        LProcData(ctr) = process_data(LFileName);
        SProcData(ctr) = process_data(SFileName);

        LProcData(ctr).shortName = LFiles(ctr).name;
        SProcData(ctr).shortName = SFiles(ctr).name;
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

%% Plot the normalized distribution of second central moments in x,y,z.
figure;
[LN, LBIN] = histc(LAllData.M2, bins.M2);
[SN, SBIN] = histc(SAllData.M2, bins.M2);

% Compute the normalization factor.
dx = diff(bins.M2);
dx = dx(1);

LNorm = sum(dx * LN);
SNorm = sum(dx * SN);

bar(bins.M2, [LN ./ repmat(LNorm, size(LN,1), 1), SN ./ repmat(SNorm, size(SN,1), 1)], 'histc')
legend('Long M_x^2', 'Long M_y^2', 'Long M_z^2', 'Short M_x^2', 'Short M_y^2', 'Short M_z^2')
title('Second moments about x,y, and z for long and short data sets')
xlabel('M^2, nm')
ylabel('Normalized frequency')
grid on

% Plot the normalized distributions of other quantities.
% (Plots normalized distributions for the magnitude of the second central
% moment, the number of localizations, and the volume.)
for ctr = 3:4
    figure;
    [LN, LBIN] = histc(LAllData.(fields{ctr}), bins.(fields{ctr}));
    [SN, SBIN] = histc(SAllData.(fields{ctr}), bins.(fields{ctr}));
    
    % Compute the normalization factor.
    dx = diff(bins.(fields{ctr}));
    dx = dx(1);
    LNorm = sum(dx * LN);
    SNorm = sum(dx * SN);
    
    bar(bins.(fields{ctr}), [LN / LNorm, SN / SNorm], 'histc')
    grid on
end

% Second moment magnitudes
figure(2)
title('Magnitude of the second moments of clusters of points for L and S datasets')
xlabel('Magnitude of the second moment, nm')
ylabel('Normalized frequency')
legend('L dataset', 'S dataset')

% Number of localizations
figure(3)
title('Number of localizations per cluster')
xlabel('Number of localizations')
ylabel('Normalized frequency')
legend('L dataset', 'S dataset')

% Volume
figure(4)
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

%% Report statistics from distributions.
disp(['Number of clusters, L dataset: ' num2str(length(LAllData.numLoc), '%.2f')])
disp([' '])
disp(['Mean second moment size, L dataset: ' num2str(mean(LAllData.M2Mag), '%.2f') ' nm'])
disp(['Standard deviation: ' num2str(std(LAllData.M2Mag), '%.2f') ' nm'])
disp(' ')
disp(['Mean cube root of volume, L dataset: ' num2str(mean(LAllData.volume.^(1/3)), '%.2f') ' nm'])
disp(['Standard deviation: ' num2str(std(LAllData.volume.^(1/3)), '%.2f') ' nm'])
disp(' ')
disp(['Mean number of localizations, L dataset: ' num2str(mean(LAllData.numLoc), '%.2f')])
disp(['Standard deviation: ' num2str(std(LAllData.numLoc), '%.2f')])
disp('-------------------------------------------------------')
disp(['Number of clusters, S dataset: ' num2str(length(SAllData.numLoc), '%.2f') ])
disp([' '])
disp(['Mean second moment size, S dataset: ' num2str(mean(SAllData.M2Mag), '%.2f') ' nm'])
disp(['Standard deviation: ' num2str(std(SAllData.M2Mag), '%.2f') ' nm'])
disp(' ')
disp(['Mean cube root of volume, S dataset: ' num2str(mean(SAllData.volume.^(1/3)), '%.2f') ' nm'])
disp(['Standard deviation: ' num2str(std(SAllData.volume.^(1/3)), '%.2f') ' nm'])
disp(' ')
disp(['Mean number of localizations, S dataset: ' num2str(mean(SAllData.numLoc), '%.2f')])
disp(['Standard deviation: ' num2str(std(SAllData.numLoc), '%.2f')])
disp(' ')