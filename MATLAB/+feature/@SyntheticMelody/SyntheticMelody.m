classdef SyntheticMelody < feature.ScoreFeature & feature.Melody
    %SYNTHETICMELODY Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Fs
    end
    
    methods
        function obj = SyntheticMelody(varargin)
            % call superconstructor
            switch nargin
                case 0 % pass
                    superIn1 = {};
                    superIn2 = {};
                case 7
                    superIn1=varargin(1:3);
                    superIn2=varargin(end-1:end);
                otherwise
                    error('PredominantMelody:nargin', ...
                        'Wrong number of inputs')
            end
            obj = obj@feature.Melody(superIn1{:});
            obj = obj@feature.ScoreFeature(superIn2{:});
            
            % instantiate
            switch nargin
                case 0 % pass
                case 7
                    obj.Reference = varargin{4};
                    obj.Fs = varargin{5};
            end
        end
    end
    
    methods (Access = public)
        % conversion methods inherited from the feature.PitchFeature class
        feature_hc = hz2hc(feature_hz, ref_hz)
        feature_cent = hz2cent(feature_hz, ref_hz)
        
        feature_hz = hc2hz(feature_hc)
        feature_hz = cent2hz(feature_cent)
        % cent2hc and hc2cent are implemented in feature.Melody class
    end
    
    methods (Static)
        syntheticMelody = compute(score, fs, relativeTempo)
    end
end