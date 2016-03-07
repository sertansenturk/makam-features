function distFeature_shifted = shift(distFeature, ref)
%SHIFT Summary of this function goes here
%   Detailed explanation goes here

%% non-circular shift
distFeature_shifted = shift@feature.PitchDistribution(distFeature, ref);

%% circular-move to [0 octave]
switch distFeature_shifted.Unit
    case 'cent'
        x = mod(distFeature_shifted.X, ...
            fragmentLinker.MusicTheory.CENT_PER_OCTAVE);
    case 'hc'
        x = mod(distFeature_shifted.X, ...
            fragmentLinker.MusicTheory.HC_PER_OCTAVE);
end

[distFeature_shifted.X, idx] = sort(x);
distFeature_shifted.Y = distFeature_shifted.Y(idx);
