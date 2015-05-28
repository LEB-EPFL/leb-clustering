% Data structure for the test dataset

function [data] = test_data()

%==========================================================================
% 11-06-2014 Original dataset with Hela L and Hela S
%==========================================================================
% Hela L (set 1)
dataIn.experimentShortName = 'Test_Data';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Test_Data/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/Test_Data/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

% Hela S (set 2)
% dataIn.experimentShortName = 'Test Data';
% dataIn.datasetShortName = 'S dataset';
% dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_06_2014_FISH_HelaS_L/';
% dataIn.datasetDir = 'HelaS/Molecule_Lists/';
% dataIn.distributions = [];
% dataIn.fits = [];
% data = [data, dataIn]; % Appends this dataset to the data array.

end