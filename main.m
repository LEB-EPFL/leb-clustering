% Main script for running analyses on telomeres.
%
% This script should be run after the analysis workflow is determined from
% data_mining.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/07/31 $ $REVISION: 0.1 $
%
%% Designate the files for analysis.
dataRootDir = '/mnt/LEBSRV/Michael-Kyle-Douglass/Verena/11_06_2014_FISH_HelaS_L/11_06_2014_FISH_Hela_S_L/';
dataSetLDir = '11_06_2014_Hela_L_FISH/Hela L FISH molecule lists/';
dataSetSDir = '11_06_2014_Hela_S_FISH/Hela S FISH molecule lists/';

LFiles = dir([dataRootDir dataSetLDir]);
SFiles = dir([dataRootDir dataSetSDir]);
%% Filter out anomalously long file name and upper level directors.
LFiles = LFiles(3:end-1);
SFiles = SFiles(3:end-1);

%% Process the data within each file.
LProcData(length(LFiles),1).M1 = 0;
LProcData(length(LFiles),1).M2 = 0;
LProcData(length(LFiles),1).M2Mag = 0;
LProcData(length(LFiles),1).numLoc = 0;
LProcData(length(LFiles),1).volume = 0;
LProcData(length(LFiles),1).fileName = 0;
LProcData(length(LFiles),1).shortName = 0;
SProcData = LProcData;

% Note: This part could be parallelized.
%for ctr = 1:length(LFiles)
for ctr = 1:1
    LFileName = [dataRootDir dataSetLDir LFiles(ctr).name];
    SFileName = [dataRootDir dataSetSDir SFiles(ctr).name];
    
    LProcData(ctr) = process_data(LFileName);
    SProcData(ctr) = process_data(SFileName);
    
    LProcData(ctr).shortName = LFiles(ctr).name;
    SProcData(ctr).shortName = SFiles(ctr).name;
end