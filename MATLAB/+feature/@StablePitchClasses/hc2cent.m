function feature_cent = hc2cent(feature_hc)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

superObj = cent2hc@feature.StablePitches(feature_hc);

% instantiate
feature_cent = feature.StablePitchClasses(superObj);
end
