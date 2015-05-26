expName   = 'TRF1_TRF2';
date      = '17_11_2014_';

myDir = '/media/My Book/Kyle/Telomere_Data/17_11_2014_HeLaS_L_TRF1_TRF2_KD_FISH/HelaS/';

% Rename molecule_lists
listDir = ['Molecule_Lists/' expName '/'];
extension = '.txt';
renameFiles([myDir listDir], [date expName '_FOV'], extension)

% Rename images
imgDir  = [expName '/'];
extension = '.jp2';
renameFiles([myDir imgDir],  [date expName '_FOV'], extension)