%% Compute number distributions from Southern blots
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/10/22 $ $REVISION: 0.2 $

function southern_blot(data)
%% Read in line profiles of Southern blots
hL = dlmread('helaL.txt');
hS = dlmread('helaS.txt');
scale = dlmread('scale.txt');

%% Convert from image distance scale to genomic scale
% Find locations of tick marks in the scale profile
filterLevel = 126; % Set by visual inspection of line profiles
scaleTicks = scale(scale(:,2) <= filterLevel, 1);

% Number of kilobase pairs correspoinding to the ticks
NTicks = [2, 2.5, 3, 4, 5, 6, 8, 10, 15, 17, 24, 29, 33, 38, 48.5]';

% Adjust for out of range marks
scaleTicks = scaleTicks(7:end);
NTicks = NTicks(7:end);

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

%% Create probability distributions from Southern blot data
% Define boundaries of blots (determined visually)
boundaryL = [120, 138];
boundaryS = [100, 120];

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
plot(XL, pdfL, 'b', 'LineWidth', 2)
hold on
plot(XS, pdfS, 'r', 'LineWidth', 2)
grid on
xlabel('Genomic length, kb')
ylabel('Probability density')
legend('Hela L', 'Hela S')

meanL = findMean(XL, pdfL, deltaN);
meanS = findMean(XS, pdfS, deltaN);
disp(['Mean of Hela L: ' num2str(meanL) ' kb'])
disp(['Mean of Hela S: ' num2str(meanS) ' kb'])

%% Find the cumulative distribution functions for Hela L and Hela S
cdfL = findCDF(XL, pdfL, deltaN);
cdfS = findCDF(XS, pdfS, deltaN);

figure
plot(XL, cdfL, 'b', 'LineWidth', 2)
hold on
plot(XS, cdfS, 'r', 'LineWidth', 2)
grid on
xlabel('Genomic length, kb')
ylabel('Cumulative distribution function')
legend('Hela L', 'Hela S', 'Location', 'SouthEast')

%% Load number of localization data into memory

% FILTERING: DO THIS MORE RIGOROUSLY
filterDistL = data(1);
filterDistS = data(2);

filterL = filterDistL.distributions.numLoc < 500;
filterS = filterDistS.distributions.numLoc < 300;

filterDistL.distributions.RgTrans = filterDistL.distributions.RgTrans(filterL);
filterDistL.distributions.numLoc = filterDistL.distributions.numLoc(filterL);

filterDistS.distributions.RgTrans = filterDistS.distributions.RgTrans(filterS);
filterDistS.distributions.numLoc = filterDistS.distributions.numLoc(filterS);

[nL,xL] = hist(filterDistL.distributions.numLoc, 1:max(filterDistL.distributions.numLoc));
[nS,xS] = hist(filterDistS.distributions.numLoc, 1:max(filterDistS.distributions.numLoc));
nL = nL'; xL = xL';
nS = nS'; xS = xS';

% Experimental number of localization distributions
smoothingFactorExp = 0.01;
deltaNL = 50;
deltaNS = 25;
[expXL, exp_pdfL] = createDiscretePDF(xL, nL, smoothingFactorExp, deltaNL);
[expXS, exp_pdfS] = createDiscretePDF(xS, nS, smoothingFactorExp, deltaNS);

figure
plot(expXL, exp_pdfL, 'LineWidth', 2)
hold on
plot(expXS, exp_pdfS, 'r', 'LineWidth', 2)
grid on
xlabel('Number of localizations')
ylabel('Probability density')
legend('Hela L', 'Hela S')

%% Find cumulative distribution functions for number of localizations
exp_cdfL = findCDF(expXL, exp_pdfL, deltaNL);
exp_cdfS = findCDF(expXS, exp_pdfS, deltaNS);

figure
plot(expXL, exp_cdfL, 'b', 'LineWidth', 2)
hold on
plot(expXS, exp_cdfS, 'r', 'LineWidth', 2)
grid on
xlabel('Number of localizations')
ylabel('Cumulative distribution function')
legend('Hela L', 'Hela S', 'Location', 'SouthEast')

%% Compute the number in kb corresponding to the number of localizations
NLMap = findMapping(expXL, exp_cdfL, XL, cdfL);
NSMap = findMapping(expXS, exp_cdfS, XS, cdfS);
figure;
plot(expXL, NLMap, 'LineWidth', 2)
hold on
plot(expXS, NSMap, 'r', 'LineWidth', 2)
grid on
xlabel('Number of localizations')
ylabel('Genomic length, kb')
legend('Hela L', 'Hela S', 'Location', 'NorthWest')

