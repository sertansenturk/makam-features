classdef TimeSeries < feature.Feature
    %TIMESERIES Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Values = []
        TimeStamps = []
        Unit = ''
    end
    
    methods
        function obj = TimeSeries(value, timeStamps, unit)
            obj = obj@feature.Feature();
            switch nargin
                case 0 %pass
                case 3
                    obj.Values = value;
                    obj.TimeStamps = timeStamps;
                    obj.Unit = unit;
                otherwise
                    error('TimeSeries:nargin', 'Wrong number of inputs')
            end
        end
        
        featureInInterval = getTimeInterval(feature, interval)
        plot(feature, yLabel, titleStr, style)
    end
end
