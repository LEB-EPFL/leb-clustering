% manual_filter_data()
%
% Resumes a manual filtering session by beginning at the first empty
% structure in a data.manualFilteredData struct. Use this if you stopped or
% were interrupted while performing the manual filtering step on a dataset.
%
% This requires that you load the .mat file that was being continuously
% saved during execution of process_helper.m.
%
% Author: Kyle M. Douglass, 2015

% Find spot where manual filtering was aborted and set a flag so it can be
% resumed at that spot.

function [filteredData] = manual_filter_data(data, currDataCtr, currFileCtr, saveFolder)

stopReached = false;

for dataCtr = currDataCtr:length(data)
    % Don't manually filter pooled data
    isDataPooled = ~isempty(strfind(data(dataCtr).experimentShortName, 'Pooled'));
    if isDataPooled
        continue
    end
    
    numFiles               = length(data(dataCtr).autoFilteredData);
    data(dataCtr).manualFilteredData(numFiles, 1).clusters     = {};
    data(dataCtr).manualFilteredData(numFiles, 1).keepOrReject = [];
    
    % Reset file counter after every iteration of the loop over each
    % element inside data.
    fileCtr = 1;
        
    for fileCtr = 1:numFiles
        disp(['Data counter: ' num2str(dataCtr) '/' num2str(length(data)) ', file counter: ' num2str(fileCtr) '/' num2str(numFiles)])

        % Check to see if we're before the stopped point
        if (fileCtr == currFileCtr)
            stopReached = true;
        end

        % If we are after the point where filtering stopped, resume manual
        % filtering steps.
        if stopReached;
            fileName   = data(dataCtr).autoFilteredData(fileCtr).fileName;
            clusters   = data(dataCtr).autoFilteredData(fileCtr).clusters;
            noise      = data(dataCtr).autoFilteredData(fileCtr).noise;
            teloLength = data(dataCtr).datasetShortName;

            fileNameImg = getImgPath(fileName);
            
            % Change delimiter to '\' on Windows
            fileNameParts = strsplit(fileNameImg, '/');
            
            disp(['Current image file: ' fileNameParts{end} ', ' teloLength])

            if ~isempty(clusters)
                filters = ManualFilter(clusters, fileNameImg, noise);
                waitfor(filters.hFig);

                keepOrReject = filters.keepOrReject;
                dataToKeep   = filters.outputClusters(keepOrReject);

                data(dataCtr).manualFilteredData(fileCtr).clusters     = dataToKeep;
                data(dataCtr).manualFilteredData(fileCtr).keepOrReject = keepOrReject;
            end

            currDataCtr = dataCtr;
            currFileCtr = fileCtr;

            % Save progress after every file
            save([saveFolder, '/matlab.mat'])
        end
    end

    disp(['Finished with manual filtering: ' data(dataCtr).experimentShortName])
end

[filteredData] = data;
end