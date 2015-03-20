% Prepare data for processing and saving.
%
% This script helps the process_data.m script by feeding it the
% localization data and filter parameters. It then saves the processed
% distributions to the appropriate directories.
%
% Inputs:
%   dataStructFile - (string)
%                    Name of file defining an experiment's data structure
%   saveFolder     - (string)
%                    Where should the .mat file be saved?
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2015/03/20 $ $REVISION: 1.6 $
% $FORMER NAME: main.m $
%

function [data] = process_helper(dataStructFile, saveFolder)

%% Fitting options
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
% zAxisDist - Retain clusters with a center of mass that is less than or
%             equal to +/- this distance from the z=0 focal plane.
%             (300 nm is good for initial Telomere experiments)
% maxOnTime - How many consecutive frames can a pixel be on before its
%             localization is removed from the analysis?
k = 8;
Eps = 65;

minLoc = 50;
maxLoc = 1000;

zAxisDist = 300;

maxOnTime = 10;
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
        currDataF = [currData.Xc currData.Yc currData.Zc currData.Length];
        procData(ctr) = process_data(currDataF, k, Eps, minLoc, maxLoc, zAxisDist, maxOnTime);
    end
else
    for ctr = 1:length(files)
        fileName = [completeDir files(ctr).name];
        currData = tdfread(fileName);
        currDataF = [currData.Xc currData.Yc currData.Zc currData.Length];
        procData(ctr) = process_data(currDataF, k, Eps, minLoc, maxLoc, zAxisDist, maxOnTime);
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
% Remove clusters that are farther than 1.5 standard deviations from a
% best-fit power law model.
%
% This is used to clean up log-log plots of size vs. number of
% localizations.
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
