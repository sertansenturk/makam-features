classdef AudioFeature < feature.Feature
    %AUDIOFEATURE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Filename
        Info
    end
    
    methods 
        function obj = AudioFeature(audioFile, info)
            obj = obj@feature.Feature();
            
            if ~exist('audioFile', 'var') || isempty(info)
                obj.Filename = '';
            else
                obj.Filename = audioFile;
            end
            
            if ~exist('info', 'var') || isempty(info)
                obj.Info = struct();
            elseif isstruct(info)
                obj.Info = info;
            else
                error('AudioFeature:info',['The info input should be a '...
                    'struct'])
            end
        end
    end
end
