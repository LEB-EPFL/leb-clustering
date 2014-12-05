% Data structure for TRF1 knockdowns, TRF2 knockdowns, and TRF1 + TRF2
% double knockdowns on November 17, 2014.

function [data] = d06_11_2014_SmchD1_TRF2()
%==========================================================================
% pSuper
%==========================================================================
% Hela S
dataIn.experimentShortName = '06-11-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/06_11_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'Hela S/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

% Hela S
dataIn.experimentShortName = '06-11-2014 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/06_11_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'Hela S/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% pLVP041 and pLVP041 + TRF2 KD
%==========================================================================

% Hela S
dataIn.experimentShortName = '06-11-2014 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/06_11_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'Hela S/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S
dataIn.experimentShortName = '06-11-2014 pLVP041TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/06_11_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'Hela S/Molecule_Lists/pLVP041_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% pLVP042 and pLVP042 + TRF2 KD
%==========================================================================

% Hela S
dataIn.experimentShortName = '06-11-2014 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/06_11_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'Hela S/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S
dataIn.experimentShortName = '06-11-2014 pLVP042TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/06_11_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'Hela S/Molecule_Lists/pLVP042_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.
end