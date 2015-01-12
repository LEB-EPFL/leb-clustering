% Data structure for Experiment_1: testing FISH vs. immunufluorescence

function [data] = experiment_1_FISH_immuno()

%==========================================================================
% 11-06-2014 WT FISH
%==========================================================================
% Hela L (set 1)
dataIn.experimentShortName = 'WT';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_06_2014_FISH_HelaS_L/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

%==========================================================================
% 29-08-2014 Hela L TRF1 Immunofluorescence
%==========================================================================
% Hela L (set 2)
dataIn.experimentShortName = 'TRF1 1000';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/29_08_2014_Hela_L_TRF1_IF/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF1_1000/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 3)
dataIn.experimentShortName = 'TRF1 2000';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/29_08_2014_Hela_L_TRF1_IF/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF1_2000/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

end