function feature_cent = hz2cent(feature_hz, ref_hz)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

vals = feature.Converter.hz2cent(feature_hz.Values, ref_hz);
reference = feature.PitchDataPoint(ref_hz,'Hz');
unit = 'cent';

% instantiate
feature_cent = feature.StablePitches(vals, unit, feature_hz...
    .DistributionMethod, reference);

end