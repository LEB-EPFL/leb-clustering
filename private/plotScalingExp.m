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