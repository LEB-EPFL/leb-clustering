%% Plot median values.
function plotMedians(data, fieldName, figParams, errorBar, fullScreen)
% For plotting medians when data is not paired.
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

medianVal = zeros(numDatasets,1); err = zeros(numDatasets,1);

for ctr = 1:numDatasets
    medianVal(ctr) = median(data(ctr).distributions.(fieldName));
    
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
barwitherr(err, xTicks , medianVal)
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
    ylim([0 max(medianVal + err)])
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