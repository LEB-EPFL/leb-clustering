% Helper functions for plotting and consolidating statistics from the fully
% processed data structure.
%
% These functions require a .mat file containing the relevant data loaded
% into the workspace.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2015/03/19 $ $REVISION: 1.3 $

%% Pooled data from TRF1 and TRF2 double knockdowns : Hela L

% Access to the helper functions for plotting
cd ../../private/

numBins = 20;

disp('===================================================================')
disp('Pooled data from TRF1 and TRF2 double knockdowns')
disp('===================================================================')

filterDataNames = {'Pooled pSuper';
                   'Pooled TRF1';
                   'Pooled TRF2';
                   'Pooled TRF1 TRF2'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% Pooled data from TRF1 and TRF2 double knockdowns : Hela S

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

filterData = findData(data, filterDataNames);

%% Pooled data from TRF1 and TRF2 double knockdowns : Plots of Means

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

%% Pooled data from TRF1 and TRF2 double knockdowns : Plots of Medians

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

%% 08-09-2014 TRF1 and TRF2 double knockdowns : Hela L
disp('===================================================================')
disp('08-09-2014 TRF1 and TRF2 double knockdowns')
disp('===================================================================')

filterDataNames = {'08-09-2014 pSuper';
                   '08-09-2014 TRF1';
                   '08-09-2014 TRF2';
                   '08-09-2014 TRF1 TRF2'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 08-09-2014 TRF1 and TRF2 double knockdowns : Hela S

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 08-09-2014 TRF1 and TRF2 double knockdowns : Plot of Means

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

%% 08-09-2014 TRF1 and TRF2 double knockdowns : Plot of Medians

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

%% 09-09-2014 TRF1 and TRF2 double knockdowns : Hela L
disp('===================================================================')
disp('09-09-2014 TRF1 and TRF2 double knockdowns')
disp('===================================================================')

filterDataNames = {'09-09-2014 pSuper';
                   '09-09-2014 TRF1';
                   '09-09-2014 TRF2';
                   '09-09-2014 TRF1 TRF2'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 09-09-2014 TRF1 and TRF2 double knockdowns : Hela S
filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

filterData = findData(data, filterDataNames);

%% 09-09-2014 TRF1 and TRF2 double knockdowns : Plot of Means

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

%% 09-09-2014 TRF1 and TRF2 double knockdowns: Plot of Medians

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

%% 21-10-2014 TRF1 and TRF2 double knockdowns : Hela L
disp('===================================================================')
disp('21-10-2014 TRF1 and TRF2 double knockdowns')
disp('===================================================================')

filterDataNames = {'21-10-2014 pSuper';
                   '21-10-2014 TRF1';
                   '21-10-2014 TRF2';
                   '21-10-2014 TRF1 TRF2'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 21-10-2014 TRF1 and TRF2 double knockdowns : Hela S
filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

filterData = findData(data, filterDataNames);

%% 21-10-2014 TRF1 and TRF2 double knockdowns : Plot of Means

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

%% 21-10-2014 TRF1 and TRF2 double knockdowns : Plot of Medians

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

%% 05-11-2014 TRF1 and TRF2 double knockdowns : Hela L
disp('===================================================================')
disp('05-11-2014 TRF1 and TRF2 double knockdowns')
disp('===================================================================')

filterDataNames = {'05-11-2014 pSuper';
                   '05-11-2014 TRF1';
                   '05-11-2014 TRF2';
                   '05-11-2014 TRF1 TRF2'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 05-11-2014 TRF1 and TRF2 double knockdowns : Hela S
filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 05-11-2014 TRF1 and TRF2 double knockdowns : Plot of Means

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

%% 05-11-2014 TRF1 and TRF2 double knockdowns : Plot of Medians

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

%% 17-11-2014 TRF1 and TRF2 double knockdowns : Hela L
disp('===================================================================')
disp('17-11-2014 TRF1 and TRF2 double knockdowns')
disp('===================================================================')

filterDataNames = {'17-11-2014 pSuper';
                   '17-11-2014 TRF1';
                   '17-11-2014 TRF2';
                   '17-11-2014 TRF1 TRF2'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela L';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela L';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 17-11-2014 TRF1 and TRF2 double knockdowns : Hela S
filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of TRF1, TRF2, and double KD / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 17-11-2014 TRF1 and TRF2 double knockdowns : Plot of Means

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

%% 17-11-2014 TRF1 and TRF2 double knockdowns : Plot of Medians

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

% Switch back to parent directory
cd ..
