%% Compute number distributions from Southern blots
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/10/22 $ $REVISION: 0.1 $
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
ppL = csaps(NkbL, distL(:,2), smoothingFactorL);
ppS = csaps(NkbS, distS(:,2), smoothingFactorS);

% Plot profiles vs. genomic distance
close all
fnplt(ppL)
hold on
plot(NkbL,distL(:,2),'-+')
fnplt(ppS,'r')
plot(NkbS,distS(:,2),'r-+')
grid on
xlabel('Genomic length, kb')
ylabel('Inverse blot gray scale, a.u.')
legend('Hela L blot', 'Hela L smoothing spline', 'Hela S blot', 'Hela S smoothing spline')

% Normalize the distributions to make them probability distributions
deltaN = 1; % Spacing between adjacent points on the x-axis in kb
xL = floor(min(NkbL)):1:ceil(max(NkbL));
xS = floor(min(NkbS)):1:ceil(max(NkbS));
normDistL = normDist(fnval(ppL, xL), deltaN);
normDistS = normDist(fnval(ppS, xS), deltaN);
figure
plot(xL, normDistL, 'gs', 'LineWidth', 2)
hold on
plot(xS, normDistS, 'mo', 'LineWidth', 2)
grid on
xlabel('Genomic length, kb')
ylabel('Probability density')
legend('Hela L', 'Hela S')

meanL = findMean(xL, normDistL, deltaN);
meanS = findMean(xS, normDistS, deltaN);
disp(['Mean of Hela L: ' num2str(meanL) ' kb'])
disp(['Mean of Hela S: ' num2str(meanS) ' kb'])

end

%% ==================== DO NOT EDIT BELOW THIS LINE =======================

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