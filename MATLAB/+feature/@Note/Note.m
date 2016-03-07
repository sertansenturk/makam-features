classdef Note < feature.NoteSymbol
    %NOTE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        IndexInScore = []
        IndexInAudio = []
        Interval = []
        Label = ''
        TheoreticalPitch = feature.PitchDataPoint()
        PerformedPitch = feature.PitchDataPoint()
        PitchTrajectory = feature.PredominantMelody()
    end
    
    methods
        function obj = Note(symbol, indexInScore, indexInAudio, ...
                interval, label, theoreticalpitch, performedpitch,...
                pitchtrajectory)
            if exist('symbol', 'var'); obj.Symbol = symbol; end
            if exist('indexInScore', 'var'); obj.IndexInScore = indexInScore; end
            if exist('indexInAudio', 'var'); obj.IndexInAudio = indexInAudio; end
            if exist('interval', 'var'); obj.Interval = interval; end
            if exist('label', 'var'); obj.Label = label; end
            if exist('theoreticalpitch', 'var'); obj.TheoreticalPitch = theoreticalpitch; end
            if exist('performedpitch', 'var'); obj.PerformedPitch = performedpitch; end
            if exist('pitchtrajectory', 'var'); obj.PitchTrajectory = pitchtrajectory; end
        end
    end
end

