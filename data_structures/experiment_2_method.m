% Data structure for Experiment_2: setting up the method

function [data] = experiment_2_method()

%==========================================================================
% Does 405 nm laser change results? No UV pSuper
%==========================================================================
% Hela L (set 1)
dataIn.experimentShortName = 'No UV pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

% Hela S (set 2)
dataIn.experimentShortName = 'No UV pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% Does 405 nm laser change results? UV pSuper
%==========================================================================
% Hela L (set 3)
dataIn.experimentShortName = 'UV pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/18_08_2014_HelaS_L_TRF2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 4)
dataIn.experimentShortName = 'UV pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/18_08_2014_HelaS_L_TRF2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% Does 405 nm laser change results? No UV TRF2
%==========================================================================
% Hela L (set 5)
dataIn.experimentShortName = 'No UV TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 6)
dataIn.experimentShortName = 'No UV TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% Does 405 nm laser change results? UV TRF2
%==========================================================================
% Hela L (set 7)
dataIn.experimentShortName = 'UV TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/18_08_2014_HelaS_L_TRF2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 8)
dataIn.experimentShortName = 'UV TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/18_08_2014_HelaS_L_TRF2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% Do 30,000 frames change the results? pSuper
%==========================================================================
% Hela L (set 9)
dataIn.experimentShortName = 'fr10k pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 10)
dataIn.experimentShortName = 'fr10k pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 11)
dataIn.experimentShortName = 'fr30k pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/20_08_2014_HelaS_L_TRF2_KD_30000_frames/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 12)
dataIn.experimentShortName = 'fr30k pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/20_08_2014_HelaS_L_TRF2_KD_30000_frames/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% Do 30,000 frames change the results? pTRF2
%==========================================================================
% Hela L (set 13)
dataIn.experimentShortName = 'fr10k TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 14)
dataIn.experimentShortName = 'fr10k TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 15)
dataIn.experimentShortName = 'fr30k TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/20_08_2014_HelaS_L_TRF2_KD_30000_frames/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 16)
dataIn.experimentShortName = 'fr30k TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/20_08_2014_HelaS_L_TRF2_KD_30000_frames/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.
end