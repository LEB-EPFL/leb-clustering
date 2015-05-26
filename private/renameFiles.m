% renameFiles Manual batch processing to rename files
%
% renameFiles(directory, suggestedName) loops through all files in a
% directory and, for each file, opens a dialog that allows one to create a
% copy of each file with a different name.
%
% Inputs
% ------
% directory     : string
%     Directory containing the files to rename
% suggestedName : string
%     The default suggestion for the file name
% extension     : string
%     Suffix to append to the new file (e.g. '.txt' or '.jp2')
%
% Author: Kyle M. Douglass, 2015

function renameFiles(directory, suggestedName, extension)  
currDir = pwd;

cd(directory)
files = dir(directory);

% Remove '.' and '..' from file list (possibly not needed on Windows)
files = files(3:end);

% Loops over each file and asks how to rename it
for ctr = 1:length(files)
    currFile = files(ctr).name;
    disp(currFile);

    numLines = 1;
    newName = inputdlg(['Current file name: ' currFile], ...
                        'Choose a new file name ENDING (e.g. 2_DAPI...).', ...
                        numLines, ...
                        {suggestedName});
                    
    newName = [suggestedName newName{1} extension];   
    % Copy the file with a new name
    copyfile(currFile, newName);                 
end

% Change back to the original directory
cd(currDir)
end