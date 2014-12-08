% Data structure for SmchD1 / TRF2 KD experiments and analyses.

function [data] = pool_data_SmchD1_TRF2()

%==========================================================================
% Pooled data for SMCHD1 / TRF2 double KD
%==========================================================================
% Hela S (set 1)
dataIn.experimentShortName = 'Pooled pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1_TRF2/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

% Hela S (set 2)
dataIn.experimentShortName = 'Pooled TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1_TRF2/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 3)
dataIn.experimentShortName = 'Pooled pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1_TRF2/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 4)
dataIn.experimentShortName = 'Pooled pLVP041 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1_TRF2/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 5)
dataIn.experimentShortName = 'Pooled pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1_TRF2/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 6)
dataIn.experimentShortName = 'Pooled pLVP042 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_SmchD1_TRF2/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 06-11-2014 SmchD1 / TRF2 KD experiments
%==========================================================================
% Hela S (set 7)
dataIn.experimentShortName = '06-11-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/06_11_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 8)
dataIn.experimentShortName = '06-11-2014 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/06_11_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% pLVP041 and pLVP041 + TRF2 KD
%==========================================================================

% Hela S (set 9)
dataIn.experimentShortName = '06-11-2014 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/06_11_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 10)
dataIn.experimentShortName = '06-11-2014 pLVP041 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/06_11_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% pLVP042 and pLVP042 + TRF2 KD
%==========================================================================

% Hela S (set 11)
dataIn.experimentShortName = '06-11-2014 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/06_11_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 12)
dataIn.experimentShortName = '06-11-2014 pLVP042 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/06_11_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 24-08-2014 SmchD1 / TRF2 KD experiments
%==========================================================================
% Hela S (set 13)
dataIn.experimentShortName = '24-08-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/24_08_2014_HeLaS_SmchD1_TRF2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 14)
dataIn.experimentShortName = '24-08-2014 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/24_08_2014_HeLaS_SmchD1_TRF2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% pLVP041 and pLVP041 + TRF2 KD
%==========================================================================

% Hela S (set 15)
dataIn.experimentShortName = '24-08-2014 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/24_08_2014_HeLaS_SmchD1_TRF2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 16)
dataIn.experimentShortName = '24-08-2014 pLVP041 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/24_08_2014_HeLaS_SmchD1_TRF2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% pLVP042 and pLVP042 + TRF2 KD
%==========================================================================

% Hela S (set 17)
dataIn.experimentShortName = '24-08-2014 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/24_08_2014_HeLaS_SmchD1_TRF2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 18)
dataIn.experimentShortName = '24-08-2014 pLVP042 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/24_08_2014_HeLaS_SmchD1_TRF2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 27-08-2014 SmchD1 / TRF2 KD experiments
%==========================================================================
% Hela S (set 19)
dataIn.experimentShortName = '27-08-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/27_08_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 20)
dataIn.experimentShortName = '27-08-2014 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/27_08_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% pLVP041 and pLVP041 + TRF2 KD
%==========================================================================

% Hela S (set 21)
dataIn.experimentShortName = '27-08-2014 pLVP041';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/27_08_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 22 )
dataIn.experimentShortName = '27-08-2014 pLVP041 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/27_08_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP041_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% pLVP042 and pLVP042 + TRF2 KD
%==========================================================================

% Hela S (set 23)
dataIn.experimentShortName = '27-08-2014 pLVP042';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/27_08_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 24)
dataIn.experimentShortName = '27-08-2014 pLVP042 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/27_08_2014_HelaS_SmchD1_Trf2_doubleKD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pLVP042_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

end