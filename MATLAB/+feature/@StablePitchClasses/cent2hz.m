function feature_hz = cent2hz(feature_cent)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

superObj = cent2hz@feature.StablePitches(feature_cent);

% instantiate
feature_hz = feature.StablePitchClasses(superObj);
end
