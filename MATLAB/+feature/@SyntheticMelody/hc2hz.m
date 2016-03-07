function feature_hz = hc2hz(feature_hc)
%HC2HZ Summary of this function goes here
%   Detailed explanation goes here
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

switch feature_cent.Reference.Unit
    case 'symbolic_notation'
        error('TODO')
    case 'Hz'
        %pass
    otherwise
        error('cent2hz:reference', 'Unknown reference')
end

vals = feature.Converter.hc2hz(feature_hc.Values, ...
    feature_hc.Reference.Value);

% copy the object and assign the values
feature_hz = feature_hc;
feature_hz.Values = vals;
feature_hz.Reference = feature.PitchDataPoint.empty();
feature_hz.Unit = 'Hz';
end