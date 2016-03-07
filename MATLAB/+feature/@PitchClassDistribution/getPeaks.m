function peaks = getPeaks(distFeature)
%GETPEAKS Summary of this function goes here
%   Detailed explanation goes here

peaksSuperObj = getPeaks@feature.Distribution(distFeature);

% instantiate subclass from super
peaks = feature.StablePitchClasses(peaksSuperObj);
end