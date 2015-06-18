expName   = 'TRF1_2000';
date      = '29_08_2014_';

myDir = '/media/My Book/Kyle/Telomere_Data/29_08_2014_Hela_L_TRF1_IF/HelaL/';

% Rename molecule_lists
listDir = ['Molecule_Lists/' expName '/'];
extension = '.txt';
renameFiles([myDir listDir], [date expName '_FOV'], extension)

% Rename images
imgDir  = [expName '/'];
extension = '.jp2';
renameFiles([myDir imgDir],  [date expName '_FOV'], extension)