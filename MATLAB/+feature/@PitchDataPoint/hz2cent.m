function feature_cent = hz2cent(feature_hz, refHz)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

centVal = feature.Converter.hz2cent(feature_hz.Value, refHz);
feature_cent = feature.PitchDataPoint(centVal, 'cent');

end