function distFeature_wrapped = octaveWrap(distFeature)
%OCTAVEWRAP Summary of this function goes here
%   Detailed explanation goes here
CENTS_PER_OCTAVE = fragmentLinker.MusicTheory.CENT_PER_OCTAVE;

%% octave wrap
xw = mod(distFeature.X, CENTS_PER_OCTAVE);

X = 0: distFeature.Step.Value: CENTS_PER_OCTAVE - distFeature.Step.Value;
Y = arrayfun(@(h) sum(distFeature.Y(xw == h)), X);

%% instantiate a pitch class distribution object
distFeature_wrapped=feature.PitchClassDistribution(X,Y,distFeature.Unit,...
    distFeature.Step, distFeature.Method, distFeature.Reference, ...
    distFeature.KernelWidth);
end
