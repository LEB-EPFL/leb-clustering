% Data structure for Experiment_3: SmchD1 knockdowns.

function [data] = pool_data_SmchD1()

%==========================================================================
% Pooled pSuper from SmchD1 experiments.
%==========================================================================
% Hela L (set 1)
dataIn.experimentShortName = 'Pooled pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Experiment_3_Pooled_SmchD1/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

% Hela S (set 2)
dataIn.experimentShortName = 'Pooled pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Experiment_3_Pooled_SmchD1/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% Pooled pLVP041 data
%==========================================================================
% Hela L (set 3)
dataIn.experimentShortName = 'Pooled pLVP041';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Experiment_3_Pooled_SmchD1/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 4)
dataIn.experimentShortName = 'Pooled pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Experiment_3_Pooled_SmchD1/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% Pooled pLVP042 data
%==========================================================================
% Hela L (set 5)
dataIn.experimentShortName = 'Pooled pLVP042';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Experiment_3_Pooled_SmchD1/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 6)
dataIn.experimentShortName = 'Pooled pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Experiment_3_Pooled_SmchD1/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 18-06-2014 SmchD1 data
%==========================================================================
% Hela L (set 7)
dataIn.experimentShortName = '18-06-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/18_06_2014_Hela_SL_KD_SmchD1_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 8)
dataIn.experimentShortName = '18-06-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/18_06_2014_Hela_SL_KD_SmchD1_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L(set 9)
dataIn.experimentShortName = '18-06-2014 pLVP041';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/18_06_2014_Hela_SL_KD_SmchD1_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 10)
dataIn.experimentShortName = '18-06-2014 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/18_06_2014_Hela_SL_KD_SmchD1_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 11)
dataIn.experimentShortName = '18-06-2014 pLVP042';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/18_06_2014_Hela_SL_KD_SmchD1_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 12)
dataIn.experimentShortName = '18-06-2014 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/18_06_2014_Hela_SL_KD_SmchD1_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 19-06-2014 SmchD1 data
%==========================================================================
% Hela L (set 13)
dataIn.experimentShortName = '19-06-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/19_06_2014_HelaS_L_KD_SmchD1/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 14)
dataIn.experimentShortName = '19-06-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/19_06_2014_HelaS_L_KD_SmchD1/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 15)
dataIn.experimentShortName = '19-06-2014 pLVP041';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/19_06_2014_HelaS_L_KD_SmchD1/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 16)
dataIn.experimentShortName = '19-06-2014 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/19_06_2014_HelaS_L_KD_SmchD1/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 17)
dataIn.experimentShortName = '19-06-2014 pLVP042';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/19_06_2014_HelaS_L_KD_SmchD1/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 18)
dataIn.experimentShortName = '19-06-2014 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/19_06_2014_HelaS_L_KD_SmchD1/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 30-06-2014 SmchD1 data
%==========================================================================
% Hela L (set 19)
dataIn.experimentShortName = '30-06-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_06_2014_HeLaS and L_SMCHD1_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 20)
dataIn.experimentShortName = '30-06-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_06_2014_HeLaS and L_SMCHD1_KD/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 21)
dataIn.experimentShortName = '30-06-2014 pLVP041';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_06_2014_HeLaS and L_SMCHD1_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 22)
dataIn.experimentShortName = '30-06-2014 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_06_2014_HeLaS and L_SMCHD1_KD/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 23)
dataIn.experimentShortName = '30-06-2014 pLVP042';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_06_2014_HeLaS and L_SMCHD1_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 24)
dataIn.experimentShortName = '30-06-2014 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_06_2014_HeLaS and L_SMCHD1_KD/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 02-07-2014 SmchD1 data
%==========================================================================
% Hela L (set 25)
dataIn.experimentShortName = '02-07-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/02_07_2014_HeLa L and S_KD_SMCHD1_FISH_Slide2/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 26)
dataIn.experimentShortName = '02-07-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/02_07_2014_HeLa L and S_KD_SMCHD1_FISH_Slide2/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 27)
dataIn.experimentShortName = '02-07-2014 pLVP041';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/02_07_2014_HeLa L and S_KD_SMCHD1_FISH_Slide2/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (no dataset for this one)

% Hela L (set 28)
dataIn.experimentShortName = '02-07-2014 pLVP042';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/02_07_2014_HeLa L and S_KD_SMCHD1_FISH_Slide2/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (no dataset for this one)

%==========================================================================
% 29-07-2014 SmchD1 data
%==========================================================================
% Hela L (set 29)
dataIn.experimentShortName = '29-07-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/29_07_2014_HelaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 30)
dataIn.experimentShortName = '29-07-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/29_07_2014_HelaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 31)
dataIn.experimentShortName = '29-07-2014 pLVP041';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/29_07_2014_HelaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 32)
dataIn.experimentShortName = '29-07-2014 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/29_07_2014_HelaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 33)
dataIn.experimentShortName = '29-07-2014 pLVP042';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/29_07_2014_HelaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 34)
dataIn.experimentShortName = '29-07-2014 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/29_07_2014_HelaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 30-07-2014 SmchD1 data
%==========================================================================
% Hela L (set 35)
dataIn.experimentShortName = '30-07-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 36)
dataIn.experimentShortName = '30-07-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 37)
dataIn.experimentShortName = '30-07-2014 pLVP041';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 38)
dataIn.experimentShortName = '30-07-2014 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 39)
dataIn.experimentShortName = '30-07-2014 pLVP042';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 40)
dataIn.experimentShortName = '30-07-2014 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/30_07_2014_HeLaS_L_SmchD1_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 11-08-2014 SmchD1 data
%==========================================================================
% Hela L (set 41)
dataIn.experimentShortName = '11-08-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 42)
dataIn.experimentShortName = '11-08-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 43)
dataIn.experimentShortName = '11-08-2014 pLVP041';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 44)
dataIn.experimentShortName = '11-08-2014 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 45)
dataIn.experimentShortName = '11-08-2014 pLVP042';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 46)
dataIn.experimentShortName = '11-08-2014 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/11_08_2014_HelaS_L_SmchD1_TRf2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 13-08-2014 SmchD1 data
%==========================================================================
% Hela L (set 47)
dataIn.experimentShortName = '13-08-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 48)
dataIn.experimentShortName = '13-08-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 49)
dataIn.experimentShortName = '13-08-2014 pLVP041';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 50)
dataIn.experimentShortName = '13-08-2014 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 51)
dataIn.experimentShortName = '13-08-2014 pLVP042';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 52)
dataIn.experimentShortName = '13-08-2014 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/13_08_2014_HelaS_L_SmchD1_Trf2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

end