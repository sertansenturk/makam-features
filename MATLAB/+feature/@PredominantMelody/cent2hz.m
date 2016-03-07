function feature_hz = cent2hz(feature_cent)
%CENT2HZ Summary of this function goes here
%   Detailed explanation goes here
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

vals = feature.Converter.cent2hz(feature_cent.Values, ...
    feature_cent.Reference.Value);

% copy the object and assign the values
feature_hz = feature_cent;
feature_hz.Values = vals;
feature_hz.Reference = feature.PitchDataPoint.empty();
feature_hz.Unit = 'Hz';
end