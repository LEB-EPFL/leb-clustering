% Data structure for TRF1 knockdowns, TRF2 knockdowns, and TRF1 + TRF2
% double knockdowns on November 17, 2014.

function [data] = d17_11_2014_TRF1_TRF2()
%==========================================================================
% pSuper
%==========================================================================
% Hela L
dataIn.experimentShortName = '17-11-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela L/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

% Hela S
dataIn.experimentShortName = '17-11-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela S/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% TRF1 Knockdowns
%==========================================================================
% Hela L
dataIn.experimentShortName = '17-11-2014 TRF1';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela L/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S
dataIn.experimentShortName = '17-11-2014 TRF1';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela S/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% TRF2 Knockdowns
%==========================================================================
% Hela L
dataIn.experimentShortName = '17-11-2014 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela L/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S
dataIn.experimentShortName = '17-11-2014 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela S/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% TRF1 and TRF2 Double Knockdowns
%==========================================================================
% Hela L
dataIn.experimentShortName = '17-11-2014 TRF1TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela L/Molecule_Lists/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S
dataIn.experimentShortName = '17-11-2014 TRF1TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela S/Molecule_Lists/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.
end