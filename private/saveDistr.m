% Helper function for saving distributions to a text file.
%
% This function requires a .mat file containing the relevant data loaded
% into the workspace.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2015/03/20 $ $REVISION: 0.2 $

function saveDistr(data, experimentName, datasetName, distribution)
    filterData = findData(data, experimentName, datasetName);
    
    distr = filterData.distributions.(distribution);
    
    % Check for existence of folder for saved distribution data. Create it
    % if it doesn't exist.
    if ~exist('saved_distrs', 'dir')
        mkdir('saved_distrs');
    end
    
    % Replace spaces with underscores
    fName = [experimentName '_' datasetName '_' distribution];
    fName = regexprep(fName, ' ', '_');
    
    formatSpec = '%.4f\n';
    
    disp(['Writing data to file: ' fName])
    fileID = fopen(['saved_distrs/' fName], 'w');
    fprintf(fileID, formatSpec, distr);
    fclose(fileID);
    
end