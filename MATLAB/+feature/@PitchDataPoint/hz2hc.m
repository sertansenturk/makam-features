function feature_hc = hz2hc(feature_hz, refHz)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

hcVal = feature.Converter.hz2hc(feature_hz.Value, refHz);
feature_hc = feature.PitchDataPoint(hcVal, 'hc');

end