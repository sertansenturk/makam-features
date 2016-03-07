function feature_cent = hz2cent(feature_hz, ref_hz)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

superObj = hz2cent@feature.PitchDistribution(feature_hz, ref_hz);

% if there are any values lower than ref_hz carry than an octave higher
superObj.X(superObj.X<0)=superObj.X(superObj.X<0) + ...
    fragmentLinker.MusicTheory.CENT_PER_OCTAVE;

% if there are any values higher than an octave higher than ref_hz carry
% than an octave lower
superObj.X(superObj.X>fragmentLinker.MusicTheory.CENT_PER_OCTAVE) = ...
    superObj.X(superObj.X>fragmentLinker.MusicTheory.CENT_PER_OCTAVE)-...
    fragmentLinker.MusicTheory.CENT_PER_OCTAVE;

[superObj.X, idx] = sort(superObj.X);
superObj.Y = superObj.Y(idx);

feature_cent = feature.PitchClassDistribution(superObj);
end