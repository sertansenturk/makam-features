classdef ScoreFeature < feature.Feature
    %SCOREFEATURE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Filename
        Info
    end
    
    methods
        function obj = ScoreFeature(scoreFile, info)
            obj = obj@feature.Feature();
            
            if ~exist('scoreFile', 'var') || isempty(info)
                obj.Filename = '';
            else
                obj.Filename = scoreFile;
            end
            
            if ~exist('info', 'var') || isempty(info)
                obj.Info = struct();
            elseif isstruct(info)
                obj.Info = info;
            else
                error('ScoreFeature:info',['The info input should be a '...
                    'struct'])
            end
        end
    end
end
