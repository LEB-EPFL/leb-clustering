% Publish all data_visualization scripts for the different experiments.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2015/03/23 $ $REVISION: 0.1 $

function data_visualization_main()
existCode = 7;

% Don't publish code; only output and figures.
options_doc_nocode.showCode = false;
%% Load and save data from original wild type experiments
%==========================================================================
% Experiment 0: Wild type distributions
%==========================================================================
dataDirExp0 = 'analyses/Experiment_0_Hela_LS/';
assert(exist(dataDirExp0, 'dir') == existCode)
cd(dataDirExp0)

disp(['Publishing figures for folder ' dataDirExp0])
publish('data_visualization.m', options_doc_nocode);

cd ../..
clear data
close all

%% Load and save data from immunofluorescence experiments
%==========================================================================
% Experiment 1: TRF1 immunofluorescence
%==========================================================================
dataDirExp1 = 'analyses/Experiment_1_IF/';
assert(exist(dataDirExp1, 'dir') == existCode)
cd(dataDirExp1)

disp(['Publishing figures for folder ' dataDirExp1])
publish('data_visualization.m', options_doc_nocode);

cd ../..
clear data
close all

%% Load and save data from immunofluorescence experiments
%==========================================================================
% Experiment 2: Method development
%==========================================================================
dataDirExp2 = 'analyses/Experiment_2_Method/';
assert(exist(dataDirExp2, 'dir') == existCode)
cd(dataDirExp2)

disp(['Publishing figures for folder ' dataDirExp2])
publish('data_visualization.m', options_doc_nocode);

cd ../..
clear data
close all

%% Load and save data from immunofluorescence experiments
%==========================================================================
% Experiment 4: Pool TRF2 knockdown data
%==========================================================================
dataDirExp4 = 'analyses/Experiment_4_Pool_TRF2/';
assert(exist(dataDirExp4, 'dir') == existCode)
cd(dataDirExp4)

disp(['Publishing figures for folder ' dataDirExp4])
publish('data_visualization.m', options_doc_nocode);

cd ../..
clear data
close all

%% Load and save data from immunofluorescence experiments
%==========================================================================
% Experiment 5: Pool SmchD1 and TRF2 knockdown data
%==========================================================================
dataDirExp5 = 'analyses/Experiment_5_Pool_SmchD1_TRF2/';
assert(exist(dataDirExp5, 'dir') == existCode)
cd(dataDirExp5)

disp(['Publishing figures for folder ' dataDirExp5])
publish('data_visualization.m', options_doc_nocode);

cd ../..
clear data
close all

%% Load and save data from TRF1, TRF2, and TRF1/2 knockdown experiments
%==========================================================================
% Experiment 6: TRF1, TRF2, TRF1/2 knockdowns
%==========================================================================
dataDirExp6 = 'analyses/Experiment_6_Pool_TRF1_TRF2/';
assert(exist(dataDirExp6, 'dir') == existCode)
cd(dataDirExp6)

disp(['Publishing figures for folder ' dataDirExp6])
publish('data_visualization.m', options_doc_nocode);

cd ../..
clear data
close all

end