function feature_cent = hc2cent(feature_hc)
%HC2CENT Summary of this function goes here
%   Detailed explanation goes here
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

vals = feature.Converter.hc2cent(feature_hc.Values);

% copy the object and assign the values
feature_cent = feature_hc;
feature_cent.Values = vals;
end