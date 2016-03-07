classdef AverageTempo < feature.Tempo
    %AVERAGETEMPO Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        BeatUnit = []
        Method = ''
        Citation = ''
    end
    
    properties (Constant)
        Unit = 'bpm'
    end
    
    methods
        function obj = AverageTempo(val, beatUnit, method, reference)
            if ~exist('method','var'); method = '';end
            if ~exist('reference','var'); reference = '';end
            obj = obj@feature.Tempo(val, method, reference);
            if isstruct(beatUnit) && all(strcmp(sort(fieldnames(beatUnit)),...
                    {'type'; 'value'}))
                obj.BeatUnit = beatUnit;
            else
                error('AverageTempo:BeatUnit', ['The "BeatUnit" '...
                    'property should be a struct with the fields "type" '...
                    'and "value," where "type" indicates the beat type '...
                    '(e.g. "note") and "value" indicates its value '...
                    '(e.g. "4"th note).'])
            end
        end
    end
end

