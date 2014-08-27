% Helper functions for plotting and consolidating statistics from the fully
% processed data structure.
%
% These functions require a .mat file containing the relevant data loaded
% into the workspace.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/08/26 $ $REVISION: 0.1 $

%% Group fitted exponents from experiments for plotting.
%==========================================================================
% 11-06-2014 FISH Original data
%==========================================================================
currData = data(1).fits;
currDataName = data(1).shortName;
scalingExp1 = currData.fitRobust1.b;
confInt1 = abs(confint(currData.fitRobust1) - scalingExp1);
confInt1 = confInt1(:,2); % Isolate confidence interval of the exponent.

scalingExp2 = currData.fitRobust2.b;
confInt2 = abs(confint(currData.fitRobust2) - scalingExp2);
confInt2 = confInt2(:,2); % Isolate confidence interval of the exponent.

h = figure; hold;
barwitherr([[confInt1(1) confInt1(1)]' [confInt2(1) confInt2(1)]'], [1 5],[[scalingExp1 scalingExp1]' [scalingExp2 scalingExp2]'])
barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
colormap(barmap);
title(currDataName, 'FontSize', 14)
ylabel('Scaling exponent \nu*', 'FontSize', 14)
legend('Hela L', 'Hela S')
set(gca, 'XTick', [1], 'XTickLabel', {''})
xlim([-1 3])
ylim([0 0.5])
grid on

%% 29-07-2014 SmchD1
%==========================================================================
% 29-07-2014 SmchD1
%==========================================================================
dataOffset = 1;
numDatasets = 3;
xTicks = 1:numDatasets;
tickLabels = cell(numDatasets,1);

scalingExp1 = zeros(numDatasets,1); scalingExp2 = zeros(numDatasets,1);
confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);

for ctr = xTicks
    currData = data(ctr + dataOffset).fits;
    tickLabels{ctr} = data(ctr + dataOffset).shortName;
    tickLabels{ctr} = tickLabels{ctr}(19:end);
    scalingExp1(ctr) = currData.fitRobust1.b;
    confIntTemp = abs(confint(currData.fitRobust1) - scalingExp1(ctr));
    confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.

    scalingExp2(ctr) = currData.fitRobust2.b;
    confIntTemp = abs(confint(currData.fitRobust2) - scalingExp2(ctr));
    confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
end


h = figure; hold;
barwitherr([confInt1 confInt2], xTicks ,[scalingExp1 scalingExp2])
barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
colormap(barmap);
title('29-07-2014 SmchD1', 'FontSize', 14)
ylabel('Scaling exponent \nu*', 'FontSize', 14)
legend('Hela L', 'Hela S')
set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
ylim([0 0.5])
grid on

%% 30-07-2014 SmchD1
%==========================================================================
% 30-07-2014 SmchD1
%==========================================================================
dataOffset = 4;
numDatasets = 3;
xTicks = 1:numDatasets;
tickLabels = cell(numDatasets,1);

scalingExp1 = zeros(numDatasets,1); scalingExp2 = zeros(numDatasets,1);
confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);

for ctr = xTicks
    currData = data(ctr + dataOffset).fits;
    tickLabels{ctr} = data(ctr + dataOffset).shortName;
    tickLabels{ctr} = tickLabels{ctr}(19:end);
    scalingExp1(ctr) = currData.fitRobust1.b;
    confIntTemp = abs(confint(currData.fitRobust1) - scalingExp1(ctr));
    confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.

    scalingExp2(ctr) = currData.fitRobust2.b;
    confIntTemp = abs(confint(currData.fitRobust2) - scalingExp2(ctr));
    confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
end


h = figure; hold;
barwitherr([confInt1 confInt2], xTicks ,[scalingExp1 scalingExp2])
barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
colormap(barmap);
title('30-07-2014 SmchD1', 'FontSize', 14)
ylabel('Scaling exponent \nu*', 'FontSize', 14)
legend('Hela L', 'Hela S')
set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
ylim([0 0.5])
grid on

%% 05-08-2014 Hela L LRif1
%==========================================================================
% 05-08-2014 Hela L LRif1
%==========================================================================
dataOffset = 7;
numDatasets = 3;
xTicks = 1:numDatasets;
tickLabels = cell(numDatasets,1);

scalingExp1 = zeros(numDatasets,1); scalingExp2 = zeros(numDatasets,1);
confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);

for ctr = xTicks
    currData = data(ctr + dataOffset).fits;
    tickLabels{ctr} = data(ctr + dataOffset).shortName;
    tickLabels{ctr} = tickLabels{ctr}(19:end);
    scalingExp1(ctr) = currData.fitRobust1.b;
    confIntTemp = abs(confint(currData.fitRobust1) - scalingExp1(ctr));
    confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.

    scalingExp2(ctr) = currData.fitRobust2.b;
    confIntTemp = abs(confint(currData.fitRobust2) - scalingExp2(ctr));
    confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
end


h = figure; hold;
barwitherr([confInt1 confInt2], xTicks ,[scalingExp1 scalingExp2])
barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
colormap(barmap);
title('05-08-2014 Hela L LRif1', 'FontSize', 14)
ylabel('Scaling exponent \nu*', 'FontSize', 14)
legend('Transfection 1', 'Transfection 2')
set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
ylim([0 0.5])
grid on

%% 11-08-2014 TrF2
%==========================================================================
% 11-08-2014 TrF2
%==========================================================================
dataOffset = 10;
numDatasets = 4;
xTicks = 1:numDatasets;
tickLabels = cell(numDatasets,1);

