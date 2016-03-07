classdef Tempo < feature.Feature
    %TEMPO Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Value = []
    end
    
    properties (Abstract)
        Method
        Citation
    end
    
    methods
        function obj = Tempo(val, method, citation)
            % call superclass constructor
            obj = obj@feature.Feature();
            
            if isscalar(val)
                obj.Value = val;
            else
                error('Tempo:Value', ['The "Value" property '...
                    'should be a scalar.'])
            end
            if ischar(method)
                obj.Method = method;
            else
                error('Tempo:Method', ['The "Method" property '...
                    'should be a string indicating the method used '...
                    'to compute the relativeTempo'])
            end
            if exist('citation', 'var')
                if ischar(citation)
                    obj.Citation = citation;
                else
                    error('Tempo:Citation', ['The "Citation" property '...
                        'should be a string indicating the paper'...
                        'where the "Method" is explained.'])
                end
            end
        end
    end
end

