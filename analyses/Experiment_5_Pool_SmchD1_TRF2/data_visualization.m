% Helper functions for plotting and consolidating statistics from the fully
% processed data structure.
%
% These functions require a .mat file containing the relevant data loaded
% into the workspace.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2015/03/19 $ $REVISION: 1.3 $

%% Pooled data from SmchD1 and TRF2 double knockdowns : Hela S

% Access to the helper functions for plotting
cd ../../private/

numBins = 20;

disp('===================================================================')
disp('Pooled data from SmchD1 and TRF2 knockdowns')
disp('===================================================================')

filterDataNames = {'Pooled pSuper';
                   'Pooled TRF2';
                   'Pooled pLVP041';
                   'Pooled pLVP041 TRF2';
                   'Pooled pLVP042';
                   'Pooled pLVP042 TRF2'};
filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Pooled KD of SmchD1 and TRF2 / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled KD of SmchD1 and TRF2 / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

filterData = findData(data, filterDataNames);

%% Pooled data from SmchD1 and TRF2 knockdowns : Plots of Means

% Mean RgTrans's for all datasets
clear figParams
figParams.title = 'Mean R_g for pooled datasets';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
figParams.dividers = [6.5, 12.5, 18.5, 24.5];
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

% Mean volume for all datasets
clear figParams
figParams.title = 'Mean volume for pooled datasets';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Mean volume, nm^3';
figParams.dividers = [6.5, 12.5, 18.5, 24.5];
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

%% Pooled data from SmchD1 and TRF2 knockdowns : Plots of Medians

% Median RgTrans's for all datasets
clear figParams
figParams.title = 'Median R_g for pooled datasets';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
figParams.dividers = [6.5, 12.5, 18.5, 24.5];
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

% Median volume for all datasets
clear figParams
figParams.title = 'Median volume for pooled datasets';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Median volume, nm^3';
figParams.dividers = [6.5, 12.5, 18.5, 24.5];
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

%% Pooled data compared to all other datasets : Plots of means

% Mean RgTrans's for all datasets
clear figParams
figParams.title = 'Mean R_g for pooled datasets';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
figParams.dividers = [6.5, 12.5, 18.5, 24.5];
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMeans(data, fieldName, figParams, errorBar, fullScreen);

% Volume for all datasets
clear figParams
figParams.title = 'Mean volume for pooled datasets';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Mean volume, nm^3';
figParams.dividers = [6.5, 12.5, 18.5, 24.5];
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMeans(data, fieldName, figParams, errorBar, fullScreen);

%% Pooled data compared to all other datasets : Plots of medians

% Mean RgTrans's for all datasets
clear figParams
figParams.title = 'Median R_g for pooled datasets';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
figParams.dividers = [6.5, 12.5, 18.5, 24.5];
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMedians(data, fieldName, figParams, errorBar, fullScreen);

% Volume for all datasets
clear figParams
figParams.title = 'Median volume for pooled datasets';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Median volume, nm^3';
figParams.dividers = [6.5, 12.5, 18.5, 24.5];
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMedians(data, fieldName, figParams, errorBar, fullScreen);

%% 06-11-2014 SmchD1 and TRF2 Knockdowns : Hela S
disp('===================================================================')
disp('06-11-2014 SmchD1 and TRF2 knockdowns')
disp('===================================================================')

filterDataNames = {'06-11-2014 pSuper';
                   '06-11-2014 TRF2';
                   '06-11-2014 pLVP041';
                   '06-11-2014 pLVP041 TRF2';
                   '06-11-2014 pLVP042';
                   '06-11-2014 pLVP042 TRF2'};
filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = '06-11-2014 KD of SmchD1 and TRF2 / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = '06-11-2014 KD of SmchD1 and TRF2 / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 06-11-2014 TRF1 and TRF2 double knockdowns : Plot of Means

% Mean RgTrans
clear figParams
figParams.title = 'Mean R_g for 06-11-2014 datasets';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

% Volume
clear figParams
figParams.title = 'Mean volume for 06-11-2014 datasets';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Mean volume, nm^3';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

%% 06-11-2014 TRF1 and TRF2 double knockdowns : Plot of Medians

% Median RgTrans
clear figParams
figParams.title = 'Median R_g for 06-11-2014 datasets';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

% Median volume
clear figParams
figParams.title = 'Median volume for 06-11-2014 datasets';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Median volume, nm^3';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

