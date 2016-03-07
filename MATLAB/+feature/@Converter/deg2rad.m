function rad = deg2rad(varargin)
% convert degrees to radians
%
% INPUTS
% deg: angles given in degrees
% wrapBool: boolean indicating if the angles should be wrapped
% range: range to wrap (possible values: {[0 2*pi], [-pi pi]}; default: 
% [-pi pi])
%
% OUTPUTS
% rad: angles converted to radians
%
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

[deg, wrap, range] = arrArgs(varargin, nargin);
rad = deg*2*pi/360;
if wrap
    rad = wrapAngle(rad,'radian',range);
end

function [deg, wrap, range] = arrArgs(args, n)
switch n
    case 1
        deg = args{1};
        wrap = false;
        range = [];
    case 2
        deg = args{1};
        wrap = logical(args{2});
        range = [];
    case 3
        deg = args{1};
        wrap = logical(args{2});
        range = args{3};
    otherwise
        error('Wrong number of inputs!')
end