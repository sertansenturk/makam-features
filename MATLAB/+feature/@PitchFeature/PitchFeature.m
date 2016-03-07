classdef PitchFeature < feature.Feature
    %PITCHFEATURE Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = PitchFeature()
            obj = obj@feature.Feature();
        end
    end
    
    methods (Access = public, Abstract)
        feature_hc = hz2hc(feature_hz,ref_hz)
        feature_cent = hz2cent(feature_hz,ref_hz)
        
        feature_hz = hc2hz(feature_hc,ref_hz)
        feature_cent = hc2cent(feature_hc)
        
        feature_hz = cent2hz(feature_cent,ref_hz)
        feature_hc = cent2hc(feature_cent)
    end
end