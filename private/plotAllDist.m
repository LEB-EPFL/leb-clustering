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