expName   = 'wild_type';
date      = '11_06_2014_';

myDir = '/media/My Book/Kyle/Telomere_Data/11_06_2014_FISH_HelaS_L/HelaS/';

% Rename molecule_lists
listDir = ['Molecule_Lists/' expName '/'];
extension = '.txt';
renameFiles([myDir listDir], [date expName '_FOV'], extension)

% Rename images
imgDir  = [expName '/'];
extension = '.jp2';
renameFiles([myDir imgDir],  [date expName '_FOV'], extension)