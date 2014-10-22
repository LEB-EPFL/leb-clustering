% The main script for analyzing the telomere data and producing reports.
%
% This script should be run after the analysis workflow is determined from
% data_mining.m.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/10/13 $ $REVISION: 1.1 $
%
%% Use parallel processing to speed up computation? (use 'false' if unsure)
useParallel = true;

% if useParallel
%     matlabpool open
% end

%% Define clustering and filtering parameters.
% k - number of objects in a neighborhood of an object 
% (minimal number of objects considered as a cluster)
% Eps - neighborhood radius, if not known avoid this parameter or put []
% minLoc - Discard all clusters with localizations fewer than this number.
% maxLoc - Discard all clusters with localizations greater than this
%          number. (Set to Inf if there you don't want an upper cutoff.)
k = 8;
Eps = 65;

minLoc = 0;
maxLoc = 1000;
%% Setup the data structure and designate files for analysis.
% Read in a separate file that setups up the data structures with
% descriptive names and root directories for each dataset.

data = pool_data_TRF1_TRF2();

%% Verify that all directories are correct.
for dirCtr = 1:length(data)
    completeDir = [data(dirCtr).rootDir data(dirCtr).datasetDir];
    
    A = exist(completeDir, 'dir');
    
    if A == 0
        error(['Error: directory ' completeDir ' does not exist.'])
    end
end
clear dirCtr

%% Primary processing loop.

for dataCtr = 1:length(data)
% Loops over all the data files defined above.
disp(['Processing experiment ' data(dataCtr).experimentShortName ' / ' data(dataCtr).datasetShortName])

completeDir = [data(dataCtr).rootDir data(dataCtr).datasetDir];

files = dir(completeDir);

%% Filter out upper level directors.
files = files(3:end);

%% Process the data within each file.
clear procData
procData(length(files),1).M1 = 0;
procData(length(files),1).M2 = 0;
procData(length(files),1).RgTrans = 0;
procData(length(files),1).Rg = 0;
procData(length(files),1).numLoc = 0;
procData(length(files),1).volume = 0;

% process_data(fileName) is custom function call.
if useParallel
    parfor ctr = 1:length(files)
        fileName = [completeDir files(ctr).name];
        currData = tdfread(fileName);
        currDataF = [currData.Xc currData.Yc currData.Zc];
        procData(ctr) = process_data(currDataF, k, Eps, minLoc, maxLoc);
    end
else
    for ctr = 1:length(files)
        fileName = [completeDir files(ctr).name];
        currData = tdfread(fileName);
        currDataF = [currData.Xc currData.Yc currData.Zc];
        procData(ctr) = process_data(currDataF, k, Eps, minLoc, maxLoc);
    end
end

%% Combine distrubtions from all elements of the data structures.
allData = struct('M1', [], 'M2', [], 'RgTrans', [], 'Rg', [], 'numLoc', [], 'volume', []);

for ctr = 1:length(files)
    allData.M1 = cat(1, allData.M1, procData(ctr).M1);
    allData.M2 = cat(1, allData.M2, procData(ctr).M2);
    allData.RgTrans = cat(1, allData.RgTrans, procData(ctr).RgTrans);
    allData.Rg = cat(1, allData.Rg, procData(ctr).Rg);
    allData.numLoc = cat(1, allData.numLoc, procData(ctr).numLoc);
    allData.volume = cat(1, allData.volume, procData(ctr).volume);
end

% Write distributions out to the large data structure for the experiment.
data(dataCtr).distributions = allData;

%% Perform a nonlinear least squares regression on Rg vs. number of localizations
% For a good discussion on fitting in Matlab, particularly robust fitting,
% see:
% <http://www.mathworks.ch/ch/help/curvefit/least-squares-fitting.html>

% For analytical expressions of the coefficients from nonlinear least
% squares fitting to a power law, see:
% <http://mathworld.wolfram.com/LeastSquaresFittingPowerLaw.html>

f = fittype('a*x.^b');
x1 = allData.numLoc;
y1 = allData.Rg;

% Nonlinear least squares fit to all data points.
[fitNormal,gofNormal,fitInfoNormal] = fit(x1,y1,f,'StartPoint',[17 0.33]);

% Nonlinear least squares fit to data points without outliers.
% Outliers lie more than 1.5 standard deviations from the first fit curve.
residuals = fitInfoNormal.residuals;
I = abs(residuals) > 1.5 * std(residuals);
outliers = excludedata(x1,y1,'indices',I);
[fitNoOutliers, gofNoOutliers, fitInfoNoOutliers] = fit(x1,y1,f,'StartPoint', [17 0.33], 'Exclude',outliers);

% Robust fit to all data points (points are weighted by distance from
% curve.)
[fitRobust, gofRobust, fitInfoRobust] = fit(x1,y1,f,'StartPoint',[17 0.33],'Robust','on');

% Store fits in the external data array.
data(dataCtr).fits.fitNormal = fitNormal;
data(dataCtr).fits.gofNormal = gofNormal;
data(dataCtr).fits.fitInfoNormal = fitInfoNormal;

data(dataCtr).fits.fitNoOutliers = fitNoOutliers;
data(dataCtr).fits.gofNoOutliers = gofNoOutliers;
data(dataCtr).fits.fitInfoNoOutliers = fitInfoNoOutliers;

data(dataCtr).fits.fitRobust = fitRobust;
data(dataCtr).fits.gofRobust = gofRobust;
data(dataCtr).fits.fitInfoRobust = fitInfoRobust;

%% Perform fits to the transverse second moments

clear x1 y1 residuals I outliers
x1 = allData.numLoc;
yTrans = allData.RgTrans;
%yAx = sqrt(allData.M2(:,3));  For later updates.

% Nonlinear least squares fit to all data points.
[fitRgTransNormal,gofRgTransNormal,fitRgTransInfoNormal] = fit(x1,yTrans,f,'StartPoint',[17 0.33]);

% Nonlinear least squares fit to data points without outliers.
% Outliers lie more than 1.5 standard deviations from the first fit curve.
residuals = fitRgTransInfoNormal.residuals;
I = abs(residuals) > 1.5 * std(residuals);
outliers = excludedata(x1,yTrans,'indices',I);
[fitRgTransNoOutliers, gofRgTransNoOutliers, fitRgTransInfoNoOutliers] = fit(x1,yTrans,f,'StartPoint', [17 0.33], 'Exclude',outliers);

% Robust fit to all data points (points are weighted by distance from
% curve.)
[fitRgTransRobust, gofRgTransRobust, fitRgTransInfoRobust] = fit(x1,yTrans,f,'StartPoint',[17 0.33],'Robust','on');

% Store fits in the external data array.
data(dataCtr).fits.fitRgTransNormal = fitRgTransNormal;
data(dataCtr).fits.gofRgTransNormal = gofRgTransNormal;
data(dataCtr).fits.fitRgTransInfoNormal = fitRgTransInfoNormal;

data(dataCtr).fits.fitRgTransNoOutliers = fitRgTransNoOutliers;
data(dataCtr).fits.gofRgTransNoOutliers = gofRgTransNoOutliers;
data(dataCtr).fits.fitRgTransInfoNoOutliers = fitRgTransInfoNoOutliers;

data(dataCtr).fits.fitRgTransRobust = fitRgTransRobust;
data(dataCtr).fits.gofRgTransRobust = gofRgTransRobust;
data(dataCtr).fits.fitRgTransInfoRobust = fitRgTransInfoRobust;


end % Ends loop over datasets.

%% Saves the workspace automatically.

