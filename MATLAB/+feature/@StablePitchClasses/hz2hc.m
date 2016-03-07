function feature_hc = hz2hc(feature_hz, ref_hz)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

superObj = hz2hc@feature.StablePitches(feature_hz, ref_hz);

% if there are any values lower than ref_hz carry than an octave higher
superObj.Values(superObj.Values<0)=superObj.Values(superObj.Values<0) + ...
    fragmentLinker.MusicTheory.HC_PER_OCTAVE;
superObj.Values = sort(superObj.Values);

% instantiate
feature_hc = feature.StablePitchClasses(superObj);
end