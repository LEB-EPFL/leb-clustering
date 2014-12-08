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