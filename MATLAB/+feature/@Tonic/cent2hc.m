function feature_hc = cent2hc(feature_cent)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

temp = cent2hc@feature.PitchDataPoint(feature_cent);
feature_hc = feature.Tonic(temp.Value, temp.Unit, ...
    feature_cent.OctaveWrapped, feature_cent.Method,feature_cent.Citation);
end