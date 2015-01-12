% Data structure for Experiment_0: the original (WT) dataset

function [data] = experiment_0_Hela_LS()

%==========================================================================
% 11-06-2014 Original dataset with Hela L and Hela S
%==========================================================================
% Hela L (set 1)
dataIn.experimentShortName = 'Original Data';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_06_2014_FISH_HelaS_L/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

% Hela S (set 2)
dataIn.experimentShortName = 'Original Data';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_06_2014_FISH_HelaS_L/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

end