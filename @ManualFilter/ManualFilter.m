classdef ManualFilter
    % Manually choose which clusters to keep for analysis
    
    properties (SetAccess = private)
        inputClusters    % Class containing clusters of localizations
        imgPath          % Path to the widefield image to display
        keepOrReject     % Which clusters to keep?
        filteredClusters % Manually filtered and adjusted clusters
        noise % Localizations not clustered by DBSCAN
    end
    
    properties (Hidden = true)
        CoM   % Cluster centers of mass
    end
    
    properties(Constant)
        % Distance-to-pixel conversion factors (empirically determined)
        dist2pixX = 1/163;
        dist2pixY = 1/158;
    end
    
    methods
        function obj = ManualFilter(clusters, imgPath, CoM, noise)
            % Perform manual filtering routine on clustered localizations
            %
            % Parameters
            % ----------
            % clusters : cell array
            %     Cell array of clusters of localizations with each index
            %     corresponding to one cluster. Localizations are 2D or 3D
            %     arrays of double containing localization x-, y-, and
            %     z-coordinates.
            % imgPath  : string
            %     Full path and filename to the widefield image for the
            %     corresponding field of view.
            %
            % Returns
            % -------
            
            obj.inputClusters    = clusters;
            obj.imgPath          = imgPath;
            obj.CoM              = CoM;
            obj.noise            = noise;
            [obj.keepOrReject, obj.filteredClusters] = obj.doFiltering(clusters);
        end
    end
    
    methods (Hidden = true)
        function [clusters2Keep, clustersF] = doFiltering(obj, inputClusters)
            % Routine to perform the manual filtering
            
            clustersF    = inputClusters;
            numClustersF = length(clustersF);
            img          = imread(obj.imgPath);

            % Half-size of the square window around a cluster to display.
            % This should be even (for example, a half size of 10 will be
            % 21 X 21 pixels).
            windowSize = 10;

            dist2pixX = ManualFilter.dist2pixX;
            dist2pixY = ManualFilter.dist2pixY;

            s = get(0, 'ScreenSize');
            hFig = figure();
            % Make the figure window full-screen.
            % Divide width by two because I'm using dual monitors. Remove
            % this if using a single monitor.
            set(hFig, 'Position', [0, 0.1, s(3)/2, s(4)]);
            
            hAx1 = subplot(1,2,1);
            hAx2 = subplot(1,2,2);

            imshow(img, [min(img(:)) max(img(:))], 'Parent', hAx1)
            imshow(img, [min(img(:)) max(img(:))], 'Parent', hAx2)

            % Overlay the localizations on the widefield image
            hold(hAx1, 'on'); hold(hAx2, 'on')
            for ctr = 1:numClustersF
                plot(dist2pixX * clustersF{ctr}(:,1), dist2pixY * clustersF{ctr}(:,2), 'r+', 'Parent', hAx1)
                
                plot(dist2pixX * clustersF{ctr}(:,1), dist2pixY * clustersF{ctr}(:,2), 'r+', 'Parent', hAx2)
                plot(dist2pixX * obj.noise(:,1), dist2pixY * obj.noise(:,2), 'xg', 'Parent', hAx2);

            end
            hold(hAx1, 'off'); hold(hAx2, 'off')

            % Loop through each cluster and display it in the zoomed-region
            % window. If the user rejects a cluster for analysis, set its
            % corresponding position in 'clusters2Keep' to zero.
            clusters2Keep = ones(numClustersF, 1);
            for ctr = 1:numClustersF
                % Used to zoom the widefield image around the cluster
                currClusterCenter = round([dist2pixX * obj.CoM{ctr}(1), dist2pixY * obj.CoM{ctr}(2)]);
                xlim(hAx2, [currClusterCenter(1) - windowSize, currClusterCenter(1) + windowSize]);
                ylim(hAx2, [currClusterCenter(2) - windowSize, currClusterCenter(2) + windowSize]);

                % Idenfity the cluster on the full and zoomed widefield
                % image by drawing blue circles around the localizations
                hold(hAx1, 'on'); hold(hAx2, 'on')
                currClusterAx1 = plot(dist2pixX * clustersF{ctr}(:,1), dist2pixY * clustersF{ctr}(:,2), 'bo', 'markers', 10, 'Parent', hAx1);
                currClusterAx2 = plot(dist2pixX * clustersF{ctr}(:,1), dist2pixY * clustersF{ctr}(:,2), 'bo', 'markers', 10, 'Parent', hAx2);
                hold(hAx1, 'off'); hold(hAx2, 'off')
                
                % Select an area from the zoomed region to include points
                % inside the region or reject it.
                selectedArea = imrect();
                cropRegion   = wait(selectedArea);
                delete(selectedArea);
                xCoord = cropRegion(1);
                yCoord = cropRegion(2);
                width  = cropRegion(3);
                height = cropRegion(4);

                % Decide what to do with the cluster
                decision = obj.processUI(cropRegion, obj.CoM{ctr});
                if decision == 0
                    clusters2Keep(ctr) = 0;
                    disp('Cluster rejected...')
                else
                    % Find all noise points inside the user-selected box
                    % and add them to the cluster.
                    noiseX  = dist2pixX * obj.noise(:,1);
                    noiseY  = dist2pixY * obj.noise(:,2);
                    filterX = noiseX >= xCoord & noiseX <= (xCoord + width);
                    filterY = noiseY >= yCoord & noiseY <= (yCoord + width);
                    
                    includePts = obj.noise(filterX & filterY, :);
                    clustersF{ctr} = vertcat(clustersF{ctr}, includePts);
                end

                % Remove highlighting of current cluster
                delete(currClusterAx1)
                delete(currClusterAx2)
            end
            close(hFig);
        
        end
       
        function [decision] = processUI(obj, cropRegion, CoM)
            dist2pixX = ManualFilter.dist2pixX;
            dist2pixY = ManualFilter.dist2pixY;
            
            xCoord = cropRegion(1);
            yCoord = cropRegion(2);
            width  = cropRegion(3);
            height = cropRegion(4);
            
            % For testing whether you select a region containing the
            % cluster's center of mass.
            filterX = dist2pixX * CoM(1) >= xCoord & dist2pixX * CoM(1) <= (xCoord + width);
            filterY = dist2pixY * CoM(2) >= yCoord & dist2pixY * CoM(2) <= (yCoord + width);
            
            if ((width == 0) || (height == 0))
                % Size zero box selected. Reject cluster.
                decision = 0;
            elseif (filterX && filterY)
                % Box created and contains CoM. Include all points in box.
                decision = 1;
            else
                % Box created but drawn outside of center of mass. Reject
                % cluster.
                decision = 0;
            end
        end
    end
    
end