%% Convert to genomic length scale using interpolating splines
NL = spline(expXL, NLMap, data(1).distributions.numLoc);
NS = spline(expXS, NSMap, data(2).distributions.numLoc);
%% Plot scatter plots of Hela L and Hela S vs. genomic distance
%close all
figure
scatter(NL, data(1).distributions.RgTrans, '.b')
grid on
xlabel('Genomic length, kb')
ylabel('R_g^{x,y}')
figure
scatter(NS, data(2).distributions.RgTrans, '.r')
xlabel('Genomic length, kb')
ylabel('R_g^{x,y}')

%% Rescale the fit curves onto the genomic distance plot
aL = data(1).fits.fitRgTransRobust.a;
bL = data(1).fits.fitRgTransRobust.b;
aS = data(2).fits.fitRgTransRobust.a;
bS = data(2).fits.fitRgTransRobust.b;

yL = aL * expXL.^bL;
yS = aS * expXS.^bS;
figure
loglog(NLMap,yL, 'LineWidth', 2)
hold on
loglog(NSMap,yS, 'r', 'LineWidth', 2)
grid on
xlabel('Genomic distance, kb')
ylabel('R_g^{x,y}, nm')
end

%% ==================== DO NOT EDIT BELOW THIS LINE =======================
function [X, pdf] = createDiscretePDF(x, y, smoothingFactor, deltaN)
% Creates a normalized probability density function using splines
%
% [pdf] = createDiscretePDF(x, y, smoothingFactor, deltaN) returns two
% single-column arrays representing a probability density function (pdf)
% and its associated data for raw, discrete data in vector x with relative
% frequency y. deltaN represents the spacing between adjacent data values
% in the new distribution and is typically equal to 1.
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
% (The absolute value inverts negative values from spline fitting)
pdf = normalizeDist(abs(fnval(relativeDist, X)), deltaN);
    
end

function [outputDist] = sizeNumberFilter(data)
% Filters size and number of localizations distributions
Rg = data.distributions.RgTrans;
numLoc = data.distributions.numLoc;
end

function [outputDist] = normalizeDist(inputDist, deltaN)
% Normalize a distribution to make it a probability distribution function
%
% Inputs
%   inputDist : distribution to normalize
%   deltaN : spacing between elements of the distribution

normFactor = sum(inputDist * deltaN);
outputDist = inputDist/normFactor;
end

function [cdf] = findCDF(x, pdf, deltaN)
% Finds the cumulative distribution function from a pdf object.
%
% Inputs
%   x : single-column array of doubles
%       Locations where the pdf is sampled.
%   pdf : single-column array of doubles
%       Normalized probability distribution for data in x
%   deltaN : double
%       Spacing between adjacent x-values
% Outputs
%   cdf : single-column array of doubles
%       Cumulative distribution function at values of x.

assert(length(x) == length(pdf), 'Error: x and pdf must have the same lengths')

cdf = zeros(length(pdf),1);
for ctr = 1:length(x)
    if ctr == 1
        cdf(ctr) = pdf(ctr) * deltaN;
    else
        cdf(ctr) = pdf(ctr) * deltaN + cdf(ctr - 1);
    end
end
end

function [N] = findMapping(x1, cdf1, x2, cdf2)
% Determines the mapping between x1 and x2 based on a cdf transformation
%
% Inputs
%   x1 : single-column array of doubles
%       Data from the first distribution
%   cdf1 : single-column array of doubles
%       The cdf for the first distribution
%   x2: single-column array of doubles
%       Data from the second distribution
%   cdf2: single-column array of doubles
%       The cdf for the second distribution

% Fit a spline to the second cdf
ppCDF2 = csaps(x2, cdf2);

N = zeros(length(x1),1);
for ctr = 1:length(x1)
   % Define a function of a continuous variable related to x2 and find its
   % root. This root will correspond to the value resulting from the
   % desired mapping of x1 onto a continuous scale with samples at x2.
   diffFun = @(Y) cdf1(ctr) - fnval(Y, ppCDF2);
   N(ctr) = fzero(diffFun, median(x2));
end

end

function [meanVal] = findMean(x, pdf, deltaN)
% Finds the mean of a probability distribution
%
% Inputs
%   x : values to find the mean of
%   pdf : probability density function
%   deltaN : spacing between adjacent values in inputDist

meanVal = sum(x .* pdf * deltaN);
end