function feature_hc = hz2hc(feature_hz, ref_hz)
%HZ2HC Summary of this function goes here
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

vals = feature.Converter.hz2hc(feature_hz.Values, ref_hz);
reference = feature.PitchDataPoint(ref_hz,'Hz');
unit = 'hc';

% copy the object and assign the values
feature_hc = feature_hz;
feature_hc.Values = vals;
feature_hc.Reference = reference;
feature_hc.Unit = unit;
end