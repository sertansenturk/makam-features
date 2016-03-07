function feature_hc = hz2hc(feature_hz, ref_hz)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

superObj = hz2hc@feature.PitchDistribution(feature_hz, ref_hz);

% if there are any values lower than ref_hz carry than an octave higher
superObj.X(superObj.X<0)=superObj.X(superObj.X<0) + ...
    fragmentLinker.MusicTheory.HC_PER_OCTAVE;
[superObj.X, idx] = sort(superObj.X);
superObj.Y = superObj.Y(idx);

feature_hc = feature.PitchClassDistribution(superObj);
end