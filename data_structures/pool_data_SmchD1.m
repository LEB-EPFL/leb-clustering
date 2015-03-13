% Data structure for new TRF2 KD experiments and analyses.

function [data] = pool_data_SmchD1()

%==========================================================================
% 11-06-2014 Original data compared to 29-08-2014 TRF1 IF
%==========================================================================
% Hela L (set 1)
dataIn.experimentShortName = '11-06-2014 Original data';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_06_2014_FISH_HelaS_L/';
dataIn.datasetDir = '11_06_2014_Hela_L_FISH/Hela L FISH molecule lists/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

% Hela L (set 2)
dataIn.experimentShortName = '29-08-2014 TRF1 1000';
dataIn.datasetShortName = 'L dataset - 1000';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/29_08_2014_Hela_L_TRF1_IF/29_08_2014_Hela_L_TRF1_IF_mol_lists/';
dataIn.datasetDir = '29_08_2014_HelaS_TRF1_1_1000_LG_IF_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 3)
dataIn.experimentShortName = '29-08-2014 TRF1 2000';
dataIn.datasetShortName = 'L dataset - 2000';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/29_08_2014_Hela_L_TRF1_IF/29_08_2014_Hela_L_TRF1_IF_mol_lists/';
dataIn.datasetDir = '29_08_2014_HelaS_TRF1_1_2000_LG_IF_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% Compare 13-08-2014 pSuper and TRF2 to 18-08-2014
%=========================================================================
% Hela L (set 4)
dataIn.experimentShortName = '13-08-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list/';
dataIn.datasetDir = '13_08_2014_HelaL_SmchD1_TRF2_KD_FISH_pSuper_Mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 5)
dataIn.experimentShortName = '13-08-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list/';
dataIn.datasetDir = '13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_pSuper_Mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 6)
dataIn.experimentShortName = '18-08-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/18_08_2014_HelaS_L_TRF2_KD_FISH/18_08_2014_HelaS_L_TRF2_KD_filtered_data_mol_lists/';
dataIn.datasetDir = '18_08_2014_HelaL_pSuper_filtered_data_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 7)
dataIn.experimentShortName = '18-08-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/18_08_2014_HelaS_L_TRF2_KD_FISH/18_08_2014_HelaS_L_TRF2_KD_filtered_data_mol_lists/';
dataIn.datasetDir = '18_08_2014_HelaS_pSuper_filtered_data_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 8)
dataIn.experimentShortName = '13-08-2014 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list/';
dataIn.datasetDir = '13_08_2014_HelaL_SmchD1_TRF2_KD_FISH_TRF2_KD_Mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 9)
dataIn.experimentShortName = '13-08-2014 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list/';
dataIn.datasetDir = '13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_TRF2_KD_Mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 10)
dataIn.experimentShortName = '18-08-2014 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/18_08_2014_HelaS_L_TRF2_KD_FISH/18_08_2014_HelaS_L_TRF2_KD_filtered_data_mol_lists/';
dataIn.datasetDir = '18_08_2014_HelaL_TRF2_KD_filtered_data_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 11)
dataIn.experimentShortName = '18-08-2014 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/18_08_2014_HelaS_L_TRF2_KD_FISH/18_08_2014_HelaS_L_TRF2_KD_filtered_data_mol_lists/';
dataIn.datasetDir = '18_08_2014_HelaS_TRF2_KD_filtered_data_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 11-08-2014 30000 frames
%==========================================================================

% Hela L (set 12)
dataIn.experimentShortName = '11-08-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/';
dataIn.datasetDir = '11_08_2014_HeLaL_KD_Smchd1_TRF2_pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 13)
dataIn.experimentShortName = '11-08-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/';
dataIn.datasetDir = '11_08_2014_HeLaS_KD_Smchd1_TRF2_pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% INSERT 30000 FRAMES HERE

%==========================================================================
% SmchD1 KD from pooled data
%==========================================================================
% Hela L (set 14)
dataIn.experimentShortName = 'SmchD1 Pooled pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1/HelaL/';
dataIn.datasetDir = 'pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 15)
dataIn.experimentShortName = 'SmchD1 Pooled pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1/HelaS/';
dataIn.datasetDir = 'pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 16)
dataIn.experimentShortName = 'SmchD1 Pooled pLVP041';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1/HelaL/';
dataIn.datasetDir = 'pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 17)
dataIn.experimentShortName = 'SmchD1 Pooled pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1/HelaS/';
dataIn.datasetDir = 'pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 18)
dataIn.experimentShortName = 'SmchD1 Pooled pLVP042';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1/HelaL/';
dataIn.datasetDir = 'pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 19)
dataIn.experimentShortName = 'SmchD1 Pooled pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1/HelaS/';
dataIn.datasetDir = 'pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% TRF2 KD from pooled data
%==========================================================================
% Hela L (set 20)
dataIn.experimentShortName = 'TRF2 Pooled pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF2/HelaL/';
dataIn.datasetDir = 'pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 21)
dataIn.experimentShortName = 'TRF2 Pooled pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF2/HelaS/';
dataIn.datasetDir = 'pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 22)
dataIn.experimentShortName = 'TRF2 Pooled TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF2/HelaL/';
dataIn.datasetDir = 'TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 23)
dataIn.experimentShortName = 'TRF2 Pooled TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF2/HelaS/';
dataIn.datasetDir = 'TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

end