% Creates pooled datasets

function [dataOut] = makePooledDataset(data)
numDatasets = length(data);

for dataCtr = 1:numDatasets
    currExpName    = data(dataCtr).experimentShortName;
    currTeloLength = data(dataCtr).datasetShortName;
    
    isDataPooled = ~isempty(strfind(currExpName, 'Pooled'));
    
    if isDataPooled
        % Extract the type of cells (pSuper, TRF1, etc.)
        cellType = currExpName(8:end);
        
        % Look for every instance in data where:
        % 1) The data is not pooled
        % 2) The type of cells is the same
        % 3) The datasetShortName (Hela L, Hela S) is the same
        % and add its clusters to the current cell array of clusters
        data(dataCtr) = searchDataStruct(data, dataCtr, cellType, currTeloLength);
        dataOut = data;
        
    end
end

end

function [dataOut] = searchDataStruct(dataIn, pooledData, inputCellType, inputTeloLength)
numDatasets = length(dataIn);

for dataCtr = 1:numDatasets
    currExpName    = dataIn(dataCtr).experimentShortName;
    currTeloLength = dataIn(dataCtr).datasetShortName;

    isDataPooled = ~isempty(strfind(currExpName, 'Pooled'));
    
    % Skip the dataset if it's pooled. We don't want to add clusters from
    % these.
    if isDataPooled
        continue
    end

    % Remove the data from the experimentShortName to extract the cell type
    try
        currCellType = currExpName(12:end);
    catch
        % Executes if the experimentShortName length is less than 12, the
        % length of the date portion of the string.
        currCellType = 'not it';
    end
    sameCellType   = strcmp(currCellType, inputCellType);
    
    sameTeloLength = strcmp(currTeloLength, inputTeloLength);
    
    if sameCellType && sameTeloLength
        % Add clusters to pooled dataset
        numFiles = length(dataIn(dataCtr).manualFilteredData);
        for fileCtr = 1:numFiles
            dataIn(pooledData).autoFilteredData   = [dataIn(pooledData).autoFilteredData;   dataIn(dataCtr).autoFilteredData(fileCtr).clusters];
            dataIn(pooledData).manualFilteredData = [dataIn(pooledData).manualFilteredData; dataIn(dataCtr).manualFilteredData(fileCtr).clusters];
        end
    end
    
    dataOut = dataIn(pooledData);
    
end
end