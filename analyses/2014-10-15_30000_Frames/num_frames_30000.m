% Data structure for new TRF2 KD experiments and analyses.

function [data] = num_frames_30000()

%==========================================================================
% 11-06-2014 Original data compared to 29-08-2014 TRF1 IF
%==========================================================================
% Hela L (set 1)
dataIn.experimentShortName = '08-20-2014 pSuper';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/20_08_2014_HelaS_L_TRF2_KD_30000_frames/';
dataIn.datasetDir = 'HelaL/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = dataIn; % NOTE: This line is only different for this dataset.

% Hela S (set 2)
dataIn.experimentShortName = '08-20-2014 pSuper';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/20_08_2014_HelaS_L_TRF2_KD_30000_frames/';
dataIn.datasetDir = 'HelaS/pSuper/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela L (set 3)
dataIn.experimentShortName = '08-20-2014 TRF2';
dataIn.datasetShortName = 'L dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/20_08_2014_HelaS_L_TRF2_KD_30000_frames/';
dataIn.datasetDir = 'HelaL/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

% Hela S (set 4)
dataIn.experimentShortName = '08-20-2014 TRF2';
dataIn.datasetShortName = 'S dataset';
dataIn.rootDir = '/media/My Book/Kyle/Telomere_Data/20_08_2014_HelaS_L_TRF2_KD_30000_frames/';
dataIn.datasetDir = 'HelaS/TRF2/';
dataIn.distributions = [];
dataIn.fits = [];
data = [data, dataIn]; % Appends this dataset to the data array.

end