function feature_hc = hz2hc(feature_hz, ref_hz)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

vals = feature.Converter.hz2hc(feature_hz.Values, ref_hz);
reference = feature.PitchDataPoint(ref_hz,'Hz');
unit = 'hc';

% instantiate
feature_hc = feature.StablePitches(vals, unit, feature_hz...
    .DistributionMethod, reference);

end