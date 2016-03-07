classdef DataPoint < feature.Feature
    %DATAPOINT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Value = []
        Unit = ''
    end
    
    methods
        function obj = DataPoint(varargin)
            obj = obj@feature.Feature();
            switch nargin
                case 0 % pass
                case 1 % struct
                    obj.Value = varargin{1}.Value;
                    obj.Unit = varargin{1}.Unit;
                case 2
                    obj.Value = varargin{1};
                    obj.Unit = varargin{2};
                otherwise
                    error('DataPoint:nargin', 'Wrong number of inputs')
            end
        end
    end
end

