function feature_hz = hc2hz(feature_hc, refFreq)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

temp = hc2hz@feature.PitchDataPoint(feature_hc, refFreq);
feature_hz = feature.Tonic(temp.Value, temp.Unit, ...
    feature_hc.OctaveWrapped, feature_hc.Method, feature_hc.Citation);
end