% Prepare data for processing and saving.
%
% This script helps the process_data.m script by feeding it the
% localization data and filter parameters. It then saves the processed
% distributions to the appropriate directories.
%
% Inputs:
%   dataStructFile - (string)
%                    Name of file defining an experiment's data structure
%                    without the .m extension
%   saveFolder     - (string)
%                    Where should the .mat file be saved?
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2015/05/21 $ $REVISION: 2.0 $
% $FORMER NAME: main.m $
%

function [data] = process_helper(dataStructFile, saveFolder)

%% Use parallel processing to speed up automatic filtering?
useParallel = true;

%% Define clustering and filtering parameters.
% k - number of objects in a neighborhood of an object 
% (minimal number of objects considered as a cluster)
% Eps - neighborhood radius, if not known avoid this parameter or put []
% minLoc - Discard all clusters with localizations fewer than this number.
% maxLoc - Discard all clusters with localizations greater than this
%          number. (Set to Inf if there you don't want an upper cutoff.)
% zAxisDist - Retain clusters with a center of mass that is less than or
%             equal to +/- this distance from the z=0 focal plane.
%             (300 nm is good for initial Telomere experiments)
% maxOnTime - How many consecutive frames can a pixel be on before its
%             localization is removed from the analysis?
% manualFilter - Perform a manual filtering to check and adjust the
%                automatic filtering results?
k            = 8;
Eps          = 65;

minLoc       = 50;
maxLoc       = 1000;

zAxisDist    = 300;

maxOnTime    = 10;

manualFilter = true;

%% Fitting options for size vs. number of localization plots
%  Filter data based on distance from robust power-law fit?
filterFit = false;

% Perform all three fit types, or just robust?
fitAll    = true;

%% ================= DO NOT MODIFY BELOW THIS LINE ========================
%  No more user inputs exist below here.

%% Setup the data structure and designate files for analysis.
% Read in a separate file that setups up the data structures with
% descriptive names and root directories for each dataset.

cd data_structures/
eval(['data =  ' dataStructFile '()']);
cd ..


%% Verify that all directories are correct.
for dirCtr = 1:length(data)
    completeDir = [data(dirCtr).rootDir data(dirCtr).datasetDir];
    
    A = exist(completeDir, 'dir');
    
    if A == 0
        error(['Error: directory ' completeDir ' does not exist.'])
    end
end
clear dirCtr

%% Primary processing loop.
for dataCtr = 1:length(data)
    % Loops over all the data files defined above.
    disp(['Processing experiment ' data(dataCtr).experimentShortName ' / ' data(dataCtr).datasetShortName])

    completeDir = [data(dataCtr).rootDir data(dataCtr).datasetDir];

    files = dir(completeDir);

    %% Filter out upper level directors (. and .. on Linux).
    %  This step may not be necessary on Windows
    files = files(3:end);

    %% Automatically cluster and filter the data
    %  Apply the automatic clustering and filtering steps whose parameters
    %  are defined above. The result of this step is a structure array with
    %  each element corresponding to one file in the dataset. Inside each
    %  element, there is a cell array containing the localizations
    %  belonging to each cluster, the noise (unclustered) localizations for
    %  this file, and the input parameters for cataloging.
    clear autoFilteredData
    autoFilteredData(length(files),1).fileName  = '';
    autoFilteredData(length(files),1).k         = 0;
    autoFilteredData(length(files),1).Eps       = 0;
    autoFilteredData(length(files),1).minLoc    = 0;
    autoFilteredData(length(files),1).maxLoc    = 0;
    autoFilteredData(length(files),1).zAxisDist = 0;
    autoFilteredData(length(files),1).maxOnTime = 0;
    autoFilteredData(length(files),1).clusters  = {};
    autoFilteredData(length(files),1).noise     = [];

    if useParallel
        parfor ctr = 1:length(files)
            fileName = [completeDir files(ctr).name];
            currData = tdfread(fileName);
            currDataF = [currData.Xc currData.Yc currData.Zc currData.Length];
            autoFilteredData(ctr) = auto_filter_data(currDataF, fileName, k, Eps, minLoc, maxLoc, zAxisDist, maxOnTime);
        end
    else
        for ctr = 1:length(files)
            fileName = [completeDir files(ctr).name];
            currData = tdfread(fileName);
            currDataF = [currData.Xc currData.Yc currData.Zc currData.Length];
            autoFilteredData(ctr) = auto_filter_data(currDataF, fileName, k, Eps, minLoc, maxLoc, zAxisDist, maxOnTime);
        end
    end
    
    data(dataCtr).autoFilteredData = autoFilteredData;
    disp('Finished with automatic filtering.')
end

%% Manually check and adjust automatically-filtered data
% %  This step could take a very a long time, depending on how many clusters
% %  are present in your full data set.
if manualFilter
    [data] = resumeManualFiltering(data, 1, 1, saveFolder);
end

%% Compute statistics for all of the clusters

% Automatically filtered data
for dataCtr = 1:length(data)
    numFiles = length(data(dataCtr).autoFilteredData);
    
    %  Combine distrubtions from all elements of the data structures.
    allData = struct('M1', [], ...
                     'M2', [], ...
                     'RgTrans', [], ...
                     'Rg', [], ...
                     'numLoc', [], ...
                     'volume', []);
    
    for fileCtr = 1:numFiles
        currFile = data(dataCtr).autoFilteredData(fileCtr).clusters;
        
        [M1, M2, RgTrans, Rg, numLoc, volume] = computeClusterStats(currFile);
        
        allData.M1 = cat(1, allData.M1, M1);
        allData.M2 = cat(1, allData.M2, M2);
        allData.RgTrans = cat(1, allData.RgTrans, RgTrans);
        allData.Rg = cat(1, allData.Rg, Rg);
        allData.numLoc = cat(1, allData.numLoc, numLoc);
        allData.volume = cat(1, allData.volume, volume);
    end
    
    data(dataCtr).distributionsAutoFiltered = allData;
end

% Manually filtered data
if manualFilter
    for dataCtr = 1:length(data)
        numFiles = length(data(dataCtr).manualFilteredData);

        %  Combine distrubtions from all elements of the data structures.
        allData = struct('M1', [], ...
                         'M2', [], ...
                         'RgTrans', [], ...
                         'Rg', [], ...
                         'numLoc', [], ...
                         'volume', []);

        for fileCtr = 1:numFiles
            currFile = data(dataCtr).manualFilteredData(fileCtr).clusters;

            [M1, M2, RgTrans, Rg, numLoc, volume] = computeClusterStats(currFile);

            allData.M1 = cat(1, allData.M1, M1);
            allData.M2 = cat(1, allData.M2, M2);
            allData.RgTrans = cat(1, allData.RgTrans, RgTrans);
            allData.Rg = cat(1, allData.Rg, Rg);
            allData.numLoc = cat(1, allData.numLoc, numLoc);
            allData.volume = cat(1, allData.volume, volume);
        end

        data(dataCtr).distributions = allData;
    end
end
%
% %% Perform post-processing filtering on data?
% %  Remove clusters that are farther than 1.5 standard deviations from a
% %  best-fit power law model.
% %
% % This is used to clean up log-log plots of size vs. number of
% % localizations.
% if filterFit
%     dataModel = fittype('a*x.^b');
%     threshold = 1.5;
% 
%     % Write distributions out to the large data structure for the experiment.
%     data(dataCtr).distributions = filter_noisy_clusters(allData, dataModel, threshold);
% else
%     data(dataCtr).distributions = allData;
% end
% 
% %% Perform nonlinear least squares fits on Rg. vs. number of localizations
% fittedData = fit_scaling_law(allData, fitAll);
% 
% % Assign fit information to data structure.
% data(dataCtr).fits = fittedData.fits;
% 
% %% Save the data
% if saveFolder ~= 0
%     save([saveFolder, '/matlab.mat'], ...
%          'data', ...
%          'k', ...
%          'Eps', ...
%          'minLoc', ...
%          'maxLoc')
% end
end
