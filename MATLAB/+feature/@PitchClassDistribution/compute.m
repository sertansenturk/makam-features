function pitchClassDistribution=compute(pitch,step,method,varargin)
%COMPUTEDISTRIBUTION Summary of this function goes here
%   Detailed explanation goes here

pitchDistribution = compute@feature.PitchDistribution(pitch,step,method,...
    varargin{:});

%% octave wrap
pitchClassDistribution = feature.PitchClassDistribution.octaveWrap(...
    pitchDistribution);
end