function [dataOut] = fit_scaling_law(dataIn, fitAll)
% Perform curve fitting to the preliminary clustering data structure.
%
% [dataOut] = fit_scaling_law(dataIn) takes the preliminary clustering
% data, i.e. Rg, number of localizations, etc. for every telomere and
% performs a powerlaw fit to the data. The output is a data structure
% containing all the fit information.
%
% Inputs
%   dataIn : User-defined structure
%     Structure containing the cluster information such as Rg
%   fitAll : true or false
%     Should all fits be performed, or only the robust fit?
%     
% Outputs
%   dataOut : User-defined structure
%     Data structure containing fit information used for clustering
%     analyses
%
%   % $AUTHOR: Kyle M. Douglass $ $DATE: 2014/10/24 $ $REVISION: 0.1 $

%% Perform a nonlinear least squares regression on Rg vs. number of localizations
% For a good discussion on fitting in Matlab, particularly robust fitting,
% see:
% <http://www.mathworks.ch/ch/help/curvefit/least-squares-fitting.html>

% For analytical expressions of the coefficients from nonlinear least
% squares fitting to a power law, see:
% <http://mathworld.wolfram.com/LeastSquaresFittingPowerLaw.html>

f = fittype('a*x.^b');
x1 = dataIn.numLoc;
y1 = dataIn.Rg;

% Robust fit to all data points (points are weighted by distance from
% curve.) Note that starting values were manually estimated.
[fitRobust, gofRobust, fitInfoRobust] = fit(x1,y1,f,'StartPoint',[17 0.33],'Robust','on');

% Store fits in the external data array.
dataOut.fits.fitRobust = fitRobust;
dataOut.fits.gofRobust = gofRobust;
dataOut.fits.fitInfoRobust = fitInfoRobust;

if fitAll
    % Nonlinear least squares fit to all data points.
    [fitNormal,gofNormal,fitInfoNormal] = fit(x1,y1,f,'StartPoint',[17 0.33]);

    % Nonlinear least squares fit to data points without outliers. Outliers
    % lie more than 1.5 standard deviations from the first fit curve.
    residuals = fitInfoNormal.residuals;
    I = abs(residuals) > 1.5 * std(residuals);
    outliers = excludedata(x1,y1,'indices',I);
    [fitNoOutliers, gofNoOutliers, fitInfoNoOutliers] = fit(x1,y1,f,'StartPoint', [17 0.33], 'Exclude',outliers); 
    
    % Store fits in the external data array.
    dataOut.fits.fitNormal = fitNormal;
    dataOut.fits.gofNormal = gofNormal;
    dataOut.fits.fitInfoNormal = fitInfoNormal;

    dataOut.fits.fitNoOutliers = fitNoOutliers;
    dataOut.fits.gofNoOutliers = gofNoOutliers;
    dataOut.fits.fitInfoNoOutliers = fitInfoNoOutliers;
end

%% Perform fits to the transverse second moments

clear x1 y1 residuals I outliers
x1 = dataIn.numLoc;
yTrans = dataIn.RgTrans;

% Robust fit to all data points (points are weighted by distance from
% curve.) Note that starting values were manually estimated.
[fitRgTransRobust, gofRgTransRobust, fitRgTransInfoRobust] = fit(x1,yTrans,f,'StartPoint',[17 0.33],'Robust','on');

% Store fits in the external data array.
dataOut.fits.fitRgTransRobust = fitRgTransRobust;
dataOut.fits.gofRgTransRobust = gofRgTransRobust;
dataOut.fits.fitRgTransInfoRobust = fitRgTransInfoRobust;

if fitAll
    % Nonlinear least squares fit to all data points.
    [fitRgTransNormal,gofRgTransNormal,fitRgTransInfoNormal] = fit(x1,yTrans,f,'StartPoint',[17 0.33]);

    % Nonlinear least squares fit to data points without outliers.
    % Outliers lie more than 1.5 standard deviations from the first fit curve.
    residuals = fitRgTransInfoNormal.residuals;
    I = abs(residuals) > 1.5 * std(residuals);
    outliers = excludedata(x1,yTrans,'indices',I);
    [fitRgTransNoOutliers, gofRgTransNoOutliers, fitRgTransInfoNoOutliers] = fit(x1,yTrans,f,'StartPoint', [17 0.33], 'Exclude',outliers);

    % Store fits in the external data array.
    dataOut.fits.fitRgTransNormal = fitRgTransNormal;
    dataOut.fits.gofRgTransNormal = gofRgTransNormal;
    dataOut.fits.fitRgTransInfoNormal = fitRgTransInfoNormal;

    dataOut.fits.fitRgTransNoOutliers = fitRgTransNoOutliers;
    dataOut.fits.gofRgTransNoOutliers = gofRgTransNoOutliers;
    dataOut.fits.fitRgTransInfoNoOutliers = fitRgTransInfoNoOutliers;
end

end