function feature_cent = hc2cent(feature_hc)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

vals = feature.Converter.hc2cent(feature_hc.Values);
unit = 'cent';

% instantiate
feature_cent = feature.StablePitches(vals, unit, feature_hc...
    .DistributionMethod, feature_hc.Reference);

end
