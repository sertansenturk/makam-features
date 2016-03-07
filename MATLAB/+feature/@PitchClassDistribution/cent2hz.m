function feature_hz = cent2hz(feature_cent)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

superObj = cent2hz@feature.PitchDistribution(feature_cent);
feature_hz = feature.PitchClassDistribution(superObj);
end