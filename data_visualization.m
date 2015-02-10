% Helper functions for plotting and consolidating statistics from the fully
% processed data structure.
%
% These functions require a .mat file containing the relevant data loaded
% into the workspace.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/12/05 $ $REVISION: 1.2 $

%% FISH vs. TRF1 IF : Hela L

% Access to the helper functions for plotting
cd private/

numBins = 20;

disp('===================================================================')
disp('Hela L FISH vs. TRF1 IF')
disp('===================================================================')

filterDataNames = {'WT';
                   'TRF1 1000';
                   'TRF1 2000'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'FISH vs. TRF1 Immunofluorescence / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'FISH vs. TRF1 Immunofluorescence / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% FISH vs. TRF1 IF : Plots of Means

filterData = findData(data, filterDataNames);

% Mean RgTrans's for all datasets
clear figParams
figParams.title = 'Mean R_g';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

% Volume for all datasets
clear figParams
figParams.title = 'Mean Volume';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Volume, nm^3';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

%% FISH vs. TRF1 IF : Plots of Medians

% Median RgTrans's for all datasets
clear figParams
figParams.title = 'Median R_g';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

% Volume for all datasets
clear figParams
figParams.title = 'Median Volume';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Volume, nm^3';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

% Switch back to parent directory
cd ..
