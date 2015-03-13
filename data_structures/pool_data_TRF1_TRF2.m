% Data structure for new TRF2 KD experiments and analyses.

function [data] = pool_data_TRF1_TRF2()

%==========================================================================
% Pooled TRF1 and TRF2 double knockdowns
%==========================================================================
% Hela L (set 1)
dataIn.experimentShortName = 'Pooled pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_pSuper/';
dataIn.datasetDir = 'HelaL/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

% Hela S (set 2)
dataIn.experimentShortName = 'Pooled pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_pSuper/';
dataIn.datasetDir = 'HelaS/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 3)
dataIn.experimentShortName = 'Pooled TRF1 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1_TRF2/';
dataIn.datasetDir = 'HelaL/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 4)
dataIn.experimentShortName = 'Pooled TRF1 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1_TRF2/';
dataIn.datasetDir = 'HelaS/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% TRF2 KD from pooled data
%==========================================================================
% Hela L (set 5)
dataIn.experimentShortName = 'Pooled TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF2/HelaL/';
dataIn.datasetDir = 'TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 6)
dataIn.experimentShortName = 'Pooled TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF2/HelaS/';
dataIn.datasetDir = 'TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% Pooled TRF1 KD data
%==========================================================================
% Hela L (set 7)
dataIn.experimentShortName = 'Pooled TRF1';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1/HelaL/';
dataIn.datasetDir = 'TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 8)
dataIn.experimentShortName = 'Pooled TRF1';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1/HelaS/';
dataIn.datasetDir = 'TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 08-09-2014 TRF1 and TRF2 double knockdowns
%==========================================================================
% Hela L (set 9)
dataIn.experimentShortName = '08-09-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/08_09_2014_HelaS_L_Trf1_Trf2_KD_DAPI_FISH_mol_lists/';
dataIn.datasetDir = '08_09_2014_HelaL_DAPI_FISH_pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 10)
dataIn.experimentShortName = '08-09-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/08_09_2014_HelaS_L_Trf1_Trf2_KD_DAPI_FISH_mol_lists/';
dataIn.datasetDir = '08_09_2014_HelaS_DAPI_FISH_pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 11)
dataIn.experimentShortName = '08-09-2014 TRF1 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/08_09_2014_HelaS_L_Trf1_Trf2_KD_DAPI_FISH_mol_lists/';
dataIn.datasetDir = '08_09_2014_HelaL_DAPI_FISH_TRF2_TRF1_KD/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 12)
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
% Hela L (set 13)
dataIn.experimentShortName = '09-09-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = '09_09_2014_HelaS_L_Trf1_Trf2_KD_FISH_mol_lists/09_09_2014_HelaL_FISH_pSuper_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 14)
dataIn.experimentShortName = '09-09-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = '09_09_2014_HelaS_L_Trf1_Trf2_KD_FISH_mol_lists/09_09_2014_HelaS_FISH_pSuper_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 15)
dataIn.experimentShortName = '09-09-2014 TRF1 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = '09_09_2014_HelaS_L_Trf1_Trf2_KD_FISH_mol_lists/09_09_2014_HelaL_FISH_TRF2_TRF1_KD_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 16)
dataIn.experimentShortName = '09-09-2014 TRF1 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = '09_09_2014_HelaS_L_Trf1_Trf2_KD_FISH_mol_lists/09_09_2014_HelaS_FISH_TRF2_TRF1_KD_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 05-11-2014 TRF1 and TRF2 data
%==========================================================================
% Hela L (set 17)
dataIn.experimentShortName = '05-11-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/05_11_2014_HeLaS_L_TRF1_TRF2_doubleKD_FISH_Molecule lists/';
dataIn.datasetDir = 'HelaL_pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 18)
dataIn.experimentShortName = '05-11-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/05_11_2014_HeLaS_L_TRF1_TRF2_doubleKD_FISH_Molecule lists/';
dataIn.datasetDir = 'HelaS_pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 19)
dataIn.experimentShortName = '05-11-2014 TRF1';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/05_11_2014_HeLaS_L_TRF1_TRF2_doubleKD_FISH_Molecule lists/';
dataIn.datasetDir = 'Hela L_TRF1_KD/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 20)
dataIn.experimentShortName = '05-11-2014 TRF1';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/05_11_2014_HeLaS_L_TRF1_TRF2_doubleKD_FISH_Molecule lists/';
dataIn.datasetDir = 'Hela S_TRF1_KD/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 21)
dataIn.experimentShortName = '05-11-2014 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/05_11_2014_HeLaS_L_TRF1_TRF2_doubleKD_FISH_Molecule lists/';
dataIn.datasetDir = 'Hela L_TRF2_KD/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 22)
dataIn.experimentShortName = '05-11-2014 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/05_11_2014_HeLaS_L_TRF1_TRF2_doubleKD_FISH_Molecule lists/';
dataIn.datasetDir = 'Hela S_TRF2_KD/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 23)
dataIn.experimentShortName = '05-11-2014 TRF1TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/05_11_2014_HeLaS_L_TRF1_TRF2_doubleKD_FISH_Molecule lists/';
dataIn.datasetDir = 'Hela L_TRF2_TRF1_KD/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 24)
dataIn.experimentShortName = '05-11-2014 TRF1TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/05_11_2014_HeLaS_L_TRF1_TRF2_doubleKD_FISH_Molecule lists/';
dataIn.datasetDir = 'Hela S_TRF2_TRF1_KD/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.