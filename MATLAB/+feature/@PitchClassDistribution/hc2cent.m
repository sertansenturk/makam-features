function feature_cent = hc2cent(feature_hc)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

superObj = hc2cent@feature.PitchDistribution(feature_hc);
feature_cent = feature.PitchClassDistribution(superObj);
end