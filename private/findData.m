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