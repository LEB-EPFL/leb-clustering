%% Plots the Rg or transverse Rg vs numLoc scatter plots with fits
function plotScatter(data, fieldName, figParams)
% data - Single data structure (not an array)
% fieldName - String for which quantity lies on the y-axis (Rg or RgTrans)
% figParams - Structure of figure parameters for plotting
%   .title - String
%   .xlim - (Optional) Double array of minimum and maximum x-values
%   .ylim - (Optional) Double array of minimum and maximum y-values

    dataFields = fieldnames(data(1).distributions); % Fields of data.distributions

    % Is the supplied field name a field inside the data structure?
    assert(ismember(fieldName, dataFields), 'Error: The supplied field name must be a field of the data structure.')

    x = data.distributions.numLoc;
    if strcmp(fieldName, 'Rg')
        y = data.distributions.Rg;
        
        fitNormal = data.fits.fitNormal;
        fitNoOutliers = data.fits.fitNoOutliers;
        fitRobust = data.fits.fitRobust;
        residuals = data.fits.fitInfoNormal.residuals;
        I = abs(residuals) > 1.5 * std(residuals);
        outliers = excludedata(x,y,'indices',I);

        figure
        plot(fitNormal, 'b-', x, y, 'k.', outliers, 'm*')
        hold on
        plot(fitNoOutliers, 'r--')
        plot(fitRobust, 'g-')
        legend('Data', 'Outliers', 'Original fit', 'Fit with outliers excluded', 'Robust fit' )
        hold off

        grid on
        title([data.experimentShortName ' / ' data.datasetShortName])
        xlabel('Number of localizations')
        ylabel('R_g, nm')

    elseif strcmp(fieldName, 'RgTrans')
        y = data.distributions.RgTrans;
        
        fitRgTransNormal = data.fits.fitRgTransNormal;
        fitRgTransNoOutliers = data.fits.fitRgTransNoOutliers;
        fitRgTransRobust = data.fits.fitRgTransRobust;
        residuals = data.fits.fitRgTransInfoNormal.residuals;
        I = abs(residuals) > 1.5 * std(residuals);
        outliers = excludedata(x,y,'indices',I);

        figure
        plot(fitRgTransNormal, 'b-', x, y, 'k.', outliers, 'm*')
        hold on
        plot(fitRgTransNoOutliers, 'r--')
        plot(fitRgTransRobust, 'g-')
        legend('Data', 'Outliers', 'Original fit', 'Fit with outliers excluded', 'Robust fit' )
        hold off

        grid on
        title([data.experimentShortName ' / ' data.datasetShortName])
        xlabel('Number of localizations')
        ylabel('R_g^{x,y}, nm')
    end
    
    % Checks if xlim or ylim were supplied in figParam structure.
if isfield(figParams, 'xlim')
    xlim(figParams.xlim)
end

if isfield(figParams, 'ylim')
    ylim(figParams.ylim)
end

end