%% Compute number distributions from Southern blots
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/10/22 $ $REVISION: 0.1 $

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
savefig('check_logarithmic_scale')

% Scale for the number of kilobase pairs
x = scale(:,1);
Nkb = 10.^(polyval(p, scale(:,1)));