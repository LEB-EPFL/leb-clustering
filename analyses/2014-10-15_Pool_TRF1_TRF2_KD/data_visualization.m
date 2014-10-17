% Helper functions for plotting and consolidating statistics from the fully
% processed data structure.
%
% These functions require a .mat file containing the relevant data loaded
% into the workspace.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/10/13 $ $REVISION: 1.1 $

%% Primary function for generating plots from a set of experimental data.
function data_visualization(data)

numBins = 20;

plotData = data(1:4);
for ctr = 1:2:length(plotData)
    figParams.title = plotData(ctr).experimentShortName;
    plotAllDist(plotData(ctr:ctr+1), figParams, numBins);
    pause(2)
end

% Plot separate distributions for only Hela L or Hela S
filterDataNames = {'Pooled pSuper';
                   'Pooled TRF1 TRF2 KD'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Pooled Double KD of TRF1 and TRF2 / Hela L';
figParams.xlabel = 'R_g^{x,y}, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled Double KD of TRF1 and TRF2 / Hela L';
figParams.xlabel = 'Number of localizations';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 700];
figParams.ylim = [0 0.015];
plotDist(filterData, 'numLoc', numBins, figParams)

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Pooled Double KD of TRF1 and TRF2 / Hela S';
figParams.xlabel = 'R_g^{x,y}, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Pooled Double KD of TRF1 and TRF2 / Hela S';
figParams.xlabel = 'Number of localizations';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 700];
figParams.ylim = [0 0.015];
plotDist(filterData, 'numLoc', numBins, figParams)

% Scatter plots with fits
tempData = data;
data = data(1:4);

clear figParams
figParams.xlim = [0 700];
figParams.ylim = [0 300];
for ctr = 1:length(data)
    plotScatter(data(ctr), 'RgTrans', figParams)
end

% Mean scaling exponents of all datasets
clear figParams
figParams.title = 'Scaling exponents for R_g^{x,y} vs. N';
figParams.ylim = [0 0.6];
figParams.ylabel = 'Scaling exponent \nu ^*';
figParams.legend = {'Hela L'; 'Hela S'};
figParams.dividers = [4.5, 5.5, 8.5]; % x-locations of vertical dividing lines
fullScreen = true;
fieldName = 'RgTrans';
plotScalingExpPaired(data, fieldName, figParams, fullScreen)

% Mean RgTrans's for all datasets
clear figParams
figParams.title = 'Mean R_g^{x,y}';
figParams.ylim = [0 120];
figParams.ylabel = 'R_g^{x,y}, nm';
figParams.legend = {'Hela L'; 'Hela S'};
figParams.dividers = [4.5, 5.5, 8.5]; % x-locations of vertical dividing lines
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'RgTrans';
plotMeansPaired(data, fieldName, figParams, errorBar, fullScreen);

% Mean number of localizations for all datasets
clear figParams
figParams.title = 'Mean number of localizations';
figParams.ylim = [0 300];
figParams.ylabel = 'Mean number of localizations';
figParams.legend = {'Hela L'; 'Hela S'};
figParams.dividers = [4.5, 5.5, 8.5]; % x-locations of vertical dividing lines
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'numLoc';
plotMeansPaired(data, fieldName, figParams, errorBar, fullScreen);

% Mean volume for all datasets
clear figParams
figParams.title = 'Mean volume for all other datasets';
figParams.ylim = [0 11e6];
figParams.ylabel = 'Mean volume, nm^3';
figParams.legend = {'Hela L'; 'Hela S'};
figParams.dividers = [4.5, 5.5, 8.5]; % x-locations of vertical dividing lines
errorBar = 'stdErr';
fullScreen = true;
fieldName = 'volume';
plotMeansPaired(data, fieldName, figParams, errorBar, fullScreen);

data = tempData;

%==========================================================================
% Check individual data sets
%==========================================================================
tempData = data;
data = data(5:12);

clear figParams
figParams.xlim = [0 700];
figParams.ylim = [0 300];
for ctr = 1:length(data)
    plotScatter(data(ctr), 'RgTrans', figParams)
end

filterDataNames = {'08-09-2014 pSuper';
                   '09-09-2014 pSuper'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Individual pSuper datasets / Hela L';
figParams.xlabel = 'R_g^{x,y}, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Individual pSuper datsets / Hela L';
figParams.xlabel = 'Number of localizations';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 700];
figParams.ylim = [0 0.015];
plotDist(filterData, 'numLoc', numBins, figParams)

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Individual pSuper datasets / Hela S';
figParams.xlabel = 'R_g^{x,y}, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Individual pSuper datasets / Hela S';
figParams.xlabel = 'Number of localizations';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 700];
figParams.ylim = [0 0.015];
plotDist(filterData, 'numLoc', numBins, figParams)

filterDataNames = {'08-09-2014 TRF1 TRF2';
                   '09-09-2014 TRF1 TRF2'};
filterData = findData(data, filterDataNames, 'L dataset');

clear figParams
figParams.title = 'Individual pSuper datasets / Hela L';
figParams.xlabel = 'R_g^{x,y}, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Individual pSuper datsets / Hela L';
figParams.xlabel = 'Number of localizations';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 700];
figParams.ylim = [0 0.015];
plotDist(filterData, 'numLoc', numBins, figParams)

filterData = findData(data, filterDataNames, 'S dataset');

clear figParams
figParams.title = 'Individual pSuper datasets / Hela S';
figParams.xlabel = 'R_g^{x,y}, nm';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 200];
figParams.ylim = [0 0.03];
plotDist(filterData, 'RgTrans', numBins, figParams)

clear figParams
figParams.title = 'Individual pSuper datasets / Hela S';
figParams.xlabel = 'Number of localizations';
figParams.ylabel = 'Normalized frequency';
figParams.legend = filterDataNames;
figParams.xlim = [0 700];
figParams.ylim = [0 0.015];
plotDist(filterData, 'numLoc', numBins, figParams)

data = tempData;
end

%% ========================================================================
% Helper functions for plotting. Do not edit anything below this line.

%% Plots a single distribution from one or multiple datasets.

function plotDist(data, fieldName, numBins, figParams)
% data - Structure containing distributions from processed clusters
% fieldName - String representing which distribution to plot
% numBins - The number of bins to use when plotting
% figParams - Structure of figure parameters for plotting
%   .title - String
%   .xlabel - String
%   .ylabel - String
%   .xlim - (Optional) Double array of minimum and maximum x-values
%   .ylim - (Optional) Double array of minimum and maximum y-values
%   .legend - (Optional) Legend titles for each dataset

bins = findBins(data, numBins);
dataFields = fieldnames(data(1).distributions); % Fields of data.distributions

numDatasets = length(data);
barLabels = cell(numDatasets,1);

% Is the supplied field name a field inside the data structure?
assert(ismember(fieldName, dataFields), 'Error: The supplied field name must be a field of the data structure.')
 
assert(~(strcmp(fieldName, 'M1') | strcmp(fieldName, 'M2')), ...
       [fieldName ' supplied as fieldName parameter, but this function will not plot the individual first or second moments.']);

% Constructs the histogram from the supplied datasets.
N = zeros(numBins, numDatasets);
Norm = zeros(numDatasets,1);
for dataCtr = 1:numDatasets
    [N(:, dataCtr), ~] = histc(data(dataCtr).distributions.(fieldName), bins.(fieldName));
    dx = diff(bins.(fieldName));
    dx = dx(1);

    Norm(dataCtr) = sum(dx * N(:,dataCtr));
    
    % Assign legend labels to the separate bars.
    if isfield(figParams, 'legend')
        barLabels = figParams.legend;
    else
        barLabels{dataCtr} = data(dataCtr).datasetShortName;
    end
end

