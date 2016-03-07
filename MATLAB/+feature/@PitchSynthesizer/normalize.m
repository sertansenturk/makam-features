function signal = normalize(obj, signal)
%NORMALIZE Summary of this function goes here
%   Detailed explanation goes here

signal = obj.MaxAmplitude*signal/max(signal);
end

