function deg = rad2deg(varargin)
% convert degrees to radians
%
% INPUTS
% rad: angles given in radians
% wrapBool: boolean indicating if the angles should be wrapped
% range: range to wrap (possible values: {[0 360], [-180 180]}; default: 
% [-180 180])
%
% OUTPUTS
% deg: angles converted to degrees
%
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

[rad, wrap, range] = arrArgs(varargin, nargin);
deg = rad*360/(2*pi);
if wrap
    deg = wrapAngle(deg,'degree',range);
end

function [rad, wrap, range] = arrArgs(args, n)
switch n
    case 1
        rad = args{1};
        wrap = false;
        range = [];
    case 2
        rad = args{1};
        wrap = logical(args{2});
        range = [];
    case 3
        rad = args{1};
        wrap = logical(args{2});
        range = args{3};
    otherwise
        error('Wrong number of inputs!')
end