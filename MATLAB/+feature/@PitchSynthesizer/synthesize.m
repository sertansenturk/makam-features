function [signal, fs] = synthesize(obj, melody)
%SYNTH Summary of this function goes here
%   Detailed explanation goes here

%% define the harmonics according to the type
nn = obj.Harmonic_idx;

%% get the pitch values and hold-interpolate
vals = melody.Values;
vals(isnan(vals)) = 0;
time = melody.TimeStamps;

%% sampling frequency
if isempty(obj.Fs); 
    if obj.Verbose;
        disp(['Automatically assigning the sampling frequency wrt the '...
            'pitch values.'])
    end
    obj = obj.setFs(vals); 
else
    if obj.Verbose; 
        obj.checkFs(vals); 
    end; 
end

%% interpolate to match the given sampling frequency
if obj.Verbose
    disp('Resampling the pitch values according to the sampling frequency.')
end
newTime = time(1):1/obj.Fs:time(end);
newVals = interp1(time, vals, newTime, 'nearest');

%% create the signal
if obj.Verbose
    disp('Generating the signal.')
end
phases = 2*pi*nn/obj.Fs*cumsum(newVals);
components = sin(phases);
components = bsxfun(@rdivide, components, nn);
signal = mean(components, 1);

%% normalize
if obj.Verbose
    disp('Amplitude normalization.')
end
signal = obj.normalize(signal);

%% fade-in / fade-out
if obj.Verbose
    disp('Adding faders.')
end
signal = obj.fade(signal, newVals);
fs = obj.Fs;
end
