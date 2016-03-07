function feature_cent = hz2cent(feature_hz, ref_hz)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

superObj = hz2cent@feature.StablePitches(feature_hz, ref_hz);

% if there are any values lower than ref_hz carry than an octave higher
superObj.Values(superObj.Values<0)=superObj.Values(superObj.Values<0) + ...
    fragmentLinker.MusicTheory.CENT_PER_OCTAVE;
superObj.Values = sort(superObj.Values);

% if there are any values higher than an octave higher than ref_hz carry
% them an octave lower
superObj.Values(superObj.Values>fragmentLinker.MusicTheory.CENT_PER_OCTAVE)=...
    superObj.Values(superObj.Values>fragmentLinker.MusicTheory.CENT_PER_OCTAVE)-...
    fragmentLinker.MusicTheory.CENT_PER_OCTAVE;

% instantiate
feature_cent = feature.StablePitchClasses(superObj);
end