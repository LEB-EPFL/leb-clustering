%% Pooled data for SmchD1/TRF2 double KD experiment
% These data come from the 08-09-2014 and the 09-09-2014 datasets.
data_visualization(data);

disp(['Mean value of RgTrans / pSuper/pSuper: ' num2str(mean(data(1).distributions.RgTrans)) ' nm'])
disp(['Standard deviation of RgTrans / pSuper/pSuper: ' num2str(std(data(1).distributions.RgTrans)) ' nm'])
disp(['-----------------------------------------------------------------'])
disp(['Mean value of RgTrans / pSuper/pTRF2: ' num2str(mean(data(2).distributions.RgTrans)) ' nm'])
disp(['Standard deviation value of RgTrans / pSuper/TRF2: ' num2str(std(data(2).distributions.RgTrans)) ' nm'])
disp(['-----------------------------------------------------------------'])
disp(['Mean value of RgTrans / pLVP041/pSuper: ' num2str(mean(data(3).distributions.RgTrans)) ' nm'])
disp(['Standard deviation of RgTrans / pLVP041/pSuper: ' num2str(std(data(3).distributions.RgTrans)) ' nm'])
disp(['-----------------------------------------------------------------'])
disp(['Mean value of RgTrans / pLVP041/TRF2: ' num2str(mean(data(4).distributions.RgTrans)) ' nm'])
disp(['Standard deviation value of RgTrans / pLVP041/TRF2: ' num2str(std(data(4).distributions.RgTrans)) ' nm'])
disp(['-----------------------------------------------------------------'])
disp(['Mean value of RgTrans / pLVP042/pSuper: ' num2str(mean(data(5).distributions.RgTrans)) ' nm'])
disp(['Standard deviation value of RgTrans / pLVP042/pSuper: ' num2str(std(data(5).distributions.RgTrans)) ' nm'])
disp(['-----------------------------------------------------------------'])
disp(['Mean value of RgTrans / pLVP042/TRF2: ' num2str(mean(data(6).distributions.RgTrans)) ' nm'])
disp(['Standard deviation value of RgTrans / pLVP042/TRF2: ' num2str(std(data(6).distributions.RgTrans)) ' nm'])