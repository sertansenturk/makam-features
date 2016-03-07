classdef DistributionPeaks < feature.Feature
    %DISTRIBUTIONPEAKS Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Values = []
        Unit = ''
        DistributionMethod = ''
        Reference = feature.DataPoint
    end
    
    methods
        function obj = DistributionPeaks(values, unit, ...
                distributionMethod, reference)
            obj = obj@feature.Feature();
            
            switch nargin
                case 0 % pass
                case 4
                    obj.Values = values;
                    obj.Unit = unit;
                    obj.DistributionMethod = distributionMethod;
                    obj.Reference = reference;
                otherwise
                    error('DistributionPeaks:DistributionPeaks', ...
                        ['The class needs 0 (default values) or 4 '...
                        'inputs to instantiate'])
            end
        end
    end
end

