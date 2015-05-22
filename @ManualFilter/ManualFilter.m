classdef ManualFilter < handle
    % Manually choose which clusters to keep for analysis
    
    properties (SetAccess = private)
        inputClusters    % Class containing clusters of localizations
        imgPath          % Path to the widefield image to display
        keepOrReject                  % Which clusters to keep?
        outputClusters   % Manually filtered and adjusted clusters
        noise            % Localizations not clustered by DBSCAN
        hFig             % Figure handle to the main GUI
    end
    
    properties (Hidden = true)
        CoM            % Cluster centers of mass
        hAx1           % Handle to full widefield image
        hAx2           % Handle to zoomed widefield image
        hROI           % Handle to user-selected region
        currCluster    % Index of the current cluster being analyzed
        currClusterAx1 % Full image handle to current cluster
        currClusterAx2 % Zoomed image hangle to current cluster
    end
    
    properties(Constant, Hidden = true)
        % Distance-to-pixel conversion factors (empirically determined)
        dist2pixX = 1/163;
        dist2pixY = 1/158;
        
        % Half-size of the zoomed region (for example, windowSize = 10
        % means a full linear size of 2*10 + 1 = 21 pixels).
        windowSize = 10; 
    end
    
    methods
        function obj = ManualFilter(clusters, imgPath, noise)
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
            
            numClusters = length(clusters);
            obj.keepOrReject = logical(ones(numClusters, 1));
            
            obj.inputClusters    = clusters;
            obj.outputClusters   = clusters;
            obj.imgPath          = imgPath;
            obj.noise            = noise;
            obj.currCluster      = 1;
            
            % Compute the center of mass of all the clusters
            obj.CoM = cellfun(@mean, clusters, 'UniformOutput', false);
            
            [hFig, hAx1, hAx2] = obj.drawInitFig(clusters);
            obj.hFig = hFig;
            obj.hAx1 = hAx1;
            obj.hAx2 = hAx2;
            obj.hROI = [];
            obj.moveToNextCluster(clusters);
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
            
            % Display the current cluster in the zoomed-region window
            currClusterCenter = round([ManualFilter.dist2pixX * obj.CoM{ctr}(1), ...
                                       ManualFilter.dist2pixY * obj.CoM{ctr}(2)]);
            
            xlim(hAx2, [currClusterCenter(1) - ManualFilter.windowSize, currClusterCenter(1) + ManualFilter.windowSize]);
            ylim(hAx2, [currClusterCenter(2) - ManualFilter.windowSize, currClusterCenter(2) + ManualFilter.windowSize]);

            % Idenfity the cluster on the full and zoomed widefield
            % image by drawing blue circles around the localizations
            hold(hAx1, 'on'); hold(hAx2, 'on')
             
            obj.currClusterAx1 = plot(ManualFilter.dist2pixX * obj.CoM{ctr}(:,1), ...
                                      ManualFilter.dist2pixY * obj.CoM{ctr}(:,2), ...
                                      'wo', ...
                                      'markers', 12, ...
                                      'Parent', hAx1);

            obj.currClusterAx2 = plot(ManualFilter.dist2pixX * clusters{ctr}(:,1), ...
                                      ManualFilter.dist2pixY * clusters{ctr}(:,2), ...,
                                      'b.', ...
                                      'Parent', hAx2);
                     
            % Mark the previously analyzed cluster
            if obj.currCluster ~= 1
                obj.markPreviousCluster();
            end

            hold(hAx1, 'off'); hold(hAx2, 'off')
        
        end

        function processUI(obj, gcbo, event)
            %
            
            % Process the user-input based on which key was pressed
            switch event.Key
                case 'space'
                    % Check whether there is a ROI, and if so, add all
                    % noise points in the ROI to the cluster
                    if ~isempty(obj.hROI)
                        obj.addPointsToCluster();
                        
                        % Reset the ROI
                        delete(obj.hROI);
                        obj.hROI = [];
                    end
                    
                    % Accept cluster for further analysis
                    obj.keepOrReject(obj.currCluster) = 1;
                    
                    % Update cluster number
                    obj.currCluster = obj.currCluster + 1;

                case 'r'
                    % Reject cluster from analysis
                    if ~isempty(obj.hROI)
                                           
                        % Reset the ROI
                        delete(obj.hROI);
                        obj.hROI = [];
                    end
                    
                    obj.keepOrReject(obj.currCluster) = 0;
                    
                    % Update cluster number
                    obj.currCluster = obj.currCluster + 1;
                    
                case 'e'
                    % Enable user-input for select noise points
                    if isempty(obj.hROI)
                        obj.hROI = imrect(obj.hAx2);
                    else
                        disp('User-input is already enabled.')
                    end
                    
                case 'b'
                    % Go to previous cluster and reset the points in it
                    if obj.currCluster > 1
                        disp('Moving to previous cluster...')
                        obj.currCluster = obj.currCluster - 1;
                        
                        obj.outputClusters{obj.currCluster} = ...
                            obj.inputClusters{obj.currCluster};
                    else
                        disp('Cannnot go back; already at the beginning.')
                    end
            end            
            
            % Decide whether filtering is done or to move to next cluster
            numClusters = length(obj.inputClusters);
            if obj.currCluster > numClusters
                % Close the figure and report that filtering is finished
                close(obj.hFig);
            else
                % Remove highlighting of previous cluster
                delete(obj.currClusterAx1);
                delete(obj.currClusterAx2);
                
                % Move to next cluster
                obj.moveToNextCluster(obj.inputClusters);    
            end
        end
        
        function addPointsToCluster(obj)
            % Add noise points within the ROI to the current cluster
            ctr    = obj.currCluster;
            pos    = obj.hROI.getPosition();
            xCoord = pos(1);
            yCoord = pos(2);
            width  = pos(3);
            height = pos(4);
            
            noiseX  = ManualFilter.dist2pixX * obj.noise(:,1);
            noiseY  = ManualFilter.dist2pixY * obj.noise(:,2);
            filterX = noiseX >= xCoord & noiseX <= (xCoord + width);
            filterY = noiseY >= yCoord & noiseY <= (yCoord + height);

            includePts = obj.noise(filterX & filterY, :);
            obj.outputClusters{ctr} = vertcat(obj.outputClusters{ctr}, ...
                                              includePts);
        end
        
        function markPreviousCluster(obj)
        % Determine how to mark the previous cluster: blue for accepted and
        % yellow for rejected.
            if obj.keepOrReject(obj.currCluster - 1)
                marker = 'bo';
                fColor = 'blue';
            else
                marker = 'yo';
                fColor = 'yellow';
            end

            % Mark previously analyzed cluster
             plot(ManualFilter.dist2pixX * obj.CoM{obj.currCluster-1}(:,1), ...
                  ManualFilter.dist2pixY * obj.CoM{obj.currCluster-1}(:,2), ...
                  marker, ...
                  'markers', 6, ...
                  'MarkerFaceColor', fColor, ...
                  'Parent', obj.hAx1);
        end
    end
end
