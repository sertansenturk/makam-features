classdef Distribution < feature.Feature
    %DISTRIBUTION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        X = []
        Y = []
        Unit = ''
        Step = feature.DataPoint()
        Method = ''
        Reference = feature.DataPoint()
    end
    
    methods
        function obj = Distribution()
            obj = obj@feature.Feature();
        end
        
        peaks = getPeaks(obj)
        plot(distribution, peaks, titleStr, style)
    end
end