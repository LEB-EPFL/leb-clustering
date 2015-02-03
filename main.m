% The main script for analyzing the telomere data and producing reports.
%
% This script should be run after the analysis workflow is determined from
% data_mining.m.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/12/05 $ $REVISION: 1.4 $
%

function [data] = main()
%% Where should the data structure be saved?
saveFolder = uigetdir('', ...
                      'Choose where the data structure will be saved.');

%% Filtering options
% Filter data based on distance from robust power-law fit?
filterFit = false;

% Perform all three fit types, or just robust?
fitAll = true;

%% Use parallel processing to speed up computation? (use 'false' if unsure)
useParallel = true;

if useParallel
    % Start a Matlab pool if one hasn't started.
    gcp;
end

%% Define clustering and filtering parameters.
% k - number of objects in a neighborhood of an object 
% (minimal number of objects considered as a cluster)
% Eps - neighborhood radius, if not known avoid this parameter or put []
% minLoc - Discard all clusters with localizations fewer than this number.
% maxLoc - Discard all clusters with localizations greater than this
%          number. (Set to Inf if there you don't want an upper cutoff.)
k = 8;
Eps = 65;

minLoc = 50;
maxLoc = 1000;
%% Setup the data structure and designate files for analysis.
% Read in a separate file that setups up the data structures with
% descriptive names and root directories for each dataset.

cd data_structures/
data = experiment_5_SmchD1_TRF2();
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

%% Filter out upper level directors.
files = files(3:end);

%% Process the data within each file.
clear procData
procData(length(files),1).M1 = 0;
procData(length(files),1).M2 = 0;
procData(length(files),1).RgTrans = 0;
procData(length(files),1).Rg = 0;
procData(length(files),1).numLoc = 0;
procData(length(files),1).volume = 0;

% process_data(fileName) is custom function call.
if useParallel
    parfor ctr = 1:length(files)
        fileName = [completeDir files(ctr).name];
        currData = tdfread(fileName);
        currDataF = [currData.Xc currData.Yc currData.Zc];
        procData(ctr) = process_data(currDataF, k, Eps, minLoc, maxLoc);
    end
else
    for ctr = 1:length(files)
        fileName = [completeDir files(ctr).name];
        currData = tdfread(fileName);
        currDataF = [currData.Xc currData.Yc currData.Zc];
        procData(ctr) = process_data(currDataF, k, Eps, minLoc, maxLoc);
    end
end

%% Combine distrubtions from all elements of the data structures.
allData = struct('M1', [], 'M2', [], 'RgTrans', [], 'Rg', [], 'numLoc', [], 'volume', []);

for ctr = 1:length(files)
    allData.M1 = cat(1, allData.M1, procData(ctr).M1);
    allData.M2 = cat(1, allData.M2, procData(ctr).M2);
    allData.RgTrans = cat(1, allData.RgTrans, procData(ctr).RgTrans);
    allData.Rg = cat(1, allData.Rg, procData(ctr).Rg);
    allData.numLoc = cat(1, allData.numLoc, procData(ctr).numLoc);
    allData.volume = cat(1, allData.volume, procData(ctr).volume);
end

%% Perform initial filtering on the data?

if filterFit
    dataModel = fittype('a*x.^b');
    threshold = 1.5;

    % Write distributions out to the large data structure for the experiment.
    data(dataCtr).distributions = filter_noisy_clusters(allData, dataModel, threshold);
else
    data(dataCtr).distributions = allData;
end

%% Perform nonlinear least squares fits on Rg. vs. number of localizations
fittedData = fit_scaling_law(allData, fitAll);

% Assign fit information to data structure.
data(dataCtr).fits = fittedData.fits;

end % Ends loop over datasets.

%% Save the data
if saveFolder ~= 0
    save([saveFolder, '/matlab.mat'], ...
         'data', ...
         'k', ...
         'Eps', ...
         'minLoc', ...
         'maxLoc')
end
end
