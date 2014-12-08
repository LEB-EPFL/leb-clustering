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