classdef ManualFilter < handle
    % Manually choose which clusters to keep for analysis
    
    properties (SetAccess = private)
        inputClusters    % Class containing clusters of localizations
        imgPath          % Path to the widefield image to display
        keepOrReject     % Which clusters to keep?
        outputClusters   % Manually filtered and adjusted clusters
        noise            % Localizations not clustered by DBSCAN
    end
    
    properties (Hidden = true)
        CoM         % Cluster centers of mass
        hFig        % Figure handle
        hAx1        % Handle to full widefield image
        hAx2        % Handle to zoomed widefield image
        currCluster % Index of the current cluster being analyzed
    end
    
    properties(Constant)
        % Distance-to-pixel conversion factors (empirically determined)
        dist2pixX = 1/163;
        dist2pixY = 1/158;
        
        % Half-size of the zoomed region (for example, windowSize = 10
        % means a full linear size of 2*10 + 1 = 21 pixels).
        windowSize = 10; 
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
            obj.CoM              = CoM; % MAKE THIS A METHOD EVENTUALLY
            obj.noise            = noise;
            obj.currCluster      = 1;
            [hFig, hAx1, hAx2] = obj.drawInitFig(clusters);
            
            obj.hFig = hFig;
            obj.hAx1 = hAx1;
            obj.hAx2 = hAx2;
            keyboard
            %[obj.keepOrReject, obj.filteredClusters] = obj.doFiltering(clusters);
        end
    end
    
    methods (Hidden = true)
        function [hFig, hAx1, hAx2] = drawInitFig(obj, inputClusters)
            % Draws the initial figure and sets up the event listener.
            numClusters = length(inputClusters);
            img         = imread(obj.imgPath);
            
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
            
            % Overlay the localizations on the widefield image.
            hold(hAx1, 'on'); hold(hAx2, 'on')
            for ctr = 1:numClusters
                plot(ManualFilter.dist2pixX * inputClusters{ctr}(:,1), ...
                     ManualFilter.dist2pixY * inputClusters{ctr}(:,2), ...
                     'r+', ...
                     'Parent', hAx1)
                plot(ManualFilter.dist2pixX * obj.noise(:,1), ...
                     ManualFilter.dist2pixY * obj.noise(:,2), ...
                    'xg', ...
                    'Parent', hAx2);

            end
            hold(hAx1, 'off'); hold(hAx2, 'off')
            
            % Monitor the figure for user-input
            set(hFig, 'KeyPressFcn', @obj.processUI)
        end
        
        function moveToNextCluster(obj, inputClusters)
            % Routine to perform the manual filtering
            clusters    = inputClusters;
            ctr         = obj.currCluster;
            hFig        = obj.hFig;
            hAx1        = obj.hAx1;
            hAx2        = obj.hAx2;
            
            disp(ctr)
            
            % Display the current cluster in the zoomed-region window
            currClusterCenter = round([ManualFilter.dist2pixX * obj.CoM{ctr}(1), ...
                                       ManualFilter.dist2pixY * obj.CoM{ctr}(2)]);
            
            xlim(hAx2, [currClusterCenter(1) - ManualFilter.windowSize, currClusterCenter(1) + ManualFilter.windowSize]);
            ylim(hAx2, [currClusterCenter(2) - ManualFilter.windowSize, currClusterCenter(2) + ManualFilter.windowSize]);

            % Idenfity the cluster on the full and zoomed widefield
            % image by drawing blue circles around the localizations
            hold(hAx1, 'on'); hold(hAx2, 'on')
            currClusterAx1 = plot(ManualFilter.dist2pixX * obj.CoM{ctr}(:,1), ...
                                  ManualFilter.dist2pixY * obj.CoM{ctr}(:,2), ...
                                  'bo', ...
                                  'markers', 6, ...
                                  'MarkerFaceColor', 'blue', ...
                                  'Parent', hAx1);

            currClusterAx2 = plot(ManualFilter.dist2pixX * clusters{ctr}(:,1), ...
                                  ManualFilter.dist2pixY * clusters{ctr}(:,2), ...,
                                  'b.', ...
                                  'Parent', hAx2);

            hold(hAx1, 'off'); hold(hAx2, 'off')
            
            % TODO: CHECK FOR END OF CLUSTERS
            obj.currCluster = obj.currCluster + 1;

            % Remove highlighting of current cluster
            %delete(currClusterAx1)
            %delete(currClusterAx2)
            
            %close(hFig);
        
        end
        
        function obj = setCurrentCluster(obj, clusterNumber)
            % Sets the index of the current cluster for analysis.
            obj.currCluster = clusterNumber;
        end

        function processUI(obj, gcbo, event)
            disp(event)
            obj.moveToNextCluster(obj.inputClusters)
            
            
