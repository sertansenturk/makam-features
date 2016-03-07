function feature_hc = cent2hc(feature_cent)
%CENT2HC Summary of this function goes here
%   Detailed explanation goes here
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

vals = feature.Converter.cent2hc(feature_cent.Values);

% copy the object and assign the values
feature_hc = feature_cent;
feature_hc.Values = vals;
end