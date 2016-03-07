function feature_hz = cent2hz(feature_cent, refFreq)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

temp = cent2hz@feature.PitchDataPoint(feature_cent, refFreq);
feature_hz = feature.Tonic(temp.Value, temp.Unit, ...
    feature_cent.OctaveWrapped, feature_cent.Method,feature_cent.Citation);
end