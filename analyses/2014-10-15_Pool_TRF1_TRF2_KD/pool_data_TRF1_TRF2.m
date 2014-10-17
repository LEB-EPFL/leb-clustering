% Data structure for new TRF2 KD experiments and analyses.

function [data] = TRF1_TRF2()

%==========================================================================
% Pooled 08-09-2014 and 09-09-2014 TRF1 and TRF2 double knockdowns
%==========================================================================
% Hela L (set 1)
dataIn.experimentShortName = 'Pooled pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1_TRF2/';
dataIn.datasetDir = 'HelaL/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

% Hela S (set 2)
dataIn.experimentShortName = 'Pooled pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1_TRF2/';
dataIn.datasetDir = 'HelaS/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 3)
dataIn.experimentShortName = 'Pooled TRF1 TRF2 KD';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1_TRF2/';
dataIn.datasetDir = 'HelaL/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 4)
dataIn.experimentShortName = 'Pooled TRF1 TRF2 KD';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1_TRF2/';
dataIn.datasetDir = 'HelaS/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 08-09-2014 TRF1 and TRF2 double knockdowns
%==========================================================================
% Hela L (set 5)
dataIn.experimentShortName = '08-09-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/08_09_2014_HelaS_L_Trf1_Trf2_KD_DAPI_FISH_mol_lists/';
dataIn.datasetDir = '08_09_2014_HelaL_DAPI_FISH_pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 6)
dataIn.experimentShortName = '08-09-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/08_09_2014_HelaS_L_Trf1_Trf2_KD_DAPI_FISH_mol_lists/';
dataIn.datasetDir = '08_09_2014_HelaS_DAPI_FISH_pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 7)
dataIn.experimentShortName = '08-09-2014 TRF1 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/08_09_2014_HelaS_L_Trf1_Trf2_KD_DAPI_FISH_mol_lists/';
dataIn.datasetDir = '08_09_2014_HelaL_DAPI_FISH_TRF2_TRF1_KD/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 8)
dataIn.experimentShortName = '08-09-2014 TRF1 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/08_09_2014_HelaS_L_Trf1_Trf2_KD_DAPI_FISH_mol_lists/';
dataIn.datasetDir = '08_09_2014_HelaS_DAPI_FISH_TRF2_TRF1_KD/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 09-09-2014 TRF1 and TRF2 double knockdowns
%==========================================================================
% Hela L (set 9)
dataIn.experimentShortName = '09-09-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = '09_09_2014_HelaS_L_Trf1_Trf2_KD_FISH_mol_lists/09_09_2014_HelaL_FISH_pSuper_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 10)
dataIn.experimentShortName = '09-09-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = '09_09_2014_HelaS_L_Trf1_Trf2_KD_FISH_mol_lists/09_09_2014_HelaS_FISH_pSuper_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 11)
dataIn.experimentShortName = '09-09-2014 TRF1 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = '09_09_2014_HelaS_L_Trf1_Trf2_KD_FISH_mol_lists/09_09_2014_HelaL_FISH_TRF2_TRF1_KD_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 12)
dataIn.experimentShortName = '09-09-2014 TRF1 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = '09_09_2014_HelaS_L_Trf1_Trf2_KD_FISH_mol_lists/09_09_2014_HelaS_FISH_TRF2_TRF1_KD_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.
end