function feature_hz = hc2hz(feature_hc, refFreq)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

hzVal = feature.Converter.hc2hz(feature_hc.Value, refFreq);
feature_hz = feature.PitchDataPoint(hzVal, 'Hz');

end