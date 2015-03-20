% Save the processed distributions from all experiments.
%
% This function requires a .mat file containing the relevant data loaded
% into the workspace.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2015/03/20 $ $REVISION: 0.1 $

function saveDistFiles()
existCode = 7;

%% Load and save data from original wild type experiments
%==========================================================================
% Experiment 0: Wild type distributions
%==========================================================================
dataDirExp0 = 'analyses/Experiment_0_Hela_LS/';
assert(exist(dataDirExp0, 'dir') == existCode)

load([dataDirExp0 'matlab.mat'], 'data');
disp('Data from Experiment 0: Wild type Hela loaded into memory.')

% Save radius of gyration distributions for Hela L and Hela S.
disp('Writing radius of gyration data to text files...')
saveDistr(data, 'Original Data', 'L dataset', 'RgTrans')
saveDistr(data, 'Original Data', 'S dataset', 'RgTrans')

clear data

%% Load and save data from immunofluorescence experiments
%==========================================================================
% Experiment 1: TRF1 immunofluorescence
%==========================================================================
dataDirExp1 = 'analyses/Experiment_1_IF/';
assert(exist(dataDirExp0, 'dir') == existCode)

load([dataDirExp1 'matlab.mat'], 'data');
disp('Data from Experiment 1: TRF1 IF loaded into memory.')

% Save radius of gyration distributions for Hela L and Hela S.
disp('Writing radius of gyration data to text files...')
saveDistr(data, 'WT',        'L dataset', 'RgTrans')
saveDistr(data, 'TRF1 1000', 'L dataset', 'RgTrans')
saveDistr(data, 'TRF1 2000', 'L dataset', 'RgTrans')

clear data

%% Load and save data from TRF1, TRF2, and TRF1/2 knockdown experiments
%==========================================================================
% Experiment 6: TRF1, TRF2, TRF1/2 knockdowns
%==========================================================================
dataDirExp6 = 'analyses/Experiment_6_Pool_TRF1_TRF2/';
assert(exist(dataDirExp6, 'dir') == existCode)

load([dataDirExp6 'matlab.mat'], 'data');
disp('Data from Experiment 6: TRF1, TRF2, TRF1/2 KDs loaded into memory.')

% Save radius of gyration distributions for Hela L and Hela S.
disp('Writing radius of gyration data to text files...')
saveDistr(data, 'Pooled pSuper',   'L dataset', 'RgTrans')
saveDistr(data, 'Pooled pSuper',   'S dataset', 'RgTrans')
saveDistr(data, 'Pooled TRF1',     'L dataset', 'RgTrans')
saveDistr(data, 'Pooled TRF1',     'S dataset', 'RgTrans')
saveDistr(data, 'Pooled TRF2',     'L dataset', 'RgTrans')
saveDistr(data, 'Pooled TRF2',     'S dataset', 'RgTrans')
saveDistr(data, 'Pooled TRF1 TRF2',   'L dataset', 'RgTrans')
saveDistr(data, 'Pooled TRF1 TRF2',   'S dataset', 'RgTrans')

clear data

end