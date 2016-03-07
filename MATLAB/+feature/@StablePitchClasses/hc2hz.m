function feature_hz = hc2hz(feature_hc)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

superObj = hc2hz@feature.StablePitches(feature_hc);

% instantiate
feature_hz = feature.StablePitchClasses(superObj);
end