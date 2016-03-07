function signal = fade(obj, signal, pitchVals)
%FADE Summary of this function goes here
%   Detailed explanation goes here

%% get the silent intervals
silence = isnan(pitchVals) | (pitchVals == 0);
signal(silence) = 0;

silenceChange = diff([silence(1) silence]);
silStart = [find(silenceChange==1) length(silenceChange)];
silEnd = [1 find(silenceChange == -1)];

%% create fader vector
fader = obj.Fader();
fadeLen = numel(fader);

%% fade-in
for k = 1:numel(silEnd)
    signal(silEnd(k):min([silEnd(k)+fadeLen-1 numel(signal)])) = ...
        signal(silEnd(k):min([silEnd(k)+fadeLen-1 numel(signal)])) .* ...
        fader(1:min([fadeLen numel(signal)-silEnd(k)+1]));
end

%% fade-out
fader = fliplr(fader);
for k = 1:numel(silStart)
    signal(max([silStart(k)-fadeLen+1 1]):silStart(k)) = ...
        signal(max([silStart(k)-fadeLen+1 1]):silStart(k)) .* ...
        fader(end-silStart(k)+max([silStart(k)-fadeLen+1 1]):end);
end
end
