function pitchDistribution = compute(pitch,step,method,refFreq,kernelWidth)
%COMPUTEDISTRIBUTION Summary of this function goes here
%   Detailed explanation goes here

%% error checking
names = fieldnames(pitch);
if ~any(strcmpi('timeStamps', names))
    error('downsample:NoTimeStamps',['The feature does not have a '...
        'timeStamps field. Please check whether the feature is temporal '...
        'and/or compute the timeStamps.'])
end

%% Default values
if ~exist('refFreq', 'var') || isempty(refFreq)
    refFreq = 261.63; % dummy frequency to convert hz values to cent
end

%% get the pitch track
pitchVals = pitch.Values;

% convert units to cent
if strcmpi(pitch.Unit, 'Hz')
    pitchVals = pitchVals(pitchVals > 20); % remove the inaudible values
    pitchVals = feature.Converter.hz2cent(pitchVals, refFreq);
    reference = feature.PitchDataPoint(refFreq, 'Hz');
elseif strcmpi(pitch.Unit, 'cent')
    reference = pitch.Reference;
end

pitchVals = pitchVals(~isnan(pitchVals)); % remove nan's

%% compute the x ticks
switch method
    case 'kernelDensity'
        tol = 5*kernelWidth.Value; % 3 sigma=3 kernelwidth is enough, we
        % make it 5
        remX = mod(min(pitchVals) - tol, step.Value); % ensure the x indices does not
        % have an offset (for easier indexing)
        
        x = min(pitchVals) - tol - remX: step.Value: max(pitchVals) + tol;
    case 'histogram'
        remX = mod(min(pitchVals), step.Value); % ensure the x indices does
        % not have an offset (for easier indexing)
        x = min(pitchVals) - remX: step.Value: max(pitchVals);
end

%% get the distribution
switch method
    case 'kernelDensity'
        y = ksdensity(pitchVals, x, 'width', kernelWidth.Value);
    case 'histogram'
        y = hist(pitchVals, x);
        kernelWidth = nan; % invalid parameter
end

%% create the object
pitchDistribution = feature.PitchDistribution(x,y,'cent',step,method,...
    reference,kernelWidth);
