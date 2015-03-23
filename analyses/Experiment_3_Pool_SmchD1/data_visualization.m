% Helper functions for plotting and consolidating statistics from the fully
% processed data structure.
%
% These functions require a .mat file containing the relevant data loaded
% into the workspace.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/12/05 $ $REVISION: 1.2 $

%% Pooled data from SmchD1 knockdowns : Hela L

% Load the data into memory.
load('matlab.mat', 'data');

% Save current directory location
currDir = pwd;

% Access to the helper functions for plotting
cd private/

numBins = 20;

disp('===================================================================')
disp('Pooled data from SmchD1 knockdowns')
disp('===================================================================')

filterDataNames = {'Pooled pSuper';
                   'Pooled pLVP041';
                   'Pooled pLVP042'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Pooled SmchD1 data / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled SmchD1 data / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% Pooled data from SmchD1 knockdowns : Hela S

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Pooled SmchD1 data / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled SmchD1 data / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% Pooled data from SmchD1 knockdowns : Plots of Means

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

%% Pooled data from SmchD1 knockdowns : Plots of Medians

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

%% 18-06-2014 SmchD1 knockdowns : Hela L
disp('===================================================================')
disp('18-06-2014 TRF2 SmchD1')
disp('===================================================================')

filterDataNames = {'18-06-2014 pSuper';
                   '18-06-2014 pLVP041';
                   '18-06-2014 pLVP042'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = '18-06-2014 SmchD1 data / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = '18-06-2014 SmchD1 data / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 18-06-2014 SmchD1 knockdowns : Hela S

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = '18-06-2014 SmchD1 data / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = '18-06-2014 SmchD1 data / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 18-06-2014 SmchD1 knockdowns : Plot of Means

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

%% 18-06-2014 SmchD1 knockdowns : Plot of Medians

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

%% 19-06-2014 SmchD1 knockdowns : Hela L
disp('===================================================================')
disp('19-06-2014 TRF2 SmchD1')
disp('===================================================================')

filterDataNames = {'19-06-2014 pSuper';
                   '19-06-2014 pLVP041';
                   '19-06-2014 pLVP042'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = '19-06-2014 SmchD1 data / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = '19-06-2014 SmchD1 data / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 19-06-2014 SmchD1 knockdowns : Hela S

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = '19-06-2014 SmchD1 data / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = '19-06-2014 SmchD1 data / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 19-06-2014 SmchD1 knockdowns : Plot of Means

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

%% 19-06-2014 SmchD1 knockdowns : Plot of Medians

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

%% 30-06-2014 SmchD1 knockdowns : Hela L
disp('===================================================================')
disp('30-06-2014 TRF2 SmchD1')
disp('===================================================================')

filterDataNames = {'30-06-2014 pSuper';
                   '30-06-2014 pLVP041';
                   '30-06-2014 pLVP042'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = '30-06-2014 SmchD1 data / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = '30-06-2014 SmchD1 data / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 30-06-2014 SmchD1 knockdowns : Hela S

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = '30-06-2014 SmchD1 data / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = '30-06-2014 SmchD1 data / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 30-06-2014 SmchD1 knockdowns : Plot of Means

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

%% 30-06-2014 SmchD1 knockdowns : Plot of Medians

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

% %% 02-07-2014 SmchD1 knockdowns : Hela L
% disp('===================================================================')
% disp('02-07-2014 TRF2 SmchD1')
% disp('===================================================================')
% 
% filterDataNames = {'02-07-2014 pSuper';
%                    '02-07-2014 pLVP041';
%                    '02-07-2014 pLVP042'};
% filterData = findData(data, filterDataNames, 'L dataset');
% 
% clear figParams
% figParams.title = '02-07-2014 SmchD1 data / Hela L';
% figParams.xlabel = 'R_g, nm';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 200];
% figParams.ylim = [0 0.03];
% plotDist(filterData, 'RgTrans', numBins, figParams)
% 
% clear figParams
% figParams.title = '02-07-2014 SmchD1 data / Hela L';
% figParams.xlabel = 'Volume, nm^3';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 3e7];
% figParams.ylim = [0 2e-7];
% plotDist(filterData, 'volume', numBins, figParams)
% 
% printStatistics(filterData);
%
% %% 02-07-2014 SmchD1 knockdowns : Hela S
% 
% filterData = findData(data, filterDataNames, 'S dataset');
% 
% clear figParams
% figParams.title = '02-07-2014 SmchD1 data / Hela S';
% figParams.xlabel = 'R_g, nm';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 200];
% figParams.ylim = [0 0.03];
% plotDist(filterData, 'RgTrans', numBins, figParams)
% 
% clear figParams
% figParams.title = '02-07-2014 SmchD1 data / Hela S';
% figParams.xlabel = 'Volume, nm^3';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 3e7];
% figParams.ylim = [0 2e-7];
% plotDist(filterData, 'volume', numBins, figParams)
% 
% printStatistics(filterData);
% 
% %% 02-07-2014 SmchD1 knockdowns : Plot of Means
% 
% filterData = findData(data, filterDataNames, 'L dataset');
% 
% % Mean RgTrans's for all datasets
% clear figParams
% figParams.title = 'Mean R_g';
% figParams.ylim = [0 120];
% figParams.ylabel = 'R_g, nm';
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'RgTrans';
% plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% % Volume for all datasets
% clear figParams
% figParams.title = 'Mean Volume';
% figParams.ylim = [0 8e6];
% figParams.ylabel = 'Volume, nm^3';
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'volume';
% plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% %% 02-07-2014 SmchD1 knockdowns : Plot of Medians
% 
% % Median RgTrans's for all datasets
% clear figParams
% figParams.title = 'Median R_g';
% figParams.ylim = [0 120];
% figParams.ylabel = 'R_g, nm';
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'RgTrans';
% plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% % Volume for all datasets
% clear figParams
% figParams.title = 'Median Volume';
% figParams.ylim = [0 8e6];
% figParams.ylabel = 'Volume, nm^3';
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'volume';
% plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% %% 29-07-2014 SmchD1 knockdowns : Hela L
% disp('===================================================================')
% disp('29-07-2014 TRF2 SmchD1')
% disp('===================================================================')
% 
% filterDataNames = {'29-07-2014 pSuper';
%                    '29-07-2014 pLVP041';
%                    '29-07-2014 pLVP042'};
% filterData = findData(data, filterDataNames, 'L dataset');
% 
% clear figParams
% figParams.title = '29-07-2014 SmchD1 data / Hela L';
% figParams.xlabel = 'R_g, nm';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 200];
% figParams.ylim = [0 0.03];
% plotDist(filterData, 'RgTrans', numBins, figParams)
% 
% clear figParams
% figParams.title = '29-07-2014 SmchD1 data / Hela L';
% figParams.xlabel = 'Volume, nm^3';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 3e7];
% figParams.ylim = [0 2e-7];
% plotDist(filterData, 'volume', numBins, figParams)
% 
% printStatistics(filterData);
% 
% %% 18-06-2014 SmchD1 knockdowns : Hela S
% 
% filterData = findData(data, filterDataNames, 'S dataset');
% 
% clear figParams
% figParams.title = '29-07-2014 SmchD1 data / Hela S';
% figParams.xlabel = 'R_g, nm';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 200];
% figParams.ylim = [0 0.03];
% plotDist(filterData, 'RgTrans', numBins, figParams)
% 
% clear figParams
% figParams.title = '29-07-2014 SmchD1 data / Hela S';
% figParams.xlabel = 'Volume, nm^3';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 3e7];
% figParams.ylim = [0 2e-7];
% plotDist(filterData, 'volume', numBins, figParams)
% 
% printStatistics(filterData);
% 
% %% 29-07-2014 SmchD1 knockdowns : Plot of Means
% 
% filterData = findData(data, filterDataNames);
% 
% % Mean RgTrans's for all datasets
% clear figParams
% figParams.title = 'Mean R_g';
% figParams.ylim = [0 120];
% figParams.ylabel = 'R_g, nm';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'RgTrans';
% plotMeansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% % Volume for all datasets
% clear figParams
% figParams.title = 'Mean Volume';
% figParams.ylim = [0 8e6];
% figParams.ylabel = 'Volume, nm^3';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'volume';
% plotMeansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% %% 29-07-2014 SmchD1 knockdowns : Plot of Medians
% 
% % Median RgTrans's for all datasets
% clear figParams
% figParams.title = 'Median R_g';
% figParams.ylim = [0 120];
% figParams.ylabel = 'R_g, nm';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'RgTrans';
% plotMediansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% % Volume for all datasets
% clear figParams
% figParams.title = 'Median Volume';
% figParams.ylim = [0 8e6];
% figParams.ylabel = 'Volume, nm^3';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'volume';
% plotMediansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% %% 30-07-2014 SmchD1 knockdowns : Hela L
% disp('===================================================================')
% disp('30-07-2014 TRF2 SmchD1')
% disp('===================================================================')
% 
% filterDataNames = {'30-07-2014 pSuper';
%                    '30-07-2014 pLVP041';
%                    '30-07-2014 pLVP042'};
% filterData = findData(data, filterDataNames, 'L dataset');
% 
% clear figParams
% figParams.title = '30-07-2014 SmchD1 data / Hela L';
% figParams.xlabel = 'R_g, nm';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 200];
% figParams.ylim = [0 0.03];
% plotDist(filterData, 'RgTrans', numBins, figParams)
% 
% clear figParams
% figParams.title = '30-07-2014 SmchD1 data / Hela L';
% figParams.xlabel = 'Volume, nm^3';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 3e7];
% figParams.ylim = [0 2e-7];
% plotDist(filterData, 'volume', numBins, figParams)
% 
% printStatistics(filterData);
% 
% %% 30-07-2014 SmchD1 knockdowns : Hela S
% 
% filterData = findData(data, filterDataNames, 'S dataset');
% 
% clear figParams
% figParams.title = '30-07-2014 SmchD1 data / Hela S';
% figParams.xlabel = 'R_g, nm';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 200];
% figParams.ylim = [0 0.03];
% plotDist(filterData, 'RgTrans', numBins, figParams)
% 
% clear figParams
% figParams.title = '30-07-2014 SmchD1 data / Hela S';
% figParams.xlabel = 'Volume, nm^3';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 3e7];
% figParams.ylim = [0 2e-7];
% plotDist(filterData, 'volume', numBins, figParams)
% 
% printStatistics(filterData);
% 
% %% 30-07-2014 SmchD1 knockdowns : Plot of Means
% 
% filterData = findData(data, filterDataNames);
% 
% % Mean RgTrans's for all datasets
% clear figParams
% figParams.title = 'Mean R_g';
% figParams.ylim = [0 120];
% figParams.ylabel = 'R_g, nm';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'RgTrans';
% plotMeansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% % Volume for all datasets
% clear figParams
% figParams.title = 'Mean Volume';
% figParams.ylim = [0 8e6];
% figParams.ylabel = 'Volume, nm^3';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'volume';
% plotMeansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% %% 30-07-2014 SmchD1 knockdowns : Plot of Medians
% 
% % Median RgTrans's for all datasets
% clear figParams
% figParams.title = 'Median R_g';
% figParams.ylim = [0 120];
% figParams.ylabel = 'R_g, nm';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'RgTrans';
% plotMediansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% % Volume for all datasets
% clear figParams
% figParams.title = 'Median Volume';
% figParams.ylim = [0 8e6];
% figParams.ylabel = 'Volume, nm^3';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'volume';
% plotMediansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% %% 11-08-2014 SmchD1 knockdowns : Hela L
% disp('===================================================================')
% disp('11-08-2014 TRF2 SmchD1')
% disp('===================================================================')
% 
% filterDataNames = {'11-08-2014 pSuper';
%                    '11-08-2014 pLVP041';
%                    '11-08-2014 pLVP042'};
% filterData = findData(data, filterDataNames, 'L dataset');
% 
% clear figParams
% figParams.title = '11-08-2014 SmchD1 data / Hela L';
% figParams.xlabel = 'R_g, nm';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 200];
% figParams.ylim = [0 0.03];
% plotDist(filterData, 'RgTrans', numBins, figParams)
% 
% clear figParams
% figParams.title = '11-08-2014 SmchD1 data / Hela L';
% figParams.xlabel = 'Volume, nm^3';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 3e7];
% figParams.ylim = [0 2e-7];
% plotDist(filterData, 'volume', numBins, figParams)
% 
% printStatistics(filterData);
% 
% %% 11-08-2014 SmchD1 knockdowns : Hela S
% 
% filterData = findData(data, filterDataNames, 'S dataset');
% 
% clear figParams
% figParams.title = '11-08-2014 SmchD1 data / Hela S';
% figParams.xlabel = 'R_g, nm';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 200];
% figParams.ylim = [0 0.03];
% plotDist(filterData, 'RgTrans', numBins, figParams)
% 
% clear figParams
% figParams.title = '11-08-2014 SmchD1 data / Hela S';
% figParams.xlabel = 'Volume, nm^3';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 3e7];
% figParams.ylim = [0 2e-7];
% plotDist(filterData, 'volume', numBins, figParams)
% 
% printStatistics(filterData);
% 
% %% 11-08-2014 SmchD1 knockdowns : Plot of Means
% 
% filterData = findData(data, filterDataNames);
% 
% % Mean RgTrans's for all datasets
% clear figParams
% figParams.title = 'Mean R_g';
% figParams.ylim = [0 120];
% figParams.ylabel = 'R_g, nm';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'RgTrans';
% plotMeansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% % Volume for all datasets
% clear figParams
% figParams.title = 'Mean Volume';
% figParams.ylim = [0 8e6];
% figParams.ylabel = 'Volume, nm^3';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'volume';
% plotMeansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% %% 11-08-2014 SmchD1 knockdowns : Plot of Medians
% 
% % Median RgTrans's for all datasets
% clear figParams
% figParams.title = 'Median R_g';
% figParams.ylim = [0 120];
% figParams.ylabel = 'R_g, nm';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'RgTrans';
% plotMediansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% % Volume for all datasets
% clear figParams
% figParams.title = 'Median Volume';
% figParams.ylim = [0 8e6];
% figParams.ylabel = 'Volume, nm^3';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'volume';
% plotMediansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% %% 13-08-2014 SmchD1 knockdowns : Hela L
% disp('===================================================================')
% disp('13-08-2014 TRF2 SmchD1')
% disp('===================================================================')
% 
% filterDataNames = {'13-08-2014 pSuper';
%                    '13-08-2014 pLVP041';
%                    '13-08-2014 pLVP042'};
% filterData = findData(data, filterDataNames, 'L dataset');
% 
% clear figParams
% figParams.title = '13-08-2014 SmchD1 data / Hela L';
% figParams.xlabel = 'R_g, nm';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 200];
% figParams.ylim = [0 0.03];
% plotDist(filterData, 'RgTrans', numBins, figParams)
% 
% clear figParams
% figParams.title = '13-08-2014 SmchD1 data / Hela L';
% figParams.xlabel = 'Volume, nm^3';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 3e7];
% figParams.ylim = [0 2e-7];
% plotDist(filterData, 'volume', numBins, figParams)
% 
% printStatistics(filterData);
% 
% %% 13-08-2014 SmchD1 knockdowns : Hela S
% 
% filterData = findData(data, filterDataNames, 'S dataset');
% 
% clear figParams
% figParams.title = '13-08-2014 SmchD1 data / Hela S';
% figParams.xlabel = 'R_g, nm';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 200];
% figParams.ylim = [0 0.03];
% plotDist(filterData, 'RgTrans', numBins, figParams)
% 
% clear figParams
% figParams.title = '13-08-2014 SmchD1 data / Hela S';
% figParams.xlabel = 'Volume, nm^3';
% figParams.ylabel = 'Normalized frequency';
% figParams.legend = filterDataNames;
% figParams.xlim = [0 3e7];
% figParams.ylim = [0 2e-7];
% plotDist(filterData, 'volume', numBins, figParams)
% 
% printStatistics(filterData);
% 
% %% 13-08-2014 SmchD1 knockdowns : Plot of Means
% 
% filterData = findData(data, filterDataNames);
% 
% % Mean RgTrans's for all datasets
% clear figParams
% figParams.title = 'Mean R_g';
% figParams.ylim = [0 120];
% figParams.ylabel = 'R_g, nm';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'RgTrans';
% plotMeansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% % Volume for all datasets
% clear figParams
% figParams.title = 'Mean Volume';
% figParams.ylim = [0 8e6];
% figParams.ylabel = 'Volume, nm^3';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'volume';
% plotMeansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% %% 13-08-2014 SmchD1 knockdowns : Plot of Medians
% 
% % Median RgTrans's for all datasets
% clear figParams
% figParams.title = 'Median R_g';
% figParams.ylim = [0 120];
% figParams.ylabel = 'R_g, nm';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'RgTrans';
% plotMediansPaired(filterData, fieldName, figParams, errorBar, fullScreen);
% 
% % Volume for all datasets
% clear figParams
% figParams.title = 'Median Volume';
% figParams.ylim = [0 8e6];
% figParams.ylabel = 'Volume, nm^3';
% figParams.legend = {'Hela L'; 'Hela S'};
% errorBar = 'stdErr';
% fullScreen = true;
% fieldName = 'volume';
% plotMediansPaired(filterData, fieldName, figParams, errorBar, fullScreen);

% Switch back to original directory
cd(currDir)
