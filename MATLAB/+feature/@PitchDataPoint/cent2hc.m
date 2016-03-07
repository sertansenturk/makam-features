function feature_hc = cent2hc(feature_cent)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

hcVal = feature.Converter.cent2hc(feature_cent.Value);
feature_hc = feature.PitchDataPoint(hcVal, 'hc');

end