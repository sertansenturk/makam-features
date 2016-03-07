function feature_hc = cent2hc(feature_cent)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

superObj = cent2hc@feature.PitchDistribution(feature_cent);
feature_hc = feature.PitchClassDistribution(superObj);
end