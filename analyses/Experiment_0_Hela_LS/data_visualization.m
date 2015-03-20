% Helper functions for plotting and consolidating statistics from the fully
% processed data structure.
%
% These functions require a .mat file containing the relevant data loaded
% into the workspace.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2015/03/19 $ $REVISION: 1.3 $

%% Original dataset : Hela L

% Access to the helper functions for plotting
cd ../../private/

numBins = 20;

disp('===================================================================')
disp('11-06-2014 Original Dataset')
disp('===================================================================')

filterDataNames = {'Original Data'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Original dataset / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Original dataset / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% Original dataset : Hela S

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Original dataset / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Original dataset / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

filterData = findData(data, filterDataNames);

%% Original dataset : Plots of means

% Mean RgTrans's for all datasets
clear figParams
figParams.title = 'Mean R_g';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMeansPaired(filterData, fieldName, figParams, errorBar, fullScreen);

% Volume for all datasets
clear figParams
figParams.title = 'Mean Volume';
figParams.ylim = [0 15e6];
figParams.ylabel = 'Volume, nm^3';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMeansPaired(filterData, fieldName, figParams, errorBar, fullScreen);

%% Original dataset : Plots of medians

% Median RgTrans's for all datasets
clear figParams
figParams.title = 'Median R_g';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMediansPaired(filterData, fieldName, figParams, errorBar, fullScreen);

% Volume for all datasets
clear figParams
figParams.title = 'Median Volume';
figParams.ylim = [0 9e6];
figParams.ylabel = 'Volume, nm^3';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMediansPaired(filterData, fieldName, figParams, errorBar, fullScreen);


% Switch back to parent directory
cd ..
