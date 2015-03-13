% Helps to determine the proper DBSCAN parameters to use.
%
% This script sweeps through a combination of different values for the two
% DBSCAN parameters (k and Eps) and determines an experimentally relevant
% average number for each combination, e.g. the radius of gyration, number
% of points in a cluster, etc. The resulting averages are plotted as a
% surface against each (k, Eps) dataset.
%
% Plateaus in the surface are expected to indicate stable parameter values
% for the clustering algorithm.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/09/17 $ $REVISION: 0.1 $

%% Use parallel processing to speed up computation? (use 'false' if unsure)
useParallel = true;

% if useParallel
%     matlabpool open
% end

tic

%% Set the range of DBSCAN parameters to test.
k = 2:2:20;
Eps = 35:10:195;

[K, EPS] = meshgrid(k, Eps);

minLoc = 50;
maxLoc = 1000;

%% Setup the data structure and designate files for analysis.
% Read in a separate file that setups up the data structures with
% descriptive names and root directories for each dataset.

data = orig_data_struct();

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
outputData(length(data)).Rg = zeros(length(K(:)),1);
outputData(length(data)).numLoc = zeros(length(K(:)),1);
outputData(length(data)).numClusters = zeros(length(K(:)),1);

for dataCtr = 14:length(data)
% Loops over all the data files defined above.
disp(['Processing experiment ' data(dataCtr).experimentShortName ' / ' data(dataCtr).datasetShortName])

completeDir = [data(dataCtr).rootDir data(dataCtr).datasetDir];

files = dir(completeDir);

%% Filter out upper level directors.
files = files(3:end);

%% Process the experimental data with each combination of parameters.
for paramCtr = 1:length(K(:))
    disp(['Parameters being tested: k - ' num2str(K(paramCtr)) ', Eps - ' num2str(EPS(paramCtr))])
    
    clear procData
    procData(length(files),1).M1 = 0;
    procData(length(files),1).M2 = 0;
    procData(length(files),1).Rg = 0;
    procData(length(files),1).numLoc = 0;
    procData(length(files),1).volume = 0;
    if useParallel
        parfor ctr = 1:length(files)
            fileName = [completeDir files(ctr).name];
            currData = tdfread(fileName);
            currDataF = [currData.Xc currData.Yc currData.Zc];
            procData(ctr) = process_data(currDataF, K(paramCtr), EPS(paramCtr), minLoc, maxLoc);
        end
    else
        for ctr = 1:length(files)
            fileName = [completeDir files(ctr).name];
            currData = tdfread(fileName);
            currDataF = [currData.Xc currData.Yc currData.Zc];
            procData(ctr) = process_data(currDataF, K(paramCtr), EPS(paramCtr), minLoc, maxLoc);
        end
    end

    %% Combine distrubtions from all elements of the data structures.
    clear allData
    allData = struct('M1', [], 'M2', [], 'Rg', [], 'numLoc', [], 'volume', []);

    for ctr = 1:length(files)
        allData.M1 = cat(1, allData.M1, procData(ctr).M1);
        allData.M2 = cat(1, allData.M2, procData(ctr).M2);
        allData.Rg = cat(1, allData.Rg, procData(ctr).Rg);
        allData.numLoc = cat(1, allData.numLoc, procData(ctr).numLoc);
        allData.volume = cat(1, allData.volume, procData(ctr).volume);
    end

    % Write distributions out to the large data structure for the experiment.
    outputData(dataCtr).Rg(paramCtr) = mean(allData.Rg);
    outputData(dataCtr).numLoc(paramCtr) = mean(allData.numLoc);
    outputData(dataCtr).numClusters(paramCtr) = length(allData.Rg);
end
end
toc