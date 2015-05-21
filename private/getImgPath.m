% Returns the path to a widefield image
%
% [imgPath] = getImgPath(fileName) takes a string to a particular
% localization file and returns the string containing the path to its
% corresponding image.
%
% [imgPath] = getImgPath(fileName, delimiter) does the same thing, but
% allows you to specify the delimiter that separates folders. By default,
% the Linux forward slash ('/') is used, but backslash ('\') should be used
% on Windows.
%
% % [imgPath] = getImgPath(fileName, delimiter, fileType) does the same
% thing, but works for none .txt files. Be default, this function works
% with files ending in .txt format.
%
% Parameters
% ----------
% fileName  : string
%     Full path to the desired localization file.
% delimiter : string (optional, default: '/')
%     Character separating files in the path.
% fileType  : string (optional, default: '.txt')
%     The string denoting the file type of the localization file.
%
% Returns
% -------
% imgPath   : string
%     The full path and name of the corresponding image. Returns an empty
%     string if no image is found.
%
% Notes
% -----
% This relies on one having followed the directory and
% naming convention established for the telomere localization data
% organization.
%
% AUTHOR: Kyle M. Douglass
% DATE:   May 20, 2015

function [imgPath] = getImgPath(fileName, varargin)
defDelimiter = '/';
defFileType  = '.txt';

if length(varargin) == 0
    delimiter = defDelimiter;
    fileType  = defFileType;
elseif length(varargin) == 1;
    delimiter = varargin{1};
    fileType  = defFileType;
else
    delimiter = varargin{1};
    fileType  = varargin{2};
end


% Obtain just the image file name, not the full path to it. If using Linux,
% the delimiter is '/'; on Windows it's '\'.
fileNameSplit = strsplit(fileName, delimiter);

% Remove the .txt extension and add the .jp2 (JPEG-2000) extension
fileNameImgSplit = [fileNameSplit{end}(1:end-length(fileType)) '.jp2'];

% Rejoin parts leading to the full path, without the folder
% 'Molecule_Lists'.
imgPath = strjoin([fileNameSplit(1:end-2), {fileNameImgSplit}], '/');

end