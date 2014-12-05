% Data structure for new TRF1 and TRF2 double KD experiments and analyses.

function [data] = pool_data_TRF1_TRF2()

%==========================================================================
% Pooled pSuper's from TRF1/TRF2 KD experiments.
%==========================================================================
% Hela L (set 1)
dataIn.experimentShortName = 'Pooled pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1_TRF2/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

% Hela S (set 2)
dataIn.experimentShortName = 'Pooled pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1_TRF2/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% Pooled TRF1 KD data
%==========================================================================
% Hela L (set 3)
dataIn.experimentShortName = 'Pooled TRF1';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1_TRF2/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 4)
dataIn.experimentShortName = 'Pooled TRF1';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1_TRF2/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% TRF2 KD from pooled data
%==========================================================================
% Hela L (set 5)
dataIn.experimentShortName = 'Pooled TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1_TRF2/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 6)
dataIn.experimentShortName = 'Pooled TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1_TRF2/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% Pooled TRF1 and TRF2 double knockdowns
%==========================================================================
% Hela L (set 3)
dataIn.experimentShortName = 'Pooled TRF1 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1_TRF2/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 4)
dataIn.experimentShortName = 'Pooled TRF1 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/Pooled_TRF1_TRF2/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 08-09-2014 TRF1 and TRF2 double knockdowns
%==========================================================================
% Hela L (set 9)
dataIn.experimentShortName = '08-09-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 10)
dataIn.experimentShortName = '08-09-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 11)
dataIn.experimentShortName = '08-09-2014 TRF1';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 12)
dataIn.experimentShortName = '08-09-2014 TRF1';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 13)
dataIn.experimentShortName = '08-09-2014 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 14)
dataIn.experimentShortName = '08-09-2014 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 15)
dataIn.experimentShortName = '08-09-2014 TRF1 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 16)
dataIn.experimentShortName = '08-09-2014 TRF1 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/08_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 09-09-2014 TRF1 and TRF2 double knockdowns
%==========================================================================
% Hela L (set 17)
dataIn.experimentShortName = '09-09-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 18)
dataIn.experimentShortName = '09-09-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 19)
dataIn.experimentShortName = '09-09-2014 TRF1';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 20)
dataIn.experimentShortName = '09-09-2014 TRF1';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 21)
dataIn.experimentShortName = '09-09-2014 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 22)
dataIn.experimentShortName = '09-09-2014 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 23)
dataIn.experimentShortName = '09-09-2014 TRF1 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 24)
dataIn.experimentShortName = '09-09-2014 TRF1 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/09_09_2014_HelaS_L_Trf1_Trf2_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 21-10-2014 TRF1 and TRF2 data
%==========================================================================

% Hela L (set 25)
dataIn.experimentShortName = '21-10-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/21_10_2014_HelaS_L_TRF1_TRF2_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 26)
dataIn.experimentShortName = '21-10-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/21_10_2014_HelaS_L_TRF1_TRF2_KD/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 27)
dataIn.experimentShortName = '21-10-2014 TRF1';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/21_10_2014_HelaS_L_TRF1_TRF2_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 28)
dataIn.experimentShortName = '21-10-2014 TRF1';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/21_10_2014_HelaS_L_TRF1_TRF2_KD/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 29)
dataIn.experimentShortName = '21-10-2014 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/21_10_2014_HelaS_L_TRF1_TRF2_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 30)
dataIn.experimentShortName = '21-10-2014 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/21_10_2014_HelaS_L_TRF1_TRF2_KD/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 31)
dataIn.experimentShortName = '21-10-2014 TRF1 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/21_10_2014_HelaS_L_TRF1_TRF2_KD/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 32)
dataIn.experimentShortName = '21-10-2014 TRF1 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/21_10_2014_HelaS_L_TRF1_TRF2_KD/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 05-11-2014 TRF1 and TRF2 data
%==========================================================================
% Hela L (set 33)
dataIn.experimentShortName = '05-11-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 34)
dataIn.experimentShortName = '05-11-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 35)
dataIn.experimentShortName = '05-11-2014 TRF1';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 36)
dataIn.experimentShortName = '05-11-2014 TRF1';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 37)
dataIn.experimentShortName = '05-11-2014 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 38)
dataIn.experimentShortName = '05-11-2014 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 39)
dataIn.experimentShortName = '05-11-2014 TRF1 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'HelaL/Molecule_Lists/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 40)
dataIn.experimentShortName = '05-11-2014 TRF1 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/05_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'HelaS/Molecule_Lists/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

%==========================================================================
% 17-11-2014 TRF1 and TRF2 data
%==========================================================================

% Hela L (set 41)
dataIn.experimentShortName = '17-11-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela L/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 42)
dataIn.experimentShortName = '17-11-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela S/Molecule_Lists/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 43)
dataIn.experimentShortName = '17-11-2014 TRF1';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela L/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 44)
dataIn.experimentShortName = '17-11-2014 TRF1';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela S/Molecule_Lists/TRF1/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 45)
dataIn.experimentShortName = '17-11-2014 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela L/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 46)
dataIn.experimentShortName = '17-11-2014 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela S/Molecule_Lists/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 47)
dataIn.experimentShortName = '17-11-2014 TRF1 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela L/Molecule_Lists/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 48)
dataIn.experimentShortName = '17-11-2014 TRF1 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/';
dataIn.datasetDir = 'Hela S/Molecule_Lists/TRF1_TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.
end