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