function feature_hc = hz2hc(feature_hz, refHz)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

temp = hz2hc@feature.PitchDataPoint(feature_hz, refHz);
feature_hc = feature.Tonic(temp.Value, temp.Unit, ...
    feature_hz.OctaveWrapped, feature_hz.Method, feature_hz.Citation);
end