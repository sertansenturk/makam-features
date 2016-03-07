classdef Melody < feature.TimeSeries & feature.PitchFeature
    %MELODY Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Reference = feature.PitchDataPoint.empty()
    end
    
    methods
        function obj = Melody(varargin)
            % call superconstructor
            obj = obj@feature.PitchFeature();
            switch nargin
                case 0 % pass
                    superIn = {};
                case 1 % struct
                    superIn={varargin{1}.Values,varargin{1}.TimeStamps,...
                        varargin{1}.Unit};
                case 3
                    superIn = varargin;
                otherwise
                    error('Melody:nargin', 'Wrong number of inputs')
            end
            obj = obj@feature.TimeSeries(superIn{:});
            
            % make time stamps, values row vector
            obj.Values = obj.Values(:)';
            obj.TimeStamps = obj.TimeStamps(:)';
        end
    end
    
    methods (Access = public)
        % conversion methods inherited from the feature.PitchFeature class
        feature_hc = hz2hc(feature_hz, ref_hz)
        feature_cent = hz2cent(feature_hz, ref_hz)
        
        feature_hz = hc2hz(feature_hc)
        feature_cent = hc2cent(feature_hc)
        
        feature_hz = cent2hz(feature_cent)
        feature_hc = cent2hc(feature_cent)
    end
end