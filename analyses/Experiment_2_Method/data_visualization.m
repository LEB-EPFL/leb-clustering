% Helper functions for plotting and consolidating statistics from the fully
% processed data structure.
%
% These functions require a .mat file containing the relevant data loaded
% into the workspace.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/03/19 $ $REVISION: 1.3 $

%% UV Laser, pSuper : Hela L

% Access to the helper functions for plotting
cd ../../private/

numBins = 20;

disp('===================================================================')
disp('Using the UV Laser, pSuper')
disp('===================================================================')

filterDataNames = {'No UV pSuper';
                   'UV pSuper'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'UV Laser pSuper / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'UV Laser pSuper / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% UV Laser, pSuper : Hela S

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'UV Laser pSuper / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'UV Laser pSuper / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% UV Laser, TRF2 : Hela L

filterDataNames = {'No UV TRF2';
                   'UV TRF2'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'UV Laser TRF2 / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'UV Laser TRF2 / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% UV Laser, TRF2 : Hela S

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'UV Laser TRF2 / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'UV Laser TRF2 / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% UV Laser : Plots of Means

filterDataNames = {'No UV pSuper';
                   'UV pSuper';
                   'No UV TRF2';
                   'UV TRF2'};
filterData = findData(data, filterDataNames);

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
figParams.ylim = [0 8e6];
figParams.ylabel = 'Volume, nm^3';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMeansPaired(filterData, fieldName, figParams, errorBar, fullScreen);

%% UV Laser : Plots of Medians

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
figParams.ylim = [0 8e6];
figParams.ylabel = 'Volume, nm^3';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMediansPaired(filterData, fieldName, figParams, errorBar, fullScreen);

%% Number of frames, pSuper : Hela L

disp('===================================================================')
disp('Number of Frames, pSuper')
disp('===================================================================')

filterDataNames = {'fr10k pSuper';
                   'fr30k pSuper'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Number of frames pSuper / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Number of frames pSuper / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% Number of frames, pSuper : Hela S

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Number of frames pSuper / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Number of frames pSuper / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% Number of frames, TRF2 : Hela L

disp('===================================================================')
disp('Number of Frames, pSuper')
disp('===================================================================')

filterDataNames = {'fr10k TRF2';
                   'fr30k TRF2'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Number of frames TRF2 / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Number of frames TRF2 / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% Number of frames, TRF2 : Hela S

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Number of frames TRF2 / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Number of frames TRF2 / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% UV Laser : Plots of Means

filterDataNames = {'fr10k pSuper';
                   'fr30k pSuper';
                   'fr10k TRF2';
                   'fr30k TRF2'};
filterData = findData(data, filterDataNames);

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
figParams.ylim = [0 8e6];
figParams.ylabel = 'Volume, nm^3';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMeansPaired(filterData, fieldName, figParams, errorBar, fullScreen);

%% UV Laser : Plots of Medians

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
figParams.ylim = [0 8e6];
figParams.ylabel = 'Volume, nm^3';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMediansPaired(filterData, fieldName, figParams, errorBar, fullScreen);

% Switch back to parent directory
cd ..
