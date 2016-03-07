function feature_hz = cent2hz(feature_cent, refHz)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

hzVal = feature.Converter.cent2hz(feature_cent.Value, refHz);
feature_hz = feature.PitchDataPoint(hzVal, 'Hz');

end