scalingExp1 = zeros(numDatasets,1); scalingExp2 = zeros(numDatasets,1);
confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);

for ctr = xTicks
    currData = data(ctr + dataOffset).fits;
    tickLabels{ctr} = data(ctr + dataOffset).shortName;
    tickLabels{ctr} = tickLabels{ctr}(12:end);
    scalingExp1(ctr) = currData.fitRobust1.b;
    confIntTemp = abs(confint(currData.fitRobust1) - scalingExp1(ctr));
    confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.

    scalingExp2(ctr) = currData.fitRobust2.b;
    confIntTemp = abs(confint(currData.fitRobust2) - scalingExp2(ctr));
    confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
end


h = figure; hold;
barwitherr([confInt1 confInt2], xTicks ,[scalingExp1 scalingExp2])
barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
colormap(barmap);
title('11-08-2014 TrF2', 'FontSize', 14)
ylabel('Scaling exponent \nu*', 'FontSize', 14)
legend('Hela L', 'Hela S')
set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
ylim([0 0.5])
grid on

%% 11-08-2014 TrF2
%==========================================================================
% 13-08-2014 TrF2
%==========================================================================
dataOffset = 14;
numDatasets = 4;
xTicks = 1:numDatasets;
tickLabels = cell(numDatasets,1);

scalingExp1 = zeros(numDatasets,1); scalingExp2 = zeros(numDatasets,1);
confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);

for ctr = xTicks
    currData = data(ctr + dataOffset).fits;
    tickLabels{ctr} = data(ctr + dataOffset).shortName;
    tickLabels{ctr} = tickLabels{ctr}(12:end);
    scalingExp1(ctr) = currData.fitRobust1.b;
    confIntTemp = abs(confint(currData.fitRobust1) - scalingExp1(ctr));
    confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.

    scalingExp2(ctr) = currData.fitRobust2.b;
    confIntTemp = abs(confint(currData.fitRobust2) - scalingExp2(ctr));
    confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
end


h = figure; hold;
barwitherr([confInt1 confInt2], xTicks ,[scalingExp1 scalingExp2])
barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
colormap(barmap);
title('13-08-2014 TrF2', 'FontSize', 14)
ylabel('Scaling exponent \nu*', 'FontSize', 14)
legend('Hela L', 'Hela S')
set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
ylim([0 0.5])
grid on

%% All data
dataOffset = 0;
numDatasets = 18;
xTicks = 1:numDatasets;
tickLabels = cell(numDatasets,1);

scalingExp1 = zeros(numDatasets,1); scalingExp2 = zeros(numDatasets,1);
confInt1 = zeros(numDatasets,1); confInt2 = zeros(numDatasets,1);

for ctr = xTicks
    currData = data(ctr + dataOffset).fits;
    tickLabels{ctr} = data(ctr + dataOffset).shortName;
    tickLabels{ctr} = tickLabels{ctr}(12:end);
    scalingExp1(ctr) = currData.fitRobust1.b;
    confIntTemp = abs(confint(currData.fitRobust1) - scalingExp1(ctr));
    confInt1(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.

    scalingExp2(ctr) = currData.fitRobust2.b;
    confIntTemp = abs(confint(currData.fitRobust2) - scalingExp2(ctr));
    confInt2(ctr) = confIntTemp(2,2); % Isolate confidence interval of the exponent.
end


h = figure('units','normalized','outerposition',[0 0 1 1]); hold;
barwitherr([confInt1 confInt2], xTicks ,[scalingExp1 scalingExp2])
%barmap=[0.7 0.7 0.7; 0.05 .45 0.1]; %[0.7 0.7 0.7] is grey, [0.05 .45 0.1] is green
%colormap(barmap);
ylab = ylabel('Scaling exponent \nu*');
set(ylab, 'position', get(ylab,'position')-[0.2,0,0]);  % shift the y label to the left by 0.2
set(gca, 'XTick', xTicks, 'XTickLabel', tickLabels)
xticklabel_rotate(xTicks, 25, tickLabels)
set(findall(gcf,'type','text'),'FontSize',14,'fontWeight','bold')
ylim([0 0.5])
grid on
hold on
plot([0 19], [0.33 0.33], 'k', 'LineWidth', 2)
legend('Hela L', 'Hela S')
plot([1.5 1.5], [0 0.5],'k--')
plot([4.5 4.5], [0 0.5],'k--')
plot([7.5 7.5], [0 0.5],'k--')
plot([10.5 10.5], [0 0.5],'k--')
plot([14.5 14.5], [0 0.5],'k--')

text(0.1, 0.47, 'Original Data', 'FontSize', 14)
text(1.6, 0.47, '29-7-14 SmchD1', 'FontSize', 14)
text(4.6, 0.47, '30-7-14 SmchD1', 'FontSize', 14)
text(7.6, 0.47, '05-08-14 LRif1', 'FontSize', 14)
text(10.6, 0.47, '11-08-14 TrF2', 'FontSize', 14)
text(14.6, 0.47, '13-08-14 TrF2', 'FontSize', 14)

hold off

%% Plot residuals from the fit of a dataset
plot(data(18).fits.fitRobust2, data(18).distributions2.numLoc, data(18).distributions2.M2Mag, 'co', 'residuals')

%% Display all r-squared values
for ctr = 1:length(data)
    [data(ctr).fits.gofRobust1.rsquare data(ctr).fits.gofRobust2.rsquare]
end
