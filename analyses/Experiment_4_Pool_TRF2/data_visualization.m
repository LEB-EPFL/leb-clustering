% Helper functions for plotting and consolidating statistics from the fully
% processed data structure.
%
% These functions require a .mat file containing the relevant data loaded
% into the workspace.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2015/03/19 $ $REVISION: 1.3 $

%% Pooled data from TRF2 knockdowns : Hela L

% Access to the helper functions for plotting
cd ../../private/

numBins = 20;

disp('===================================================================')
disp('Pooled data from TRF2 knockdowns')
disp('===================================================================')

filterDataNames = {'Pooled pSuper';
                   'Pooled TRF2'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Pooled KD of TRF2 / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD TRF2 / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% Pooled data from TRF2 knockdowns : Hela S

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Pooled KD of TRF2 / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF2 / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

filterData = findData(data, filterDataNames);

%% Pooled data from TRF2 knockdowns : Plots of Means

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

%% Pooled data from TRF2 knockdowns : Plots of Medians

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

%% 11-08-2014 TRF2 knockdowns : Hela L
disp('===================================================================')
disp('11-08-2014 TRF2 knockdowns')
disp('===================================================================')

filterDataNames = {'11-08-2014 pSuper';
                   '11-08-2014 TRF2'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Pooled KD of TRF2 / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF2 / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 11-08-2014 TRF2 knockdowns : Hela S

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Pooled KD of TRF2/ Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF2 / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 11-08-2014 TRF2 knockdowns : Plot of Means

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

%% 11-08-2014 TRF2 knockdowns : Plot of Medians

filterData = findData(data, filterDataNames);

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

%% 13-08-2014 TRF2 knockdowns : Hela L
disp('===================================================================')
disp('13-08-2014 TRF2 knockdowns')
disp('===================================================================')

filterDataNames = {'13-08-2014 pSuper';
                   '13-08-2014 TRF2'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Pooled KD TRF2 / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF2 / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 13-08-2014 TRF2 knockdowns : Hela S
filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Pooled KD of TRF2 / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF2 / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

filterData = findData(data, filterDataNames);

%% 13-08-2014 TRF2 knockdowns : Plot of Means

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

%% 13-08-2014 TRF2 knockdowns: Plot of Medians

filterData = findData(data, filterDataNames);

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

%% 24-08-2014 TRF2 double knockdowns : Hela S
disp('===================================================================')
disp('24-08-2014 TRF1 and TRF2 double knockdowns')
disp('===================================================================')

filterDataNames = {'24-08-2014 pSuper';
                   '24-08-2014 TRF2';};
filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Pooled KD of TRF2 / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF2 / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

filterData = findData(data, filterDataNames);

%% 24-08-2014 TRF2 knockdowns : Plot of Means

% Mean RgTrans's for all datasets
clear figParams
figParams.title = 'Mean R_g';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

% Volume for all datasets
clear figParams
figParams.title = 'Mean Volume';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Volume, nm^3';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

%% 24-08-2014 TRF2 knockdowns : Plot of Medians

% Median RgTrans's for all datasets
clear figParams
figParams.title = 'Median R_g';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

% Volume for all datasets
clear figParams
figParams.title = 'Median Volume';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Volume, nm^3';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

%% 27-08-2014 TRF2 knockdowns : Hela S
disp('===================================================================')
disp('27-08-2014 TRF2 knockdowns')
disp('===================================================================')

filterDataNames = {'27-08-2014 pSuper';
                   '27-08-2014 TRF2'};
filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Pooled KD of TRF2 KD / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF2 KD / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 27-08-2014 TRF2 knockdowns : Plot of Means

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
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

% Volume for all datasets
clear figParams
figParams.title = 'Mean Volume';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Volume, nm^3';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

%% 27-08-2014 TRF2 knockdowns : Plot of Medians

filterData = findData(data, filterDataNames);

% Median RgTrans's for all datasets
clear figParams
figParams.title = 'Median R_g';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

% Volume for all datasets
clear figParams
figParams.title = 'Median Volume';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Volume, nm^3';
figParams.legend = {'Hela L'; 'Hela S'};
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

% Switch back to parent directory
cd ..
