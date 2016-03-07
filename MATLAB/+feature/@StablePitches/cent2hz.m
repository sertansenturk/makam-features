function feature_hz = cent2hz(feature_cent)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

vals = feature.Converter.cent2hz(feature_cent.Values, ...
    feature_cent.Reference.Value);
reference = feature.PitchDataPoint.empty(); % converted to hz, no reference
unit = 'Hz';

% instantiate
feature_hz = feature.StablePitches(vals, unit, feature_cent...
    .DistributionMethod, reference);
end
