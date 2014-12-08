%% Plots the scaling exponents for each dataset from the robust fits.

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