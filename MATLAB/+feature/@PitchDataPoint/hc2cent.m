function feature_cent = hc2cent(feature_hc)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

centVal = feature.Converter.hc2cent(feature_hc.Value);
feature_cent = feature.PitchDataPoint(centVal, 'cent');

end