% Plots the histogram constructed in the previous step.
figure
bar(bins.(fieldName), N ./ repmat(Norm', size(N,1), 1), 'histc')
legend(barLabels)
title(figParams.title)
xlabel(figParams.xlabel)
ylabel(figParams.ylabel)

% Checks if xlim or ylim were supplied in figParam structure.
if isfield(figParams, 'xlim')
    xlim(figParams.xlim)
else
    xlim([0, max(bins.(fieldName))])
end

if isfield(figParams, 'ylim')
    ylim(figParams.ylim)
end

grid on

end

%% Plots all distributions in one figure.
%
% Plot the four major distributions in one figure from a set of
% distribution data. This function is useful for comparing different
% types of distributions from different datasets against one another. It's
% set to display the second moment, the radius of gyration, the number of
% localizations, and the volume all in one graph for each dataset contained
% in data.
function plotAllDist(data, figParams, numBins)

bins = findBins(data, numBins);
fields = fieldnames(data(1).distributions);

% Set the size of the figure window.
figure;
subplot(2,2,1)
hFig = gcf();
set(hFig, 'Position', [100, 100, 1600, 1000])

numDatasets = length(data);

% Plot the second moments of the clusters in each direction. This is tricky
% because there are numMoments number of moments for each dataset, each
% with a separate distribution, so the total number of bars in the bar
% graph representing the distribution is numMoments * numDatasets. The
% strange indexing pattern essentially adds an offset to the N array to
% account for the fact that three columns of N are filled in for every
% iteration of the loop. Note that for three dimensions, numMoments is 3
% and for two dimensions, it's 2.
numMoments = size(data(1).distributions.M2, 2);
N = zeros(numBins, numDatasets * numMoments);
Norm = zeros(numDatasets * numMoments,1);
barLabels = cell(numDatasets * numMoments,1);
dx = diff(bins.M2);
dx = dx(1);
for dataCtr = 1:numDatasets
    indexOffsetLow = numMoments * dataCtr - numMoments + 1; % First column of current dataset in N array.
    indexOffsetHigh = indexOffsetLow + numMoments - 1; % Last column of current dataset in N array.
    
    [N(:, indexOffsetLow:indexOffsetHigh), ~] = histc(data(dataCtr).distributions.M2, bins.M2);

    Norm(indexOffsetLow:indexOffsetHigh) = sum(dx * N(:,indexOffsetLow:indexOffsetHigh));
    
    % Assign bar labels
    barLabels{indexOffsetLow} = ['M_x^2 ' data(dataCtr).datasetShortName];
    barLabels{indexOffsetLow + 1} = ['M_y^2 ' data(dataCtr).datasetShortName];
    barLabels{indexOffsetLow + 2} = ['M_z^2 ' data(dataCtr).datasetShortName];
end

bar(bins.M2, N * dx ./ repmat(Norm', size(N,1), 1), 'histc')
title(figParams.title)

% Change the legend labeling so it's automatic in the future!
legend(barLabels) 
xlim([0, max(bins.M2)])
xlabel('Second moment, nm')
ylabel('Normalized frequency')
grid on

% Plot the normalized distributions of other quantities. (Plots normalized
% distributions for the magnitude of the square root of the radius of
% gyration, the number of localizations, and the volume.)
N = zeros(numBins, numDatasets);
for ctr = 4:6
    % Distance between bins
    dx = diff(bins.(fields{ctr}));
    dx = dx(1);
    
    for dataCtr = 1:numDatasets
        [N(:,dataCtr), ~] = histc(data(dataCtr).distributions.(fields{ctr}), bins.(fields{ctr}));
    end
    
    % Compute the normalization factor.
    Norm = sum(dx * N);
    
    % Write to subplots 2 and 3.
    subplot(2,2, ctr - 2)
    bar(bins.(fields{ctr}), N * dx ./ repmat(Norm, size(N,1), 1), 'histc')
    grid on
end

% Assign bar labels
barLabels = cell(numDatasets,1);
for ctr = 1:numDatasets
    barLabels{ctr} = data(ctr).datasetShortName;
end

% Radius of gyration
subplot(2,2,2)
xlabel('R_g, nm')
ylabel('Normalized frequency')
legend(barLabels)

% Number of localizations
subplot(2,2,3)
xlabel('Number of localizations')
ylabel('Normalized frequency')
legend(barLabels)

% Volume
subplot(2,2,4)
xlabel('Volume, nm^3')
ylabel('Normalized frequency')
legend(barLabels)

end

%% Plot mean values.
function plotMeans(data, fieldName, figParams, errorBar, fullScreen)
% For plotting means when data is not paired.
% data - Structure containing distributions from processed clusters
% fieldName - String representing which distribution to plot
% figParams - Structure of figure parameters for plotting
%   .title - String
%   .ylabel - String
%   .xlim - (Optional) Double array of minimum and maximum x-values
%   .ylim - (Optional) Double array of minimum and maximum y-values
%   .dividers - (Optional) X-locations of vertical lines to divide sets
% errorBar - String specifying the error bar; must be 'stdErr' or 'stdDev'
% fullScreen - Boolean that tells Matlab whether figure is full screen.

dataFields = fieldnames(data(1).distributions); % Fields of data.distributions
numDatasets = length(data);
tickLabels = cell(numDatasets,1);
xTicks = 1:numDatasets;

% Is the supplied field name a field inside the data structure?
assert(ismember(fieldName, dataFields), 'Error: The supplied field name must be a field of the data structure.')
 
assert(~(strcmp(fieldName, 'M1') | strcmp(fieldName, 'M2')), ...
       [fieldName ' supplied as fieldName parameter, but this function will not plot the individual first or second moments.']);

meanVal = zeros(numDatasets,1); err = zeros(numDatasets,1);

for ctr = 1:numDatasets
    meanVal(ctr) = mean(data(ctr).distributions.(fieldName));
    
    % Plot the standard error or standard deviation?
    if strcmp(errorBar, 'stdDev')
        err(ctr) = std(data(ctr).distributions.(fieldName));
    elseif strcmp(errorBar, 'stdErr')
        err(ctr) = std(data(ctr).distributions.(fieldName)) / sqrt(length(data(ctr).distributions.(fieldName)));
    else
        error(['Argument: ' errorBar ' for the type of errorbar not recognized. It must be stdErr or stdDev.'])
    end
    
    tickLabels{ctr} = data(ctr).experimentShortName;
end

if fullScreen
    h = figure('units','normalized','outerposition',[0 0 1 1]); hold;
    pause(2)
else
    h = figure; hold;
end
barwitherr(err, xTicks , meanVal)
title(figParams.title)
ylabel(figParams.ylabel);

% Checks if xlim or ylim were supplied in figParam structure.
if isfield(figParams, 'xlim')
    xlim(figParams.xlim)
else
    xlim([0.5 (numDatasets + 0.5)])
end

if isfield(figParams, 'ylim')
    ylim(figParams.ylim)
else
    ylim([0 max(meanVal + err)])
end

set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
xticklabel_rotate(xTicks, 25, tickLabels)
set(findall(gcf,'type','text'),'FontSize',14,'fontWeight','bold')
grid on

% Place vertical divders on the plot to separate datasets
hold on
if isfield(figParams, 'dividers')
    for x = figParams.dividers
        plot([x, x], get(gca,'YLim'), 'k--');
    end
end
hold off

pause(2)
end

function plotMeansPaired(data, fieldName, figParams, errorBar, fullScreen)
% For plotting means when all data are paired L and S datasets.
% data - Structure containing distributions from processed clusters
% fieldName - String representing which distribution to plot
% figParams - Structure of figure parameters for plotting
%   .title - String
%   .ylabel - String
%   .legend - Cell array of strings for legend titles
%   .xlim - (Optional) Double array of minimum and maximum x-values
%   .ylim - (Optional) Double array of minimum and maximum y-values
%   .dividers - (Optional) X-locations of vertical lines to divide sets
% errorBar - String specifying the error bar; must be 'stdErr' or 'stdDev'
% fullScreen - Boolean that tells Matlab whether figure is full screen.

dataFields = fieldnames(data(1).distributions); % Fields of data.distributions
numDatasets = length(data);
tickLabels = cell(numDatasets,1);
xTicks = 1:numDatasets/2;

% Is the supplied field name a field inside the data structure?
assert(ismember(fieldName, dataFields), 'Error: The supplied field name must be a field of the data structure.')
 
assert(~(strcmp(fieldName, 'M1') | strcmp(fieldName, 'M2')), ...
       [fieldName ' supplied as fieldName parameter, but this function will not plot the individual first or second moments.']);
   
% Ensure that there are a multiple of two datasets.
assert(mod(length(data), 2) == 0, ...
    'Error: The function plotScalingExp requires a data structure with an even number of elements.')

meanVal1 = zeros(numDatasets,1); err1 = zeros(numDatasets,1);
meanVal2 = zeros(numDatasets,1); err2 = zeros(numDatasets,1);

for ctr = 1:2:numDatasets
    meanVal1(ctr) = mean(data(ctr).distributions.(fieldName));
    meanVal2(ctr) = mean(data(ctr + 1).distributions.(fieldName));
    
    % Plot the standard error or standard deviation?
    if strcmp(errorBar, 'stdDev')
        err1(ctr) = std(data(ctr).distributions.(fieldName));
        err2(ctr) = std(data(ctr + 1).distributions.(fieldName));
    elseif strcmp(errorBar, 'stdErr')
        err1(ctr) = std(data(ctr).distributions.(fieldName)) / sqrt(length(data(ctr).distributions.(fieldName)));
        err2(ctr) = std(data(ctr + 1).distributions.(fieldName)) / sqrt(length(data(ctr + 1).distributions.(fieldName)));
    else
        error(['Argument: ' errorBar ' for the type of errorbar not recognized. It must be stdErr or stdDev.'])
    end
    
    tickLabels{ctr} = data(ctr).experimentShortName;
end

% Remove empty elements that were left in each array due to the ctr values
% in the foor loop.
meanVal1 = meanVal1(meanVal1 ~= 0); meanVal2 = meanVal2(meanVal2 ~=0);
err1 = err1(err1 ~=0); err2 = err2(err2 ~= 0);
tickLabels = tickLabels(~cellfun(@isempty, tickLabels));

% If the length of data is two, append zeros to the end of the scalingExp
% and confInt2 arrays to get the two bars to appear as different colors.
% This is because barwitherr will create two bars of the same color if its
% arguments are not arrays, as is the case with only two datasets
% (scalingExp1 and scalingExp2 would be two scalars in this case).
if length(meanVal1) == 1
    meanVal1 = [meanVal1; 0]; meanVal2 = [meanVal2; 0];
    err1 = [err1; 0]; err2 = [err2; 0];
    tickLabels{2} = [];
    xTicks = [1, 2];
end

if fullScreen
    h = figure('units','normalized','outerposition',[0 0 1 1]); hold;
    pause(2)
else
    h = figure; hold;
end
barwitherr([err1 err2], xTicks , [meanVal1 meanVal2])
legend(figParams.legend)
title(figParams.title)
ylabel(figParams.ylabel);

% Checks if xlim or ylim were supplied in figParam structure.
if isfield(figParams, 'xlim')
    xlim(figParams.xlim)
else
    xlim([0.5 (numDatasets/2 + 0.5)])
end

if isfield(figParams, 'ylim')
    ylim(figParams.ylim)
else
    ylim([0 max(max(meanVal1 + err1, meanVal2 + err2))])
end

set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
xticklabel_rotate(xTicks, 25, tickLabels)
set(findall(gcf,'type','text'),'FontSize',14,'fontWeight','bold')
grid on

% Place vertical divders on the plot to separate datasets
hold on
if isfield(figParams, 'dividers')
    for x = figParams.dividers
        plot([x, x], get(gca,'YLim'), 'k--');
    end
end
hold off

pause(2)
end

%% Plots the scaling exponents for each dataset from the robust fits.
function plotScalingExp(data, fieldName, figParams, fullScreen)
% For plotting scaling exponents for unpaired datasets.
%
% Plots the scaling exponents for each dataset as determined from the
% robust fits.
%
%
% data - Structure containing distributions from processed clusters
% fieldName - String representing which distribution's exponents to plot
% figParams - Structure of figure parameters for plotting
%   .title - String
%   .ylabel - String
%   .xlim - (Optional) Double array of minimum and maximum x-values
%   .ylim - (Optional) Double array of minimum and maximum y-values
%   .dividers - (Optional) X-locations of vertical lines to divide sets
% fullScreen - Boolean that tells Matlab whether figure is full screen

dataFields = fieldnames(data(1).distributions); % Fields of data.distributions

% Is the supplied field name a field inside the data structure?
assert(ismember(fieldName, dataFields), 'Error: The supplied field name must be a field of the data structure.')

numDatasets = length(data);
xTicks = 1:numDatasets;
tickLabels = cell(numDatasets,1);

scalingExp = zeros(numDatasets,1);
confInt = zeros(numDatasets,1);
if strcmp(fieldType, 'Rg')
    for ctr = 1:numDatasets
        currData = data(ctr).fits;
        tickLabels{ctr} = data(ctr).experimentShortName;
        scalingExp(ctr) = currData.fitRobust.b;
        confIntTemp = abs(confint(currData.fitRobust) - scalingExp(ctr));
        confInt(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
    end
elseif strcmp(fieldName, 'RgTrans')
    for ctr = 1:numDatasets
        currData = data(ctr).fits;
        tickLabels{ctr} = data(ctr).experimentShortName;
        scalingExp(ctr) = currData.fitRgTransRobust.b;
        confIntTemp = abs(confint(currData.fitRgTransRobust) - scalingExp(ctr));
        confInt(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
    end  
end

if fullScreen
    h = figure('units','normalized','outerposition',[0 0 1 1]); hold;
    pause(2)
else
    h = figure; hold;
end
barwitherr(confInt, xTicks ,scalingExp)
title(figParams.title, 'FontSize', 14)
ylabel(figParams.ylabel, 'FontSize', 14)

% Checks if xlim or ylim were supplied in figParam structure.
if isfield(figParams, 'xlim')
    xlim(figParams.xlim)
else
    xlim([0.5 (numDatasets + 0.5)])
end

if isfield(figParams, 'ylim')
    ylim(figParams.ylim)
else
    ylim([0 0.5])
end

set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
xticklabel_rotate(xTicks, 25, tickLabels)
set(findall(gcf,'type','text'),'FontSize',14,'fontWeight','bold')
grid on

% Place vertical divders on the plot to separate datasets
hold on
if isfield(figParams, 'dividers')
    for x = figParams.dividers
        plot([x, x], get(gca,'YLim'), 'k--');
    end
end
hold off

pause(2)
end

function plotScalingExpPaired(data, fieldName, figParams, fullScreen)
% For plotting means when all datasets are paired.
%
% Plots the scaling exponents for each dataset as determined from the
% robust fits. Note that since we always compare two datasets, the
% data structure array must contain an even number of elements with
% datasets for comparison located next to one another.
%
% For example, if length(data) = 4, data(1) and data(2) scaling exponents
% will be grouped, as will data(3) and data(4).

% data - Structure containing distributions from processed clusters
% fieldName - String representing which distribution's exponents to plot
% figParams - Structure of figure parameters for plotting
%   .title - String
%   .ylabel - String
%   .legend - Cell array of strings for legend titles
%   .xlim - (Optional) Double array of minimum and maximum x-values
%   .ylim - (Optional) Double array of minimum and maximum y-values
%   .dividers - (Optional) X-locations of vertical lines to divide sets
% fullScreen - Boolean that tells Matlab whether figure is full screen

% Ensure that there are a multiple of two datasets.
assert(mod(length(data), 2) == 0, ...
    'Error: The function plotScalingExp requires a data structure with an even number of elements.')

dataFields = fieldnames(data(1).distributions); % Fields of data.distributions

% Is the supplied field name a field inside the data structure?
assert(ismember(fieldName, dataFields), 'Error: The supplied field name must be a field of the data structure.')

numDatasets = length(data);
xTicks = 1:numDatasets/2;
tickLabels = cell(numDatasets,1);

scalingExp1 = zeros(numDatasets,1); scalingExp2 = zeros(numDatasets,1);
confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);
if strcmp(fieldName, 'Rg')
    for ctr = 1:2:numDatasets
        currData1 = data(ctr).fits;
        tickLabels{ctr} = data(ctr).experimentShortName;
        scalingExp1(ctr) = currData1.fitRobust.b;
        confIntTemp = abs(confint(currData1.fitRobust) - scalingExp1(ctr));
        confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.

        currData2 = data(ctr + 1).fits;
        scalingExp2(ctr) = currData2.fitRobust.b;
        confIntTemp = abs(confint(currData2.fitRobust) - scalingExp2(ctr));
        confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
    end
elseif strcmp(fieldName, 'RgTrans')
    for ctr = 1:2:numDatasets
        currData1 = data(ctr).fits;
        tickLabels{ctr} = data(ctr).experimentShortName;
        scalingExp1(ctr) = currData1.fitRgTransRobust.b;
        confIntTemp = abs(confint(currData1.fitRgTransRobust) - scalingExp1(ctr));
        confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.

        currData2 = data(ctr + 1).fits;
        scalingExp2(ctr) = currData2.fitRgTransRobust.b;
        confIntTemp = abs(confint(currData2.fitRgTransRobust) - scalingExp2(ctr));
        confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
    end
end

% Remove empty elements that were left in each array due to the ctr values
% in the foor loop.
scalingExp1 = scalingExp1(scalingExp1 ~= 0); scalingExp2 = scalingExp2(scalingExp2 ~=0);
confInt1 = confInt1(confInt1 ~=0); confInt2 = confInt2(confInt2 ~= 0);
tickLabels = tickLabels(~cellfun(@isempty, tickLabels));

% If the length of data is two, append zeros to the end of the scalingExp
% and confInt2 arrays to get the two bars to appear as different colors.
% This is because barwitherr will create two bars of the same color if its
% arguments are not arrays, as is the case with only two datasets
% (scalingExp1 and scalingExp2 would be two scalars in this case).
if length(scalingExp1) == 1
    scalingExp1 = [scalingExp1; 0]; scalingExp2 = [scalingExp2; 0];
    confInt1 = [confInt1; 0]; confInt2 = [confInt2; 0];
    tickLabels{2} = [];
    xTicks = [1, 2];
end

if fullScreen
    h = figure('units','normalized','outerposition',[0 0 1 1]); hold;
else
    h = figure; hold;
end
barwitherr([confInt1 confInt2], xTicks ,[scalingExp1 scalingExp2])
legend(figParams.legend)
title(figParams.title, 'FontSize', 14)
ylabel(figParams.ylabel, 'FontSize', 14)

% Checks if xlim or ylim were supplied in figParam structure.
if isfield(figParams, 'xlim')
    xlim(figParams.xlim)
else
    xlim([0.5 (numDatasets/2 + 0.5)])
end

if isfield(figParams, 'ylim')
    ylim(figParams.ylim)
else
    ylim([0 0.5])
end

set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
xticklabel_rotate(xTicks, 25, tickLabels)
set(findall(gcf,'type','text'),'FontSize',14,'fontWeight','bold')
grid on

% Place vertical divders on the plot to separate datasets
hold on
if isfield(figParams, 'dividers')
    for x = figParams.dividers
        plot([x, x], get(gca,'YLim'), 'k--');
    end
end
hold off

pause(2)
end

%% Plots the fit constants for each dataset from the robust fits.
function plotFitConst(data, figParams, fullScreen)
% Plots fit constants for each dataset as determined from the robust fits.
% These constants are the value 'a' in the fit model a*x^b.

% Note that since we always compare two datasets, the data structure array
% must contain an even number of elements with datasets for comparison
% located next to one another.
%
% For example, if length(data) = 4, data(1) and data(2) scaling exponents
% will be grouped, as will data(3) and data(4).

% data - Structure containing distributions from processed clusters
% figParams - Structure of figure parameters for plotting
%   .title - String
%   .ylabel - String
%   .legend - Cell array of strings for legend titles
%   .xlim - (Optional) Double array of minimum and maximum x-values
%   .ylim - (Optional) Double array of minimum and maximum y-values
%   .dividers - (Optional) X-locations of vertical lines to divide sets
% fullScreen - Boolean that tells Matlab whether figure is full screen

% Ensure that there are a multiple of two datasets.
assert(mod(length(data), 2) == 0, ...
    'Error: The function plotFitConst requires a data structure with an even number of elements.')

numDatasets = length(data);
xTicks = 1:numDatasets/2;
tickLabels = cell(numDatasets,1);

fitConst1 = zeros(numDatasets,1); fitConst2 = zeros(numDatasets,1);
confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);

for ctr = 1:2:numDatasets
    currData1 = data(ctr).fits;
    tickLabels{ctr} = data(ctr).experimentShortName;
    fitConst1(ctr) = currData1.fitRobust.a;
    confIntTemp = abs(confint(currData1.fitRobust) - fitConst1(ctr));
    confInt1(ctr) = confIntTemp(1,1); % Isolate confidence interval of the constant.
    
    currData2 = data(ctr + 1).fits;
    fitConst2(ctr) = currData2.fitRobust.a;
    confIntTemp = abs(confint(currData2.fitRobust) - fitConst2(ctr));
    confInt2(ctr) = confIntTemp(1,1); % Isolate confidence interval of the constant.
end

% Remove empty elements that were left in each array due to the ctr values
% in the foor loop.
fitConst1 = fitConst1(fitConst1 ~= 0); fitConst2 = fitConst2(fitConst2 ~=0);
confInt1 = confInt1(confInt1 ~=0); confInt2 = confInt2(confInt2 ~= 0);
tickLabels = tickLabels(~cellfun(@isempty, tickLabels));

% If the length of data is two, append zeros to the end of the scalingExp
% and confInt2 arrays to get the two bars to appear as different colors.
% This is because barwitherr will create two bars of the same color if its
% arguments are not arrays, as is the case with only two datasets
% (fitConst1 and fitConst2 would be two scalars in this case).
if length(fitConst1) == 1
    fitConst1 = [fitConst1; 0]; fitConst2 = [fitConst2; 0];
    confInt1 = [confInt1; 0]; confInt2 = [confInt2; 0];
    tickLabels{2} = [];
    xTicks = [1, 2];
end

if fullScreen
    h = figure('units','normalized','outerposition',[0 0 1 1]); hold;
else
    h = figure; hold;
end
barwitherr([confInt1 confInt2], xTicks ,[fitConst1 fitConst2])
legend(figParams.legend)
title(figParams.title, 'FontSize', 14)
ylabel(figParams.ylabel, 'FontSize', 14)

% Checks if xlim or ylim were supplied in figParam structure.
if isfield(figParams, 'xlim')
    xlim(figParams.xlim)
else
    xlim([0.5 (numDatasets/2 + 0.5)])
end

if isfield(figParams, 'ylim')
    ylim(figParams.ylim)
else
    ylim([0 0.5])
end

set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
xticklabel_rotate(xTicks, 25, tickLabels)
set(findall(gcf,'type','text'),'FontSize',14,'fontWeight','bold')
grid on

% Place vertical divders on the plot to separate datasets
hold on
if isfield(figParams, 'dividers')
    for x = figParams.dividers
        plot([x, x], get(gca,'YLim'), 'k--');
    end
end
hold off

end

%% Plots the Rg or transverse Rg vs numLoc scatter plots with fits
function plotScatter(data, fieldName, figParams)
% data - Single data structure (not an array)
% fieldName - String for which quantity lies on the y-axis (Rg or RgTrans)
% figParams - Structure of figure parameters for plotting
%   .title - String
%   .xlim - (Optional) Double array of minimum and maximum x-values
%   .ylim - (Optional) Double array of minimum and maximum y-values

    dataFields = fieldnames(data(1).distributions); % Fields of data.distributions

    % Is the supplied field name a field inside the data structure?
    assert(ismember(fieldName, dataFields), 'Error: The supplied field name must be a field of the data structure.')

    x = data.distributions.numLoc;
    if strcmp(fieldName, 'Rg')
        y = data.distributions.Rg;
        
        fitNormal = data.fits.fitNormal;
        fitNoOutliers = data.fits.fitNoOutliers;
        fitRobust = data.fits.fitRobust;
        residuals = data.fits.fitInfoNormal.residuals;
        I = abs(residuals) > 1.5 * std(residuals);
        outliers = excludedata(x,y,'indices',I);

        figure
        plot(fitNormal, 'b-', x, y, 'k.', outliers, 'm*')
        hold on
        plot(fitNoOutliers, 'r--')
        plot(fitRobust, 'g-')
        legend('Data', 'Outliers', 'Original fit', 'Fit with outliers excluded', 'Robust fit' )
        hold off

        grid on
        title([data.experimentShortName ' / ' data.datasetShortName])
        xlabel('Number of localizations')
        ylabel('R_g, nm')

    elseif strcmp(fieldName, 'RgTrans')
        y = data.distributions.RgTrans;
        
        fitRgTransNormal = data.fits.fitRgTransNormal;
        fitRgTransNoOutliers = data.fits.fitRgTransNoOutliers;
        fitRgTransRobust = data.fits.fitRgTransRobust;
        residuals = data.fits.fitRgTransInfoNormal.residuals;
        I = abs(residuals) > 1.5 * std(residuals);
        outliers = excludedata(x,y,'indices',I);

        figure
        plot(fitRgTransNormal, 'b-', x, y, 'k.', outliers, 'm*')
        hold on
        plot(fitRgTransNoOutliers, 'r--')
        plot(fitRgTransRobust, 'g-')
        legend('Data', 'Outliers', 'Original fit', 'Fit with outliers excluded', 'Robust fit' )
        hold off

        grid on
        title([data.experimentShortName ' / ' data.datasetShortName])
        xlabel('Number of localizations')
        ylabel('R_g^{x,y}, nm')
    end
    
    % Checks if xlim or ylim were supplied in figParam structure.
if isfield(figParams, 'xlim')
    xlim(figParams.xlim)
end

if isfield(figParams, 'ylim')
    ylim(figParams.ylim)
end

end

%% Helper function to determine the maximum and minimum bin range.
function [bins] = findBins(data, numBins)
    % Determines the bins for each distribution.

    bins = struct('M1', [], 'M2', [], 'Rg', [], 'numLoc', [], 'volume', []);
    fields = fieldnames(data(1).distributions);

    for fieldCtr = 1:numel(fields)
        % Find the maximum and minimum value for a distribution across all
        % the datasets to be compared.
        minBin = Inf; maxBin = 0;
        
        for dataCtr = 1:length(data)
            currMin = min(data(dataCtr).distributions.(fields{fieldCtr})(:));
            currMax = max(data(dataCtr).distributions.(fields{fieldCtr})(:));
            
            % Update the minimum and maximum bin values if the current
            % dataset has the smallest or largest values known at present.
            if currMin < minBin
                minBin = currMin;
            end
            if currMax > maxBin
                maxBin = currMax;
            end
        end
        
        bins.(fields{fieldCtr}) = linspace(minBin, maxBin, numBins);
    end
end

%% Return only data that matches the desired short names
function [returnData] = findData(data, expName, varargin)
% data - The experimental data structure
% expName - Cell array for the experiment short name matching the desired
%           datasets within the data structure
% varargin - String representing dataset short name if only one cell type /
%            transfection is desired

assert(isempty(varargin) | length(varargin) == 1, ...
    ['Error: the function has only one optional input argument, but ' num2str(length(varargin)) ' were provided.'])

if length(varargin) == 1
    assert(ischar(varargin{1}), 'Error: the optional input argument must be a string.');
    setName = varargin{1};
end

% Loop through the data structure and find indexes that match expName.
dataInd = zeros(length(data),1);
for ctr = 1:length(data)
    if any(strcmp(expName, data(ctr).experimentShortName))
        dataInd(ctr) = 1;
    end
end
returnData = data(logical(dataInd));  

% If a dataset short name was supplied in varargin, keep only those
% elements that also match setName.
if exist('setName')
    dataInd = zeros(length(returnData),1);
    for ctr = 1:length(returnData)
        if strcmp(setName, returnData(ctr).datasetShortName)
            dataInd(ctr) = 1;
        end
    end
    returnData = returnData(logical(dataInd));
end
end
%% Next
% Create the bins for plotting the distributions.
% First, it is determined which of the two datasets, S or L, has the
% largest and smallest values in each field. Next, the bins are determined
% by partitioning the range between between these values into numBins
% equally-sized intervals. These bins are used to normalize the
% distributions.
% numBins = 20;
% bins = struct('M1', [], 'M2', [], 'Rg', [], 'numLoc', [], 'volume', []);
% fields = fieldnames(bins);
% 
% for ctr = 1:numel(fields)
%     minBin = min([min(allData.(fields{ctr})(:)) min(SAllData.(fields{ctr})(:))]);
%     maxBin = max([max(allData.(fields{ctr})(:)) max(SAllData.(fields{ctr})(:))]);
%     bins.(fields{ctr}) = linspace(minBin, maxBin, numBins);    
% end

% %% Group fitted exponents from experiments for plotting.
% %==========================================================================
% % 11-06-2014 FISH Original data
% %==========================================================================
% currData = data(1).fits;
% currDataName = data(1).shortName;
% scalingExp1 = currData.fitRobust1.b;
% confInt1 = abs(confint(currData.fitRobust1) - scalingExp1);
% confInt1 = confInt1(:,2); % Isolate confidence interval of the exponent.
% 
% scalingExp2 = currData.fitRobust2.b;
% confInt2 = abs(confint(currData.fitRobust2) - scalingExp2);
% confInt2 = confInt2(:,2); % Isolate confidence interval of the exponent.
% 
% h = figure; hold;
% barwitherr([[confInt1(1) confInt1(1)]' [confInt2(1) confInt2(1)]'], [1 5],[[scalingExp1 scalingExp1]' [scalingExp2 scalingExp2]'])
% % barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
% % colormap(barmap);
% title(currDataName, 'FontSize', 14)
% ylabel('Scaling exponent \nu*', 'FontSize', 14)
% legend('Hela L', 'Hela S')
% set(gca, 'XTick', [1], 'XTickLabel', {''})
% xlim([-1 3])
% ylim([0 0.5])
% grid on
% 
% %% 29-07-2014 SmchD1
% %==========================================================================
% % 29-07-2014 SmchD1
% %==========================================================================
% dataOffset = 1;
% numDatasets = 3;
% xTicks = 1:numDatasets;
% tickLabels = cell(numDatasets,1);
% 
% scalingExp1 = zeros(numDatasets,1); scalingExp2 = zeros(numDatasets,1);
% confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);
% 
% for ctr = xTicks
%     currData = data(ctr + dataOffset).fits;
%     tickLabels{ctr} = data(ctr + dataOffset).shortName;
%     tickLabels{ctr} = tickLabels{ctr}(19:end);
%     scalingExp1(ctr) = currData.fitRobust1.b;
%     confIntTemp = abs(confint(currData.fitRobust1) - scalingExp1(ctr));
%     confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
% 
%     scalingExp2(ctr) = currData.fitRobust2.b;
%     confIntTemp = abs(confint(currData.fitRobust2) - scalingExp2(ctr));
%     confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
% end
% 
% 
% h = figure; hold;
% barwitherr([confInt1 confInt2], xTicks ,[scalingExp1 scalingExp2])
% % barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
% % colormap(barmap);
% title('29-07-2014 SmchD1', 'FontSize', 14)
% ylabel('Scaling exponent \nu*', 'FontSize', 14)
% legend('Hela L', 'Hela S')
% set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
% ylim([0 0.5])
% grid on
% 
% %% 30-07-2014 SmchD1
% %==========================================================================
% % 30-07-2014 SmchD1
% %==========================================================================
% dataOffset = 4;
% numDatasets = 3;
% xTicks = 1:numDatasets;
% tickLabels = cell(numDatasets,1);
% 
% scalingExp1 = zeros(numDatasets,1); scalingExp2 = zeros(numDatasets,1);
% confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);
% 
% for ctr = xTicks
%     currData = data(ctr + dataOffset).fits;
%     tickLabels{ctr} = data(ctr + dataOffset).shortName;
%     tickLabels{ctr} = tickLabels{ctr}(19:end);
%     scalingExp1(ctr) = currData.fitRobust1.b;
%     confIntTemp = abs(confint(currData.fitRobust1) - scalingExp1(ctr));
%     confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
% 
%     scalingExp2(ctr) = currData.fitRobust2.b;
%     confIntTemp = abs(confint(currData.fitRobust2) - scalingExp2(ctr));
%     confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
% end
% 
% 
% h = figure; hold;
% barwitherr([confInt1 confInt2], xTicks ,[scalingExp1 scalingExp2])
% % barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
% % colormap(barmap);
% title('30-07-2014 SmchD1', 'FontSize', 14)
% ylabel('Scaling exponent \nu*', 'FontSize', 14)
% legend('Hela L', 'Hela S')
% set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
% ylim([0 0.5])
% grid on
% 
% %% 05-08-2014 Hela L LRif1
% %==========================================================================
% % 05-08-2014 Hela L LRif1
% %==========================================================================
% dataOffset = 7;
% numDatasets = 3;
% xTicks = 1:numDatasets;
% tickLabels = cell(numDatasets,1);
% 
% scalingExp1 = zeros(numDatasets,1); scalingExp2 = zeros(numDatasets,1);
% confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);
% 
% for ctr = xTicks
%     currData = data(ctr + dataOffset).fits;
%     tickLabels{ctr} = data(ctr + dataOffset).shortName;
%     tickLabels{ctr} = tickLabels{ctr}(19:end);
%     scalingExp1(ctr) = currData.fitRobust1.b;
%     confIntTemp = abs(confint(currData.fitRobust1) - scalingExp1(ctr));
%     confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
% 
%     scalingExp2(ctr) = currData.fitRobust2.b;
%     confIntTemp = abs(confint(currData.fitRobust2) - scalingExp2(ctr));
%     confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
% end
% 
% 
% h = figure; hold;
% barwitherr([confInt1 confInt2], xTicks ,[scalingExp1 scalingExp2])
% % barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
% % colormap(barmap);
% title('05-08-2014 Hela L LRif1', 'FontSize', 14)
% ylabel('Scaling exponent \nu*', 'FontSize', 14)
% legend('Transfection 1', 'Transfection 2')
% set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
% ylim([0 0.5])
% grid on
% 
% %% 11-08-2014 TrF2
% %==========================================================================
% % 11-08-2014 TrF2
% %==========================================================================
% dataOffset = 10;
% numDatasets = 4;
% xTicks = 1:numDatasets;
% tickLabels = cell(numDatasets,1);
% 
% scalingExp1 = zeros(numDatasets,1); scalingExp2 = zeros(numDatasets,1);
% confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);
% 
% for ctr = xTicks
%     currData = data(ctr + dataOffset).fits;
%     tickLabels{ctr} = data(ctr + dataOffset).shortName;
%     tickLabels{ctr} = tickLabels{ctr}(12:end);
%     scalingExp1(ctr) = currData.fitRobust1.b;
%     confIntTemp = abs(confint(currData.fitRobust1) - scalingExp1(ctr));
%     confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
% 
%     scalingExp2(ctr) = currData.fitRobust2.b;
%     confIntTemp = abs(confint(currData.fitRobust2) - scalingExp2(ctr));
%     confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
% end
% 
% 
% h = figure; hold;
% barwitherr([confInt1 confInt2], xTicks ,[scalingExp1 scalingExp2])
% % barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
% % colormap(barmap);
% title('11-08-2014 TrF2', 'FontSize', 14)
% ylabel('Scaling exponent \nu*', 'FontSize', 14)
% legend('Hela L', 'Hela S')
% set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
% ylim([0 0.5])
% grid on
% 
% %% 11-08-2014 TrF2
% %==========================================================================
% % 13-08-2014 TrF2
% %==========================================================================
% dataOffset = 14;
% numDatasets = 4;
% xTicks = 1:numDatasets;
% tickLabels = cell(numDatasets,1);
% 
% scalingExp1 = zeros(numDatasets,1); scalingExp2 = zeros(numDatasets,1);
% confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);
% 
% for ctr = xTicks
%     currData = data(ctr + dataOffset).fits;
%     tickLabels{ctr} = data(ctr + dataOffset).shortName;
%     tickLabels{ctr} = tickLabels{ctr}(12:end);
%     scalingExp1(ctr) = currData.fitRobust1.b;
%     confIntTemp = abs(confint(currData.fitRobust1) - scalingExp1(ctr));
%     confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
% 
%     scalingExp2(ctr) = currData.fitRobust2.b;
%     confIntTemp = abs(confint(currData.fitRobust2) - scalingExp2(ctr));
%     confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
% end
% 
% 
% h = figure; hold;
% barwitherr([confInt1 confInt2], xTicks ,[scalingExp1 scalingExp2])
% % barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
% % colormap(barmap);
% title('13-08-2014 TrF2', 'FontSize', 14)
% ylabel('Scaling exponent \nu*', 'FontSize', 14)
% legend('Hela L', 'Hela S')
% set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
% ylim([0 0.5])
% grid on
% 
% %% All data Rg vs N
% dataOffset = 0;
% numDatasets = 18;
% xTicks = 1:numDatasets;
% tickLabels = cell(numDatasets,1);
% 
% scalingExp1 = zeros(numDatasets,1); scalingExp2 = zeros(numDatasets,1);
% confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);
% 
% for ctr = xTicks
%     currData = data(ctr + dataOffset).fits;
%     tickLabels{ctr} = data(ctr + dataOffset).shortName;
%     tickLabels{ctr} = tickLabels{ctr}(12:end);
%     scalingExp1(ctr) = currData.fitRobust1.b;
%     confIntTemp = abs(confint(currData.fitRobust1) - scalingExp1(ctr));
%     confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
% 
%     scalingExp2(ctr) = currData.fitRobust2.b;
%     confIntTemp = abs(confint(currData.fitRobust2) - scalingExp2(ctr));
%     confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
% end
% 
% 
% h = figure('units','normalized','outerposition',[0 0 1 1]); hold;
% barwitherr([confInt1 confInt2], xTicks ,[scalingExp1 scalingExp2])
% %barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
% %colormap(barmap);
% ylab = ylabel('Scaling exponent \nu*');
% set(ylab, 'position', get(ylab,'position')-[0.2,0,0]);  % shift the y label to the left by 0.2
% set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
% xticklabel_rotate(xTicks, 25, tickLabels)
% set(findall(gcf,'type','text'),'FontSize',14,'fontWeight','bold')
% ylim([0 0.6])
% grid on
% hold on
% plot([0 19], [0.33 0.33], 'k', 'LineWidth', 2)
% legend('Hela L', 'Hela S')
% plot([1.5 1.5], [0 0.6],'k--')
% plot([4.5 4.5], [0 0.6],'k--')
% plot([7.5 7.5], [0 0.6],'k--')
% plot([10.5 10.5], [0 0.6],'k--')
% plot([14.5 14.5], [0 0.6],'k--')
% 
% text(0.1, 0.57, 'Original Data', 'FontSize', 14)
% text(1.6, 0.57, '29-7-14 SmchD1', 'FontSize', 14)
% text(4.6, 0.57, '30-7-14 SmchD1', 'FontSize', 14)
% text(7.6, 0.57, '05-08-14 LRif1', 'FontSize', 14)
% text(7.6, 0.56, 'Blue, red - different transfections', 'FontSize', 14)
% text(10.6, 0.57, '11-08-14 TrF2', 'FontSize', 14)
% text(14.6, 0.57, '13-08-14 TrF2', 'FontSize', 14)
% 
% hold off
% 
% % %% Plot residuals from the fit of a dataset
% % plot(data(18).fits.fitRobust2, data(18).distributions2.numLoc, data(18).distributions2.M2Mag, 'co', 'residuals')
% % 
% % %% Display all r-squared values
% % for ctr = 1:length(data)
% %     [data(ctr).fits.gofRobust1.rsquare data(ctr).fits.gofRobust2.rsquare]
% % end
% 
% %% All data Rg vs N
% dataOffset = 0;
% numDatasets = 10;
% xTicks = 1:numDatasets;
% tickLabels = cell(numDatasets,1);
% 
% scalingExp1 = zeros(numDatasets,1); scalingExp2 = zeros(numDatasets,1);
% confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);
% 
% for ctr = xTicks
%     currData = data(ctr + dataOffset).fits;
%     tickLabels{ctr} = data(ctr + dataOffset).shortName;
%     tickLabels{ctr} = tickLabels{ctr}(12:end);
%     scalingExp1(ctr) = currData.fitRobust1.b;
%     confIntTemp = abs(confint(currData.fitRobust1) - scalingExp1(ctr));
%     confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
% 
%     scalingExp2(ctr) = currData.fitRobust2.b;
%     confIntTemp = abs(confint(currData.fitRobust2) - scalingExp2(ctr));
%     confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
% end
% 
% 
% h = figure('units','normalized','outerposition',[0 0 1 1]); hold;
% barwitherr([confInt1 confInt2], xTicks ,[scalingExp1 scalingExp2])
% %barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
% %colormap(barmap);
% ylab = ylabel('Scaling exponent \nu*');
% set(ylab, 'position', get(ylab,'position')-[0.2,0,0]);  % shift the y label to the left by 0.2
% set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
% xticklabel_rotate(xTicks, 25, tickLabels)
% set(findall(gcf,'type','text'),'FontSize',14,'fontWeight','bold')
% ylim([0 0.6])
% grid on
% hold on
% plot([0 11], [0.33 0.33], 'k', 'LineWidth', 2)
% legend('Hela L', 'Hela S')
% plot([1.5 1.5], [0 0.6],'k--')
% plot([4.5 4.5], [0 0.6],'k--')
% plot([7.5 7.5], [0 0.6],'k--')
% 
% text(0.1, 0.57, 'Original Data', 'FontSize', 14)
% text(1.6, 0.57, '29-7-14 SmchD1', 'FontSize', 14)
% text(4.6, 0.57, '30-7-14 SmchD1', 'FontSize', 14)
% text(7.6, 0.57, '05-08-14 LRif1', 'FontSize', 14)
% text(7.6, 0.56, 'Blue, red - different transfections', 'FontSize', 14)
% 
% hold off
% 
% %% All data mean Rg
% dataOffset = 0;
% numDatasets = 18;
% xTicks = 1:numDatasets;
% tickLabels = cell(numDatasets,1);
% 
% meanRg1 = zeros(numDatasets,1); err1 = zeros(numDatasets,1);
% meanRg2 = zeros(numDatasets,1); err2 = zeros(numDatasets,1);
% 
% for ctr = xTicks
%     meanRg1(ctr) = mean(data(ctr + dataOffset).distributions1.M2Mag);
%     meanRg2(ctr) = mean(data(ctr + dataOffset).distributions2.M2Mag);
%     err1(ctr) = std(data(ctr + dataOffset).distributions1.M2Mag) / sqrt(length(data(ctr + dataOffset).distributions1.M2Mag));
%     err2(ctr) = std(data(ctr + dataOffset).distributions2.M2Mag) / sqrt(length(data(ctr + dataOffset).distributions2.M2Mag));
%     tickLabels{ctr} = data(ctr + dataOffset).shortName;
%     tickLabels{ctr} = tickLabels{ctr}(12:end);
% end
% 
% 
% h = figure('units','normalized','outerposition',[0 0 1 1]); hold;
% barwitherr([err1 err2], xTicks ,[meanRg1 meanRg2])
% %barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
% %colormap(barmap);
% ylab = ylabel('Mean radius of gyration, nm');
% set(ylab, 'position', get(ylab,'position')-[0.2,0,0]);  % shift the y label to the left by 0.2
% set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
% xticklabel_rotate(xTicks, 25, tickLabels)
% set(findall(gcf,'type','text'),'FontSize',14,'fontWeight','bold')
% ylim([0 140])
% grid on
% hold on
% legend('Hela L', 'Hela S')
% plot([1.5 1.5], [0 140],'k--')
% plot([4.5 4.5], [0 140],'k--')
% plot([7.5 7.5], [0 140],'k--')
% plot([10.5 10.5], [0 140],'k--')
% plot([14.5 14.5], [0 140],'k--')
% 
% text(0.1, 138, 'Original Data', 'FontSize', 14)
% text(1.6, 138, '29-7-14 SmchD1', 'FontSize', 14)
% text(4.6, 138, '30-7-14 SmchD1', 'FontSize', 14)
% text(7.6, 138, '05-08-14 LRif1', 'FontSize', 14)
% text(7.6, 135, 'Blue, red - different transfections', 'FontSize', 14)
% text(10.6, 138, '11-08-14 TrF2', 'FontSize', 14)
% text(14.6, 138, '13-08-14 TrF2', 'FontSize', 14)
% 
% hold off
% 
% %% All data mean volume
% dataOffset = 0;
% numDatasets = 18;
% xTicks = 1:numDatasets;
% tickLabels = cell(numDatasets,1);
% 
% meanVol1 = zeros(numDatasets,1); err1 = zeros(numDatasets,1);
% meanVol2 = zeros(numDatasets,1); err2 = zeros(numDatasets,1);
% 
% for ctr = xTicks
%     meanVol1(ctr) = mean(data(ctr + dataOffset).distributions1.volume);
%     meanVol2(ctr) = mean(data(ctr + dataOffset).distributions2.volume);
%     err1(ctr) = std(data(ctr + dataOffset).distributions1.volume) / sqrt(length(data(ctr + dataOffset).distributions1.volume));
%     err2(ctr) = std(data(ctr + dataOffset).distributions2.volume) / sqrt(length(data(ctr + dataOffset).distributions2.volume));
%     tickLabels{ctr} = data(ctr + dataOffset).shortName;
%     tickLabels{ctr} = tickLabels{ctr}(12:end);
% end
% 
% 
% h = figure('units','normalized','outerposition',[0 0 1 1]); hold;
% barwitherr([err1 err2], xTicks ,[meanVol1 meanVol2])
% %barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
% %colormap(barmap);
% ylab = ylabel('Mean volume, nm^3');
% set(ylab, 'position', get(ylab,'position')-[0.2,0,0]);  % shift the y label to the left by 0.2
% set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
% xticklabel_rotate(xTicks, 25, tickLabels)
% set(findall(gcf,'type','text'),'FontSize',14,'fontWeight','bold')
% ylim([0 1.5e7])
% grid on
% hold on
% legend('Hela L', 'Hela S')
% plot([1.5 1.5], [0 1.5e7],'k--')
% plot([4.5 4.5], [0 1.5e7],'k--')
% plot([7.5 7.5], [0 1.5e7],'k--')
% plot([10.5 10.5], [0 1.5e7],'k--')
% plot([14.5 14.5], [0 1.5e7],'k--')
% 
% text(0.1, 1.3e7, 'Original Data', 'FontSize', 14)
% text(1.6, 1.3e7, '29-7-14 SmchD1', 'FontSize', 14)
% text(4.6, 1.3e7, '30-7-14 SmchD1', 'FontSize', 14)
% text(7.6, 1.3e7, '05-08-14 LRif1', 'FontSize', 14)
% text(7.6, 1.27e7, 'Blue, red - different transfections', 'FontSize', 14)
% text(10.6, 1.3e7, '11-08-14 TrF2', 'FontSize', 14)
% text(14.6, 1.3e7, '13-08-14 TrF2', 'FontSize', 14)
% 
% hold off
% 
% %% All data mean number of localizations per volume
% dataOffset = 0;
% numDatasets = 18;
% xTicks = 1:numDatasets;
% tickLabels = cell(numDatasets,1);
% 
% meanNum1 = zeros(numDatasets,1); err1 = zeros(numDatasets,1);
% meanNum2 = zeros(numDatasets,1); err2 = zeros(numDatasets,1);
% 
% for ctr = xTicks
%     meanNum1(ctr) = mean(data(ctr + dataOffset).distributions1.numLoc);
%     meanNum2(ctr) = mean(data(ctr + dataOffset).distributions2.numLoc);
%     err1(ctr) = std(data(ctr + dataOffset).distributions1.numLoc) / sqrt(length(data(ctr + dataOffset).distributions1.numLoc));
%     err2(ctr) = std(data(ctr + dataOffset).distributions2.numLoc) / sqrt(length(data(ctr + dataOffset).distributions2.numLoc));
%     tickLabels{ctr} = data(ctr + dataOffset).shortName;
%     tickLabels{ctr} = tickLabels{ctr}(12:end);
% end
% 
% 
% h = figure('units','normalized','outerposition',[0 0 1 1]); hold;
% barwitherr([err1 err2], xTicks ,[meanNum1 meanNum2])
% %barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
% %colormap(barmap);
% ylab = ylabel('Mean number of localizations per cluster');
% set(ylab, 'position', get(ylab,'position')-[0.2,0,0]);  % shift the y label to the left by 0.2
% set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
% xticklabel_rotate(xTicks, 25, tickLabels)
% set(findall(gcf,'type','text'),'FontSize',14,'fontWeight','bold')
% ylim([0 350])
% grid on
% hold on
% legend('Hela L', 'Hela S')
% plot([1.5 1.5], [0 350],'k--')
% plot([4.5 4.5], [0 350],'k--')
% plot([7.5 7.5], [0 350],'k--')
% plot([10.5 10.5], [0 350],'k--')
% plot([14.5 14.5], [0 350],'k--')
% 
% text(0.1, 325, 'Original Data', 'FontSize', 14)
% text(1.6, 325, '29-7-14 SmchD1', 'FontSize', 14)
% text(4.6, 325, '30-7-14 SmchD1', 'FontSize', 14)
% text(7.6, 325, '05-08-14 LRif1', 'FontSize', 14)
% text(7.6, 318, 'Blue, red - different transfections', 'FontSize', 14)
% text(10.6, 325, '11-08-14 TrF2', 'FontSize', 14)
% text(14.6, 325, '13-08-14 TrF2', 'FontSize', 14)
% 
% hold off
% 
% %% Distributions comparing treatments within same experiment; Rg
% close all
% 
% bins = struct('M1', [], 'M2', [], 'M2Mag', [], 'numLoc', [], 'volume', []);
% numBins = 25;
% 
% bins.M2Mag = linspace(0, 250, numBins);
% 
% %==========================================================================
% % 11-06-2014 Original FISH data
% %==========================================================================
% dataOffset = 0;
% numDatasets = 1;
% barLabels = cell(numDatasets,1);
% 
% % L dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc(data(dataCtr + dataOffset).distributions1.M2Mag, bins.M2Mag);
%     dx = diff(bins.M2Mag);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% bar(bins.M2Mag, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.M2Mag)])
% ylim([0, 0.03])
% xlabel('R_g, nm')
% ylabel('Normalized frequency')
% title('Hela L')
% grid on
% 
% % S dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc(data(dataCtr + dataOffset).distributions2.M2Mag, bins.M2Mag);
%     dx = diff(bins.M2Mag);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.M2Mag, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.M2Mag)])
% ylim([0, 0.03])
% xlabel('R_g, nm')
% ylabel('Normalized frequency')
% title('Hela S')
% grid on
% 
% %==========================================================================
% % 29-07-2014 SmchD1
% %==========================================================================
% dataOffset = 1;
% numDatasets = 3;
% barLabels = cell(numDatasets,1);
% 
% % L dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc(data(dataCtr + dataOffset).distributions1.M2Mag, bins.M2Mag);
%     dx = diff(bins.M2Mag);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.M2Mag, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.M2Mag)])
% ylim([0, 0.03])
% xlabel('R_g, nm')
% ylabel('Normalized frequency')
% title('Hela L')
% grid on
% 
% % S dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc(data(dataCtr + dataOffset).distributions2.M2Mag, bins.M2Mag);
%     dx = diff(bins.M2Mag);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.M2Mag, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.M2Mag)])
% ylim([0, 0.03])
% xlabel('R_g, nm')
% ylabel('Normalized frequency')
% title('Hela S')
% grid on
% 
% %==========================================================================
% % 30-07-2014 SmchD1
% %==========================================================================
% dataOffset = 4;
% numDatasets = 3;
% barLabels = cell(numDatasets,1);
% 
% % L dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc(data(dataCtr + dataOffset).distributions1.M2Mag, bins.M2Mag);
%     dx = diff(bins.M2Mag);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.M2Mag, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.M2Mag)])
% ylim([0, 0.03])
% xlabel('R_g, nm')
% ylabel('Normalized frequency')
% title('Hela L')
% grid on
% 
% % S dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc(data(dataCtr + dataOffset).distributions2.M2Mag, bins.M2Mag);
%     dx = diff(bins.M2Mag);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.M2Mag, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.M2Mag)])
% ylim([0, 0.03])
% xlabel('R_g, nm')
% ylabel('Normalized frequency')
% title('Hela S')
% grid on
% 
% %==========================================================================
% % 08-05-2014 LRif1
% %==========================================================================
% dataOffset = 7;
% numDatasets = 3;
% barLabels = cell(numDatasets,1);
% 
% % L dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc(data(dataCtr + dataOffset).distributions1.M2Mag, bins.M2Mag);
%     dx = diff(bins.M2Mag);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.M2Mag, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.M2Mag)])
% ylim([0, 0.03])
% xlabel('R_g, nm')
% ylabel('Normalized frequency')
% title('First transfection')
% grid on
% 
% % S dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc(data(dataCtr + dataOffset).distributions2.M2Mag, bins.M2Mag);
%     dx = diff(bins.M2Mag);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.M2Mag, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.M2Mag)])
% ylim([0, 0.03])
% xlabel('R_g, nm')
% ylabel('Normalized frequency')
% title('Second transfection')
% grid on
% 
% %==========================================================================
% % 11-08-2014 SmchD1
% %==========================================================================
% dataOffset = 10;
% numDatasets = 4;
% barLabels = cell(numDatasets,1);
% 
% % L dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc(data(dataCtr + dataOffset).distributions1.M2Mag, bins.M2Mag);
%     dx = diff(bins.M2Mag);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.M2Mag, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.M2Mag)])
% ylim([0, 0.03])
% xlabel('R_g, nm')
% ylabel('Normalized frequency')
% title('Hela L')
% grid on
% 
% % S dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc(data(dataCtr + dataOffset).distributions2.M2Mag, bins.M2Mag);
%     dx = diff(bins.M2Mag);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.M2Mag, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.M2Mag)])
% ylim([0, 0.03])
% xlabel('R_g, nm')
% ylabel('Normalized frequency')
% title('Hela S')
% grid on
% 
% %==========================================================================
% % 13-08-2014 SmchD1
% %==========================================================================
% dataOffset = 14;
% numDatasets = 4;
% barLabels = cell(numDatasets,1);
% 
% % L dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc(data(dataCtr + dataOffset).distributions1.M2Mag, bins.M2Mag);
%     dx = diff(bins.M2Mag);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.M2Mag, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.M2Mag)])
% ylim([0, 0.03])
% xlabel('R_g, nm')
% ylabel('Normalized frequency')
% title('Hela L')
% grid on
% 
% % S dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc(data(dataCtr + dataOffset).distributions2.M2Mag, bins.M2Mag);
%     dx = diff(bins.M2Mag);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.M2Mag, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.M2Mag)])
% ylim([0, 0.03])
% xlabel('R_g, nm')
% ylabel('Normalized frequency')
% title('Hela S')
% grid on
% 
% %% Distributions comparing treatments within same experiment; volume^(1/3)
% close all
% 
% numBins = 25;
% 
% bins.volume = linspace(0, 350, numBins);
% yMaxLimit = 0.02;
% 
% %==========================================================================
% % 11-06-2014 Original FISH data
% %==========================================================================
% dataOffset = 0;
% numDatasets = 1;
% barLabels = cell(numDatasets,1);
% 
% % L dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc((data(dataCtr + dataOffset).distributions1.volume).^(1/3), bins.volume);
%     dx = diff(bins.volume);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% bar(bins.volume, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.volume)])
% ylim([0, yMaxLimit])
% xlabel('Cube root of volume, nm')
% ylabel('Normalized frequency')
% title('Hela L')
% grid on
% 
% % S dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc((data(dataCtr + dataOffset).distributions2.volume).^(1/3), bins.volume);
%     dx = diff(bins.volume);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.volume, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.volume)])
% ylim([0, yMaxLimit])
% xlabel('Cube root of volume, nm')
% ylabel('Normalized frequency')
% title('Hela S')
% grid on
% 
% %==========================================================================
% % 29-07-2014 SmchD1
% %==========================================================================
% dataOffset = 1;
% numDatasets = 3;
% barLabels = cell(numDatasets,1);
% 
% % L dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc((data(dataCtr + dataOffset).distributions1.volume).^(1/3), bins.volume);
%     dx = diff(bins.volume);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.volume, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.volume)])
% ylim([0, yMaxLimit])
% xlabel('Cube root of volume, nm')
% ylabel('Normalized frequency')
% title('Hela L')
% grid on
% 
% % S dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc((data(dataCtr + dataOffset).distributions2.volume).^(1/3), bins.volume);
%     dx = diff(bins.volume);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.volume, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.volume)])
% ylim([0, yMaxLimit])
% xlabel('Cube root of volume, nm')
% ylabel('Normalized frequency')
% title('Hela S')
% grid on
% 
% %==========================================================================
% % 30-07-2014 SmchD1
% %==========================================================================
% dataOffset = 4;
% numDatasets = 3;
% barLabels = cell(numDatasets,1);
% 
% % L dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc((data(dataCtr + dataOffset).distributions1.volume).^(1/3), bins.volume);
%     dx = diff(bins.volume);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.volume, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.volume)])
% ylim([0, yMaxLimit])
% xlabel('Cube root of volume, nm')
% ylabel('Normalized frequency')
% title('Hela L')
% grid on
% 
% % S dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc((data(dataCtr + dataOffset).distributions2.volume).^(1/3), bins.volume);
%     dx = diff(bins.volume);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.volume, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.volume)])
% ylim([0, yMaxLimit])
% xlabel('Cube root of volume, nm')
% ylabel('Normalized frequency')
% title('Hela S')
% grid on
% 
% %==========================================================================
% % 08-05-2014 LRif1
% %==========================================================================
% dataOffset = 7;
% numDatasets = 3;
% barLabels = cell(numDatasets,1);
% 
% % L dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc((data(dataCtr + dataOffset).distributions1.volume).^(1/3), bins.volume);
%     dx = diff(bins.volume);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.volume, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.volume)])
% ylim([0, yMaxLimit])
% xlabel('Cube root of volume, nm')
% ylabel('Normalized frequency')
% title('First transfection')
% grid on
% 
% % S dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc((data(dataCtr + dataOffset).distributions2.volume).^(1/3), bins.volume);
%     dx = diff(bins.volume);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.volume, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.volume)])
% ylim([0, yMaxLimit])
% xlabel('Cube root of volume, nm')
% ylabel('Normalized frequency')
% title('Second transfection')
% grid on
% 
% %==========================================================================
% % 11-08-2014 SmchD1
% %==========================================================================
% dataOffset = 10;
% numDatasets = 4;
% barLabels = cell(numDatasets,1);
% 
% % L dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc((data(dataCtr + dataOffset).distributions1.volume).^(1/3), bins.volume);
%     dx = diff(bins.volume);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.volume, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.volume)])
% ylim([0, yMaxLimit])
% xlabel('Cube root of volume, nm')
% ylabel('Normalized frequency')
% title('Hela L')
% grid on
% 
% % S dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc((data(dataCtr + dataOffset).distributions2.volume).^(1/3), bins.volume);
%     dx = diff(bins.volume);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.volume, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.volume)])
% ylim([0, yMaxLimit])
% xlabel('Cube root of volume, nm')
% ylabel('Normalized frequency')
% title('Hela S')
% grid on
% 
% %==========================================================================
% % 13-08-2014 SmchD1
% %==========================================================================
% dataOffset = 14;
% numDatasets = 4;
% barLabels = cell(numDatasets,1);
% 
% % L dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc((data(dataCtr + dataOffset).distributions1.volume).^(1/3), bins.volume);
%     dx = diff(bins.volume);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.volume, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.volume)])
% ylim([0, yMaxLimit])
% xlabel('Cube root of volume, nm')
% ylabel('Normalized frequency')
% title('Hela L')
% grid on
% 
% % S dataset
% N = zeros(numBins, numDatasets);
% Norm = zeros(numDatasets,1);
% for dataCtr = 1:numDatasets
%     [N(:, dataCtr), BIN] = histc((data(dataCtr + dataOffset).distributions2.volume).^(1/3), bins.volume);
%     dx = diff(bins.volume);
%     dx = dx(1);
% 
%     Norm(dataCtr) = sum(dx * N(:,dataCtr));
%     
%     barLabels{dataCtr} = data(dataCtr + dataOffset).shortName;
% end
% 
% figure
% bar(bins.volume, N ./ repmat(Norm', size(N,1), 1), 'histc')
% legend(barLabels)
% xlim([0, max(bins.volume)])
% ylim([0, yMaxLimit])
% xlabel('Cube root of volume, nm')
% ylabel('Normalized frequency')
% title('Hela S')
% grid on

