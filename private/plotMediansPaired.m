function plotMediansPaired(data, fieldName, figParams, errorBar, fullScreen)
% For plotting medians when all data are paired L and S datasets.
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

medianVal1 = zeros(numDatasets,1); err1 = zeros(numDatasets,1);
medianVal2 = zeros(numDatasets,1); err2 = zeros(numDatasets,1);

for ctr = 1:2:numDatasets
    medianVal1(ctr) = median(data(ctr).distributions.(fieldName));
    medianVal2(ctr) = median(data(ctr + 1).distributions.(fieldName));
    
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
medianVal1 = medianVal1(medianVal1 ~= 0); medianVal2 = medianVal2(medianVal2 ~=0);
err1 = err1(err1 ~=0); err2 = err2(err2 ~= 0);
tickLabels = tickLabels(~cellfun(@isempty, tickLabels));

% If the length of data is two, append zeros to the end of the scalingExp
% and confInt2 arrays to get the two bars to appear as different colors.
% This is because barwitherr will create two bars of the same color if its
% arguments are not arrays, as is the case with only two datasets
% (scalingExp1 and scalingExp2 would be two scalars in this case).
if length(medianVal1) == 1
    medianVal1 = [medianVal1; 0]; medianVal2 = [medianVal2; 0];
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
barwitherr([err1 err2], xTicks , [medianVal1 medianVal2])
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
    ylim([0 max(max(medianVal1 + err1, medianVal2 + err2))])
end

set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels);
xticklabel_rotate(xTicks, 25, tickLabels);
set(findall(gcf,'type','text'),'FontSize',14,'fontWeight','bold');
grid on

% Place vertical divders on the plot to separate datasets
hold on;
if isfield(figParams, 'dividers')
    for x = figParams.dividers
        plot([x, x], get(gca,'YLim'), 'k--');
    end
end
hold off

pause(2)
end