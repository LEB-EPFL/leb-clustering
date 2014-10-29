%% Playground for MLE testing

% Equation checked for correctness against Nakamura, 2008 on 28-10-2014.
Rg2 = @(c, Lp, N) (Lp .* N ./ c) / 3 - ...
                 Lp.^2 + ...
                 2 * Lp.^3 ./ (N ./ c).^2 .* ...
                 ((N ./ c) - Lp .* (1 - exp(- (N ./ c)./ Lp)));
            
%% Do a parameter sweep of c and Lp to find range that includes <N>

avgNL = 25000;
avgNS = 10000;

c = 1:200;
Lp = 1:300;

[C, LP] = meshgrid(c, Lp);
gcp; % Start parallel processing toolbox if not already started

results = zeros(length(C(:)),1);
minRg = sqrt(3/2) * min(data(1).distributions.RgTrans);
maxRg = sqrt(3/2) * max(data(1).distributions.RgTrans);

parfor ctr = 1:length(results)
    currRg = sqrt(Rg2(C(ctr), LP(ctr), avgNL))
    
    if (currRg >= minRg && currRg <= maxRg)
       results(ctr) = 1;
    end
    
end

results = reshape(results, size(C));

% Plot which parameters are valid
% surf(LP, C, results)
% shading interp
% xlabel('Persistence length, nm')
% ylabel('base pairs per nanometer')

% Filter out non-possible values from C and LP
C = C(logical(results(:)));
LP = LP(logical(results(:)));

%% Bin all the Rg values and find the corresponding genomic lengths

numBins = 20; % I should find a better way to determine this number
[freq, centers] = hist(data(2).distributions.RgTrans, numBins);

% Find the histogram bin edges
spacing = diff(centers); spacing = spacing(1);
edges = zeros(1,length(centers) + 1);
edges(1:length(centers)) = centers - spacing/2;
edges(end) = max(centers) + spacing/2;

numParams = length(C(:));
Nbp = zeros(numParams, length(centers));
for ctr = 1:numParams
    disp(['Counter number ' num2str(ctr) ' of ' num2str(numParams)])
    for ctrNbp = 1:length(centers)
        rootFunc = @(N) sqrt(Rg2(C(ctr), LP(ctr), N)) - sqrt(3/2) * centers(ctrNbp);
        Nbp(ctr, ctrNbp) = fzero(rootFunc, avgNS);
    end
end

% For every Nbp, filter out NANS and rows with values less than 0
filter = ~logical(sum(isnan(Nbp),2));
C = C(filter);
LP = LP(filter);
Nbp = real(Nbp(filter,:));

filter = min(Nbp,[],2) > 0;
C = C(filter);
LP = LP(filter);
Nbp = Nbp(filter,:);

%% Loop through every value of Nbp and find it's MLE Gaussian parameters

phat = zeros(length(Nbp(:,1)), 2);
for ctr = 1:length(Nbp(:,1))
    disp(['Counter number ' num2str(ctr) ' of ' num2str(length(Nbp(:,1)))])
    phat(ctr,:) = mle(Nbp(ctr,:), 'frequency', freq);
end