function feature_cent = hz2cent(feature_hz, ref_hz)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

vals = feature.Converter.hz2cent(feature_hz.Values, ref_hz);
reference = feature.PitchDataPoint(ref_hz,'Hz');
unit = 'cent';

% copy the object and assign the values
feature_cent = feature_hz;
feature_cent.Values = vals;
feature_cent.Reference = reference;
feature_cent.Unit = unit;
end