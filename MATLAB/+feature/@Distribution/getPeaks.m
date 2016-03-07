function peaks = getPeaks(distFeature)
%GETPEAKS Summary of this function goes here
%   Detailed explanation goes here

x = distFeature.X;
y = distFeature.Y;

%% dummy shift to start from a minima, so we dont lose a peak at the border
% (if the distribution is wrapped, e.g. pich class distribution)
[~, idx_dummy] = min(y);

%% find the peaks
y_dummy = [y(idx_dummy:end) y(1:idx_dummy-1)];
[~, locs_dummy] = findpeaks(y_dummy, 'minpeakheight', max(y_dummy)*0.05);
locInds = mod(locs_dummy + idx_dummy - 1, length(x));
locInds(locInds==0) = length(y);

locInds = sort(locInds);
peakLocs = x(locInds);

%% create the object
peaks = feature.DistributionPeaks(peakLocs, distFeature.Unit, ...
    distFeature.Method, distFeature.Reference);