%% 21-01-2015 SmchD1 and TRF2 knockdowns : Hela S
disp('===================================================================')
disp('21-01-2014 SmchD1 and TRF2 knockdowns')
disp('===================================================================')

filterDataNames = {'21-01-2015 pSuper';
                   '21-01-2015 TRF2';
                   '21-01-2015 pLVP041';
                   '21-01-2015 pLVP041 TRF2';
                   '21-01-2015 pLVP042';
                   '21-01-2015 pLVP042 TRF2'};
filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = '21-01-2015 KD of SmchD1 and TRF2 / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = '21-01-2015 KD of SmchD1 and TRF2 / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 21-01-2015 SmchD1 and TRF2 knockdowns : Plot of Means

% Mean RgTrans
clear figParams
figParams.title = 'Mean R_g for 21-01-2015 datasets';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

% Volume
clear figParams
figParams.title = 'Mean volume for 21-01-2015 datasets';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Mean volume, nm^3';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

%% 21-01-2015 SmchD1 and TRF2 knockdowns : Plot of Medians

% Median RgTrans
clear figParams
figParams.title = 'Median R_g for 21-01-2015 datasets';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

% Median volume
clear figParams
figParams.title = 'Median volume for 21-01-2015 datasets';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Median volume, nm^3';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

%% 27-08-2014 SmchD1 and TRF2 knockdowns : Hela S
disp('===================================================================')
disp('27-08-2014 SmchD1 and TRF2 knockdowns')
disp('===================================================================')

filterDataNames = {'27-08-2014 pSuper';
                   '27-08-2014 TRF2';
                   '27-08-2014 pLVP041';
                   '27-08-2014 pLVP041 TRF2';
                   '27-08-2014 pLVP042';
                   '27-08-2014 pLVP042 TRF2'};
filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = '27-08-2014 KD of SmchD1 and TRF2 / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = '27-08-2014 KD of SmchD1 and TRF2 / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 27-08-2014 SmchD1 and TRF2 knockdowns : Plot of Means

% Mean RgTrans
clear figParams
figParams.title = 'Mean R_g for 27-08-2014 datasets';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

% Volume
clear figParams
figParams.title = 'Mean volume for 27-08-2014 datasets';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Mean volume, nm^3';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

%% 27-08-2014 SmchD1 and TRF2 knockdowns : Plot of Medians

% Median RgTrans
clear figParams
figParams.title = 'Median R_g for 27-08-2014 datasets';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

% Median volume
clear figParams
figParams.title = 'Median volume for 27-08-2014 datasets';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Median volume, nm^3';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

%% 13-03-2015 SmchD1 and TRF2 knockdowns : Hela S
disp('===================================================================')
disp('13-03-2015 SmchD1 and TRF2 knockdowns')
disp('===================================================================')

filterDataNames = {'13-03-2015 pSuper';
                   '13-03-2015 TRF2';
                   '13-03-2015 pLVP041';
                   '13-03-2015 pLVP041 TRF2';
                   '13-03-2015 pLVP042';
                   '13-03-2015 pLVP042 TRF2'};
filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = '13-03-2015 KD of SmchD1 and TRF2 / Hela S';
figParams.xlabel = 'R_g, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = '13-03-2015 KD of SmchD1 and TRF2 / Hela S';
figParams.xlabel = 'Volume, nm^3';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 3e7];
figParams.ylim = [0 2e-7];
plotDist(filterData, 'volume', numBins, figParams)

printStatistics(filterData);

%% 13-03-2015 SmchD1 and TRF2 knockdowns : Plot of Means

% Mean RgTrans
clear figParams
figParams.title = 'Mean R_g for 13-03-2015 datasets';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

% Volume
clear figParams
figParams.title = 'Mean volume for 13-03-2015 datasets';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Mean volume, nm^3';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMeans(filterData, fieldName, figParams, errorBar, fullScreen);

%% 13-03-2015 SmchD1 and TRF2 knockdowns : Plot of Medians

% Median RgTrans
clear figParams
figParams.title = 'Median R_g for 13-03-2015 datasets';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g, nm';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

% Median volume
clear figParams
figParams.title = 'Median volume for 13-03-2015 datasets';
figParams.ylim = [0 8e6];
figParams.ylabel = 'Median volume, nm^3';
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMedians(filterData, fieldName, figParams, errorBar, fullScreen);

% Switch back to parent directory
cd ..
