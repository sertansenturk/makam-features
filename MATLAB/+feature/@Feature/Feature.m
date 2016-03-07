classdef Feature
    %Feature feature object
    %
    
    properties
        Info
    end    
    
    methods (Static)
        feature = read(path, format)
    end
    
    methods
        function obj = Feature()
            % pass
        end
        
        st = obj2struct(obj) % convert to struct for easier saving
    end
end