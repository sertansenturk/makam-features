function feature_hc = cent2hc(feature_cent)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

superObj = cent2hc@feature.StablePitches(feature_cent);

% instantiate
feature_hc = feature.StablePitchClasses(superObj);
end