%             dist2pixX = ManualFilter.dist2pixX;
%             dist2pixY = ManualFilter.dist2pixY;
%             
%             xCoord = cropRegion(1);
%             yCoord = cropRegion(2);
%             width  = cropRegion(3);
%             height = cropRegion(4);
%             
%             % For testing whether you select a region containing the
%             % cluster's center of mass.
%             filterX = dist2pixX * CoM(1) >= xCoord & dist2pixX * CoM(1) <= (xCoord + width);
%             filterY = dist2pixY * CoM(2) >= yCoord & dist2pixY * CoM(2) <= (yCoord + width);
%             
%             if ((width == 0) || (height == 0))
%                 % Size zero box selected. Reject cluster.
%                 decision = 0;
%             elseif (filterX && filterY)
%                 % Box created and contains CoM. Include all points in box.
%                 decision = 1;
%             else
%                 % Box created but drawn outside of center of mass. Reject
%                 % cluster.
%                 decision = 0;
%             end
        end
    end
    
end

%             % Loop through each cluster and display it in the zoomed-region
%             % window. If the user rejects a cluster for analysis, set its
%             % corresponding position in 'clusters2Keep' to zero.
%             clusters2Keep = ones(numClustersF, 1);
%             for ctr = 1:numClustersF
%                 % Used to zoom the widefield image around the cluster
%                 currClusterCenter = round([dist2pixX * obj.CoM{ctr}(1), dist2pixY * obj.CoM{ctr}(2)]);
%                 xlim(hAx2, [currClusterCenter(1) - windowSize, currClusterCenter(1) + windowSize]);
%                 ylim(hAx2, [currClusterCenter(2) - windowSize, currClusterCenter(2) + windowSize]);
% 
%                 % Idenfity the cluster on the full and zoomed widefield
%                 % image by drawing blue circles around the localizations
%                 hold(hAx1, 'on'); hold(hAx2, 'on')
%                 currClusterAx1 = plot(dist2pixX * clustersF{ctr}(:,1), dist2pixY * clustersF{ctr}(:,2), 'bo', 'markers', 10, 'Parent', hAx1);
%                 currClusterAx2 = plot(dist2pixX * clustersF{ctr}(:,1), dist2pixY * clustersF{ctr}(:,2), 'bo', 'markers', 10, 'Parent', hAx2);
%                 hold(hAx1, 'off'); hold(hAx2, 'off')
%                 
%                 % Select an area from the zoomed region to include points
%                 % inside the region or reject it.
%                 selectedArea = imrect();
%                 cropRegion   = wait(selectedArea);
%                 delete(selectedArea);
%                 xCoord = cropRegion(1);
%                 yCoord = cropRegion(2);
%                 width  = cropRegion(3);
%                 height = cropRegion(4);
% 
%                 % Decide what to do with the cluster
%                 decision = obj.processUI(cropRegion, obj.CoM{ctr});
%                 if decision == 0
%                     clusters2Keep(ctr) = 0;
%                     disp('Cluster rejected...')
%                 else
%                     % Find all noise points inside the user-selected box
%                     % and add them to the cluster.
%                     noiseX  = dist2pixX * obj.noise(:,1);
%                     noiseY  = dist2pixY * obj.noise(:,2);
%                     filterX = noiseX >= xCoord & noiseX <= (xCoord + width);
%                     filterY = noiseY >= yCoord & noiseY <= (yCoord + width);
%                     
%                     includePts = obj.noise(filterX & filterY, :);
%                     clustersF{ctr} = vertcat(clustersF{ctr}, includePts);
%                 end
