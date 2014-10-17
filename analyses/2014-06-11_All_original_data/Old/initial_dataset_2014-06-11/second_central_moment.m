function M2 = second_central_moment(X)
% second_central_moment Determines the second central moment of an array.
%
% M2 = second_central_moment(X) returns the second central moment of the
% data in the columns of the array X.
%
% $AUTHOR: Kyle M. Douglass $ $DATE: 2014/07/29 $ $REVISION: 0.1 $
% 
    N = size(X,1);
    Xbar = mean(X);
    M2 = sum((X - repmat(Xbar, N, 1)).^2) / N;
end
