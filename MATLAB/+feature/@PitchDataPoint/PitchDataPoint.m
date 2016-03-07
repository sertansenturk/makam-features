classdef PitchDataPoint < feature.DataPoint & feature.PitchFeature
    %PITCHDATAPOINT Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = PitchDataPoint(varargin)
            % call superconstructor
            obj = obj@feature.PitchFeature();
            switch nargin
                case 0 % pass
                    superIn = {};
                case 1 % struct
                    superIn = varargin;
                case 2
                    superIn = {varargin{1},varargin{2}};
                otherwise
                    error('PitchDataPoint:nargin','Wrong number of inputs')
            end
            obj = obj@feature.DataPoint(superIn{:});
        end
    end
    
    methods (Access = public)
        % conversion methods inherited from the feature.PitchFeature class
        feature_hc = hz2hc(feature_hz, ref_hz)
        feature_cent = hz2cent(feature_hz, ref_hz)
        
        feature_hz = hc2hz(feature_hc,ref_hz)
        feature_cent = hc2cent(feature_hc)
        
        feature_hz = cent2hz(feature_cent,ref_hz)
        feature_hc = cent2hc(feature_cent)
    end
end

