% Use this for estimating correct polymer parameters for the data and
% model! I used this to make the plot on the poster.

% Equation checked for correctness against Nakamura, 2008 on 28-10-2014.
meanRg2 = @(c, Lp, N) (Lp .* N ./ c) / 3 - ...
                      Lp.^2 + ...
                      2 * Lp.^3 ./ (N ./ c).^2 .* ...
                      ((N ./ c) - Lp .* (1 - exp(- (N ./ c)./ Lp)));
stdRg2 = @(c, Lp, Nmin, Nmax) ...
    (meanRg2(c, Lp, Nmin) + meanRg2(c, Lp, Nmax)) / 2;
                  
% Assume for now
meanN = 2.5e4;
stdN = 8e3;

% Here I assume that the real Rg is Gaussian distributed with a width
% determined not by intrinsic polymer fluctuations, but rather by the
% spread in genomic lengths of the telomeres. In reality, the width of the
% Rg distribution would reflect the width in the distribution of N AND the
% due to fluctuations for a single value of N.
logLikelihood = @(c, Lp, Rg2, N) -length(Rg2)/2 * (log(2*pi) +  ...
    log(stdRg2(c, Lp, meanN - stdN, meanN + stdN))) ...
    -1/2./stdRg2(c, Lp, meanN - stdN, meanN + stdN).^2 ...
    * sum((Rg2 - meanRg2(c, Lp, N)).^2);

% % Old logLikelihood with error in stdRg2
% logLikelihood = @(c, Lp, Rg2, N) -length(Rg2)/2 * (log(2*pi) +  ...
%     log(stdRg2(c, Lp, meanN - stdN, meanN + stdN))) ...
%     -1/2./std(Rg2).^2 * sum((Rg2 - sqrt(meanRg2(c, Lp, N))).^2);

% X is the data vector converted to 3D
X = sqrt(3/2) * data(1).distributions.RgTrans;
[N, bins] = hist(X.^2, 25);
% pp = csaps(bins,N,1);
% dx = diff(bins); dx = dx(1);
% normFactor = sum(fnval(bins,pp) * dx);
% hist((sqrt(3/2) * data(1).distributions.RgTrans).^2, 25);
% hold on
% plot(bins, fnval(bins,pp)/normFactor,'r','LineWidth',2);
% grid on

%post = @(c, Lp) prior .* likelihood(c, Lp, X, sRg2, meanN);
%post = @(c, Lp) prior .* likelihood(c, Lp, X, meanN);
post = @(c, Lp) logLikelihood(c, Lp, X.^2, meanN);

C = 10:90;
LP = 50:300;
ppost = zeros(length(C), length(LP));

for i = 1:length(C)
    for j = 1:length(LP)
        ppost(i,j) = post(C(i), LP(j));
    end
end

contour(LP,C,ppost,100)
xlabel('Persistence length, nm')
ylabel('Packing ratio, bp/nm')

figure

numBP = meanN + stdN * randn(1e4,1);
numBP(numBP < 0) = 1;
subplot(2,1,1)
hist(X.^2, 50)
title('Experimental data')
xlim([0 3e4])

subplot(2,1,2)
hist(meanRg2(50, 100, numBP),25)
xlim([0 3e4])

%% Plot the summed term and the std term as a function of c
cc = 1:100;
lp = 100;
summedTerm = zeros(length(cc),1);
stdTerm = zeros(length(cc),1);
logStd = zeros(length(cc),1);
llh = zeros(length(cc),1);
for ctr = 1:length(cc)
    summedTerm(ctr) = sum((X.^2 - meanRg2(cc(ctr), lp, meanN)).^2);
    stdTerm(ctr) = stdRg2(cc(ctr), lp, meanN-stdN, meanN+stdN).^2;
    logStd(ctr) = length(X) / 2 * (log(stdRg2(cc(ctr), lp, meanN - stdN, meanN + stdN)) + log(2 * pi)) + summedTerm(ctr)./stdTerm(ctr)/2;
    llh(ctr) = -post(cc(ctr), lp);
end

semilogy(cc, summedTerm, 'LineWidth', 2)
hold on
semilogy(cc, stdTerm, 'r', 'LineWidth', 2)
semilogy(cc, summedTerm./stdTerm, 'k', 'LineWidth', 2)
semilogy(cc, logStd, 'm', 'LineWidth', 2)
semilogy(cc, llh, 'g', 'LineWidth', 1)
hold off
legend('summed term', 'std Term', 'quotient', 'log std', 'neg log-likelihood')
grid on
title(['lp = ', num2str(lp)])