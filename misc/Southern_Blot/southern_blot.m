%% Compute number distributions from Southern blots
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/10/22 $ $REVISION: 0.2 $

function southern_blot()
%% Read in line profiles of Southern blots
hL = dlmread('helaL.txt');
hS = dlmread('helaS.txt');
scale = dlmread('scale.txt');

%% Convert scales
% Find locations of tick marks in the scale profile
filterLevel = 90;
scaleTicks = scale(scale(:,2) < filterLevel, 1);

% Number of kilobase pairs correspoinding to the ticks
NTicks = [8, 10, 17, 29.9, 38.5, 48.5]';

% Check for logarithmic scale and fit a line
p = polyfit(scaleTicks, log10(NTicks),1);
yfit = polyval(p, scaleTicks);
yresid = log10(NTicks) - yfit;
SSresid = sum(yresid.^2);
SStotal = (length(NTicks) - 1) * var(log10(NTicks));
rsq = 1 - SSresid/SStotal;

close all
plot(scaleTicks, log10(NTicks), '-*', 'MarkerSize', 8)
hold on
plot(scaleTicks, yfit, '-k', 'LineWidth', 2)
grid on
xlabel('Location of tick marks, inches')
ylabel('log_{10} N_{kb}')
legend('Southern blot ladder', ['Best fit line (r^2 = ' num2str(rsq) ')'], 'Location', 'SouthEast')
%savefig('check_logarithmic_scale')

% Scale for the number of kilobase pairs
x = scale(:,1);
Nkb = 10.^(polyval(p, scale(:,1)));

%% Create probability distribution from Southern blot data
% Define boundaries of blots (determined visually)
boundaryL = [1.5, 3.78];
boundaryS = [1.03, 2.37];

% Filter out distributions from the full line profile
distL = hL(hL(:,1) >= boundaryL(1) & hL(:,1) <= boundaryL(2), :); distL(:,2) = 256 - distL(:,2);
distS = hS(hS(:,1) >= boundaryS(1) & hS(:,1) <= boundaryS(2), :); distS(:,2) = 256 - distS(:,2);
NkbL = 10.^(polyval(p, scale(scale(:,1) >= boundaryL(1) & scale(:,1) <= boundaryL(2))));
NkbS = 10.^(polyval(p, scale(scale(:,1) >= boundaryS(1) & scale(:,1) <= boundaryS(2))));

% Perform a cubic spline smoothing and interpolation to the data
smoothingFactorL = 0.5;
smoothingFactorS = 0.75;
deltaN = 1;
[XL, pdfL] = createDiscretePDF(NkbL, distL(:,2), smoothingFactorL, deltaN);
[XS, pdfS] = createDiscretePDF(NkbS, distS(:,2), smoothingFactorS, deltaN);

% Plot line profiles vs. genomic distance
close all
plot(NkbL,distL(:,2),'-+')
hold on
plot(NkbS,distS(:,2),'r-+')
grid on
xlabel('Genomic length, kb')
ylabel('Plot profile, inverse gray scale')
legend('Hela L blot', 'Hela S blot')

figure
plot(XL, pdfL, 'b')
hold on
plot(XS, pdfS, 'r')
grid on
xlabel('Genomic length, kb')
ylabel('Probability density')
legend('Hela L', 'Hela S')

meanL = findMean(XL, pdfL, deltaN);
meanS = findMean(XS, pdfS, deltaN);
disp(['Mean of Hela L: ' num2str(meanL) ' kb'])
disp(['Mean of Hela S: ' num2str(meanS) ' kb'])

end

%% ==================== DO NOT EDIT BELOW THIS LINE =======================
function [X, pdf] = createDiscretePDF(x, y, smoothingFactor, deltaN)
% Creates a normalized probability density function using splines
%
% [pdf] = createDiscretePDF(x, y, smoothingFactor, deltaN) returns a spline
% representing a probability density function (pdf) for raw, discrete data
% in vector x with relative frequency y. deltaN represents the spacing
% between adjacent data values in the new distribution and is typically
% equal to 1.
%
% Inputs
%   x : single-column array of doubles
%       The data contained in the distribution 
%   y : single-column array of doubles
%       The (possibly unnormalized) frequencies or counts for the data in x
%   smoothingFactor : double between 0 and 1
%       Determines how accurately the interpolating spline matches the data
%       in y.
%   deltaN : double (typically 1)
%       The spacing between adjacent data values in the new distribution.
%
% Outputs
%   X : single-column array of doubles
%       Uniformly spaced x-axis values for the normalized pdf
%   pdf : single-column array of doubles
%       Probability distribution sampled at values of X

[~, cols] = size(x);
assert(cols == 1, 'Error: Input x must be a single-column array.')
assert(length(x) == length(y), 'Error: x and y must be the same lengths.')

% Approximate the distribution with a spline
relativeDist = csaps(x, y, smoothingFactor);

% Uniform samples of the approximating spline
X = floor(min(x)):deltaN:ceil(max(x));

% Normalized pdf of y sampled at uniformly spaced values x2
pdf = normDist(fnval(relativeDist, X), deltaN);
    
end

function outputDist = normDist(inputDist, deltaN)
% Normalize a distribution to make it a probability distribution function
%
% Inputs
%   inputDist : distributioin to normalize
%   deltaN : spacing between elements of the distribution

normFactor = sum(inputDist * deltaN);
outputDist = inputDist/normFactor;
end

function meanVal = findMean(x, pdf, deltaN)
% Finds the mean of a probability distribution
%
% Inputs
%   x : values to find the mean of
%   pdf : probability density function
%   deltaN : spacing between adjacent values in inputDist

meanVal = sum(x .* pdf * deltaN);
end