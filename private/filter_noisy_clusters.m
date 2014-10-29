function [dataOut] = filter_noisy_clusters(dataIn, dataModel, threshold)
% Filter noisy clusters by correlation with size to number scaling
%
% [dataOut] = filter_noisy_clusters(dataIn) filters a preliminary
% clustering data structure by removing points that do not correlate to the
% given model.

% More precisely, points are removed if they lie further than a multiple of
% standard deviations from an initial nonlinear least-squares of the input
% model to the data.
%
% Inputs
%   dataIn : User-defined structure
%     Structure containing the cluster information such as Rg
%   dataModel : Matlab 'fittype' data structure
%     The model for fitting the data to
%   threshold : double
%     Single value defining how many standard deviations away from the
%     best-fit to the model a point may lie without being discarded
%     
% Outputs
%   dataOut : User-defined structure
%     Data structure containing filtered data points
%
%   % $AUTHOR: Kyle M. Douglass $ $DATE: 2014/10/24 $ $REVISION: 0.1 $

%% Perform a non-linear least squares fit to the data
x1 = dataIn.numLoc;
y1 = dataIn.RgTrans; % The transverse Rg is more precise than the 3D Rg

% Starting values have been manually estimated from data visualization
[~,~,fitInfo] = fit(x1,y1,dataModel,'StartPoint',[17 0.33],'Robust','on');

% Outliers lie more than 'threshold' standard deviations from the first fit
% curve.
residuals = fitInfo.residuals;
I = abs(residuals) < threshold * std(residuals);
filter = excludedata(x1,y1,'indices',I);

% Filter all fields in the data structure
fName = fieldnames(dataIn);
for ctr = 1:length(fName)
    dataOut.(fName{ctr}) = dataIn.(fName{ctr})(filter);
end

numRejectedClusters = length(x1) - sum(filter);
disp(['The number of prefiltered clusters is: ' num2str(length(x1))])
disp(['The number of rejected clusters is: ' num2str(numRejectedClusters)])
end