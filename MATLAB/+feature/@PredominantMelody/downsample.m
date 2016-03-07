function featureDownsampled = downsample(feature, newHopSize)
%DOWNSAMPLE Summary of this function goes here
%   Detailed explanation goes here

leap = round(newHopSize/feature.HopSize);

featureDownsampled = feature;

% downsaple Values, TimeStamps and Confidence properties
featureDownsampled.Values = downsample(feature.Values,leap);
featureDownsampled.TimeStamps = downsample(feature.TimeStamps,leap);
featureDownsampled.Confidence = downsample(feature.Confidence,leap);
end
