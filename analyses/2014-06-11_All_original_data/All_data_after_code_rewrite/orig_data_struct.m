% Data structure for initial experiments (those prior to September 10,
% 2014).

function [data] = orig_data_struct()
%==========================================================================
% 11-06-2014 FISH Original data
%==========================================================================
% Hela L (set 1)
dataIn.experimentShortName = '11-06-2014 FISH';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Verena/11_06_2014_FISH_HelaS_L/11_06_2014_FISH_Hela_S_L/';
dataIn.datasetDir = '11_06_2014_Hela_L_FISH/Hela L FISH molecule lists/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

% Hela S (set 2)
dataIn.experimentShortName = '11-06-2014 FISH';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Verena/11_06_2014_FISH_HelaS_L/11_06_2014_FISH_Hela_S_L/';
dataIn.datasetDir = '11_06_2014_Hela_S_FISH/Hela S FISH molecule lists/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 29-07-2014 SmchD1
%==========================================================================
% Hela L (set 3)
dataIn.experimentShortName = '29-07-2014 SmchD1 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/29_07_2014_HelaS_L_SmchD1_KD_FISH/29_07_2014_HelaS_L_SmchD1_KD_FISH_Mol_lists/';
dataIn.datasetDir = '29_07_2014_HelaL_SmchD1_pSuper_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 4)
dataIn.experimentShortName = '29-07-2014 SmchD1 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/29_07_2014_HelaS_L_SmchD1_KD_FISH/29_07_2014_HelaS_L_SmchD1_KD_FISH_Mol_lists/';
dataIn.datasetDir = '29_07_2014_HelaS_SmchD1_pSuper_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 5)
dataIn.experimentShortName = '29-07-2014 SmchD1 pLVP041';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/29_07_2014_HelaS_L_SmchD1_KD_FISH/29_07_2014_HelaS_L_SmchD1_KD_FISH_Mol_lists/';
dataIn.datasetDir = '29_07_2014_HelaL_SmchD1_pLVP041_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 6)
dataIn.experimentShortName = '29-07-2014 SmchD1 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/29_07_2014_HelaS_L_SmchD1_KD_FISH/29_07_2014_HelaS_L_SmchD1_KD_FISH_Mol_lists/';
dataIn.datasetDir = '29_07_2014_HelaS_SmchD1_pLVP041_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 7)
dataIn.experimentShortName = '29-07-2014 SmchD1 pLVP042';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/29_07_2014_HelaS_L_SmchD1_KD_FISH/29_07_2014_HelaS_L_SmchD1_KD_FISH_Mol_lists/';
dataIn.datasetDir = '29_07_2014_HelaL_SmchD1_pLVP042_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 8)
dataIn.experimentShortName = '29-07-2014 SmchD1 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/29_07_2014_HelaS_L_SmchD1_KD_FISH/29_07_2014_HelaS_L_SmchD1_KD_FISH_Mol_lists/';
dataIn.datasetDir = '29_07_2014_HelaS_SmchD1_pLVP042_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 30-07-2014 SmchD1
%==========================================================================
% Hela L (set 9)
dataIn.experimentShortName = '30-07-2014 SmchD1 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = '30_07_2014_HelaL_SmchD1_pSuper_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 10)
dataIn.experimentShortName = '30-07-2014 SmchD1 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = '30_07_2014_HelaS_SmchD1_pSuper_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 11)
dataIn.experimentShortName = '30-07-2014 SmchD1 pLVP041';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = '30_07_2014_HelaL_SmchD1_pLVP041_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 12)
dataIn.experimentShortName = '30-07-2014 SmchD1 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = '30_07_2014_HelaS_SmchD1_pLVP041_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 13)
dataIn.experimentShortName = '30-07-2014 SmchD1 pLVP042';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = '30_07_2014_HelaL_SmchD1_pLVP042_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 14)
dataIn.experimentShortName = '30-07-2014 SmchD1 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = '30_07_2014_HelaS_SmchD1_pLVP042_mol_list/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 05-08-2014 Hela L LRif1
%==========================================================================
% Hela L (set 15)
dataIn.experimentShortName = '05-08-2014 Hela L siGfp';
dataIn.datasetShortName = '1st transfection';
dataIn.rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/05_08_2014_HelaL_LRif1_KD_FISH/05_08_2014_HelaL_LRif1_Mol_Lists/';
dataIn.datasetDir = '05_08_2014_HelaL_LRif1_siGfp_mol_lists/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 16)
dataIn.experimentShortName = '05-08-2014 Hela L siGfp';
dataIn.datasetShortName = '2nd transfection';
dataIn.rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/05_08_2014_HelaL_LRif1_KD_FISH/05_08_2014_HelaL_LRif1_Mol_Lists/';
dataIn.datasetDir = '05_08_2014_HelaL_LRif1_siGfp_tr2_mol_lists/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 17)
dataIn.experimentShortName = '05-08-2014 Hela L si1LRif1';
dataIn.datasetShortName = '1st transfection';
dataIn.rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/05_08_2014_HelaL_LRif1_KD_FISH/05_08_2014_HelaL_LRif1_Mol_Lists/';
dataIn.datasetDir = '05_08_2014_HelaL_LRif1_si1LRif1_mol_lists/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 18)
dataIn.experimentShortName = '05-08-2014 Hela L si1LRif1';
dataIn.datasetShortName = '2nd transfection';
dataIn.rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/05_08_2014_HelaL_LRif1_KD_FISH/05_08_2014_HelaL_LRif1_Mol_Lists/';
dataIn.datasetDir = '05_08_2014_HelaL_LRif1_si1LRif1_tr2_mol_lists/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 19)
dataIn.experimentShortName = '05-08-2014 Hela L si6LRif1';
dataIn.datasetShortName = '1st transfection';
dataIn.rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/05_08_2014_HelaL_LRif1_KD_FISH/05_08_2014_HelaL_LRif1_Mol_Lists/';
dataIn.datasetDir = '05_08_2014_HelaL_LRif1_si6LRif1_mol_lists/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 20)
dataIn.experimentShortName = '05-08-2014 Hela L si6LRif1';
dataIn.datasetShortName = '2nd transfection';
dataIn.rootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Telo2/05_08_2014_HelaL_LRif1_KD_FISH/05_08_2014_HelaL_LRif1_Mol_Lists/';
dataIn.datasetDir = '05_08_2014_HelaL_LRif1_si6LRif1_tr2_mol_lists/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 11-08-2014 TrF2
%==========================================================================
% Hela L (set 21)
dataIn.experimentShortName = '11-08-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/';
dataIn.datasetDir = '11_08_2014_HeLaL_KD_Smchd1_TRF2_pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 22)
dataIn.experimentShortName = '11-08-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/';
dataIn.datasetDir = '11_08_2014_HeLaS_KD_Smchd1_TRF2_pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 23)
dataIn.experimentShortName = '11-08-2014 pLVP041';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/';
dataIn.datasetDir = '11_08_2014_HeLaL_KD_Smchd1_TRF2_pLVP041_non filtered/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 24)
dataIn.experimentShortName = '11-08-2014 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/';
dataIn.datasetDir = '11_08_2014_HeLaS_KD_Smchd1_TRF2_pLVP041_non filtered/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 25)
dataIn.experimentShortName = '11-08-2014 pLVP042';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/';
dataIn.datasetDir = '11_08_2014_HeLaL_KD_Smchd1_TRF2_pLVP042_non filtered/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 26)
dataIn.experimentShortName = '11-08-2014 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/';
dataIn.datasetDir = '11_08_2014_HeLaS_KD_Smchd1_TRF2_pLVP042_non filtered/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 27)
dataIn.experimentShortName = '11-08-2014 TrF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/';
dataIn.datasetDir = '11_08_2014_HeLaL_KD_Smchd1_TRF2_pLVP TRF2_non filtered/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 28)
dataIn.experimentShortName = '11-08-2014 TrF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/11_08_2014_HeLaL_S_SMCHD1_Trf2_KD_FISH_Molecule lists/';
dataIn.datasetDir = '11_08_2014_HeLaS_KD_Smchd1_TRF2_pLVP TRF2_non filtered/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 13-08-2014 TrF2
%==========================================================================
% Hela L (set 29)
dataIn.experimentShortName = '13-08-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list_not_filtered/';
dataIn.datasetDir = '13_08_2014_HelaL_SmchD1_TRF2_KD_FISH_pSuper_Mol_list_not_filtered/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 30)
dataIn.experimentShortName = '13-08-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list_not_filtered/';
dataIn.datasetDir = '13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_pSuper_Mol_list_not_filtered/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 31)
dataIn.experimentShortName = '13-08-2014 pLVP041';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list_not_filtered/';
dataIn.datasetDir = '13_08_2014_HelaL_SmchD1_TRF2_KD_FISH_pLVP041_Mol_list_not_filtered/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 32)
dataIn.experimentShortName = '13-08-2014 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list_not_filtered/';
dataIn.datasetDir = '13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_pLVP041_Mol_list_not_filtered/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 33)
dataIn.experimentShortName = '13-08-2014 pLVP042';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list_not_filtered/';
dataIn.datasetDir = '13_08_2014_HelaL_SmchD1_TRF2_KD_FISH_pLVP042_Mol_list_not_filtered/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 34)
dataIn.experimentShortName = '13-08-2014 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list_not_filtered/';
dataIn.datasetDir = '13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_pLVP042_Mol_list_not_filtered/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 35)
dataIn.experimentShortName = '13-08-2014 TrF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list_not_filtered/';
dataIn.datasetDir = '13_08_2014_HelaL_SmchD1_TRF2_KD_FISH_TRF2_Mol_list_not_filtered/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 36)
dataIn.experimentShortName = '13-08-2014 TrF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_Mol_list_not_filtered/';
dataIn.datasetDir = '13_08_2014_HelaS_SmchD1_TRF2_KD_FISH_TRF2_Mol_list_not_filtered/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.
end