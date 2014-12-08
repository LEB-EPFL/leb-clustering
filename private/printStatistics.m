%% Outputs statistics of the distributions to the screen.
function printStatistics(data)
    % Displays statistics from a distribution in the command window.
    %
    % data - Subset of elements from the master data array for printing.

    numDatasets = length(data);
    
    for dataCtr = 1:numDatasets
        currDist = data(dataCtr).distributions;
        currExpName = data(dataCtr).experimentShortName;
        currSetName = data(dataCtr).datasetShortName;
        
        formatSpec = 'Mean: %0.4f\t Std. Dev.: %0.4f\t Median: %0.4f\t';
        
        meanRg = mean(currDist.RgTrans);
        stdRg = std(currDist.RgTrans);
        medianRg = median(currDist.RgTrans);
        strRg = sprintf(formatSpec, meanRg, stdRg, medianRg);
                
        meanVolume = mean(currDist.volume);
        stdVolume = std(currDist.volume);
        medianVolume = median(currDist.volume);
        strVolume = sprintf(formatSpec, meanVolume, stdVolume, medianVolume);
        
        meanNumLoc = mean(currDist.numLoc);
        stdNumLoc = std(currDist.numLoc);
        medianNumLoc = median(currDist.numLoc);
        strNumLoc = sprintf(formatSpec, meanNumLoc, stdNumLoc, medianNumLoc);
                
        disp('===========================================================')
        disp(['Data for ' currExpName ' / ' currSetName])
        disp('===========================================================')
        disp(sprintf('\n'))
        disp('Radius of gyration')
        disp(strRg)
        disp(sprintf('\n'))
        disp('Volume')
        disp(strVolume)
        disp(sprintf('\n'))
        disp('Number of localizations')
        disp(strNumLoc)
        disp(sprintf('\n'))
        disp(['Number of clusters: ' num2str(length(currDist.RgTrans))])
        disp(sprintf('\n'))
             
    end
end