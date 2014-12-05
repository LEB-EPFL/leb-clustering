% Data structure for new TRF2 KD experiments and analyses.

function [data] = pool_data_SmchD1_TRF2()

%==========================================================================
% Pooled data for SMCHD1 / TRF2 double KD
%==========================================================================
% Hela S (set 1)
dataIn.experimentShortName = 'Pooled pSuper/pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1_TRF2/HelaS/';
dataIn.datasetDir = 'pSuperPuro_pSuperBlast/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

% Hela S (set 2)
dataIn.experimentShortName = 'Pooled pSuper/TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1_TRF2/HelaS/';
dataIn.datasetDir = 'pSuperPuro_pTRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 3)
dataIn.experimentShortName = 'Pooled pLVP041/pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1_TRF2/HelaS/';
dataIn.datasetDir = 'pLVP041_pSuperBlast/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 4)
dataIn.experimentShortName = 'Pooled pLVP041/TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1_TRF2/HelaS/';
dataIn.datasetDir = 'pLVP041_pTRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 5)
dataIn.experimentShortName = 'Pooled pLVP042/pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1_TRF2/HelaS/';
dataIn.datasetDir = 'pLVP042_pSuperBlast/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 6)
dataIn.experimentShortName = 'Pooled pLVP042/TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1_TRF2/HelaS/';
dataIn.datasetDir = 'pLVP042_pTRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

end