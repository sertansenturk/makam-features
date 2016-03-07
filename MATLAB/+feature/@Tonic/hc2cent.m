function feature_cent = hc2cent(feature_hc)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

temp = hc2cent@feature.PitchDataPoint(feature_hc);
feature_cent = feature.Tonic(temp.Value, temp.Unit, ...
    feature_hc.OctaveWrapped, feature_hc.Method, feature_hc.Citation);

end