function feature_hz = hc2hz(feature_hc)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

vals = feature.Converter.hc2hz(feature_hc.Values, ...
    feature_hc.Reference.Value);
reference = feature.PitchDataPoint.empty(); % converted to hz, no reference
unit = 'Hz';

% instantiate
feature_hz = feature.StablePitches(vals, unit, feature_hc...
    .DistributionMethod, reference);
end