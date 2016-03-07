function feature_hc = cent2hc(feature_cent)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

vals = feature.Converter.cent2hc(feature_cent.Values);
unit = 'hc';

% instantiate
feature_hc = feature.StablePitches(vals, unit, feature_cent...
    .DistributionMethod,feature_cent.Reference);

end
