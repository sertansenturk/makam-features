classdef PitchDistribution < feature.Distribution & feature.PitchFeature
    %PITCHDISTRIBUTION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        KernelWidth = feature.PitchDataPoint()
    end
    
    methods
        function obj = PitchDistribution(varargin)
            obj = obj@feature.PitchFeature();
            obj = obj@feature.Distribution();
            
            switch nargin
                case 0 % empty initialization, pass
                case 5 % pitch is given; compute
                    obj = obj.compute(varargin{:});
                case 7 % already computed
                    obj.X = varargin{1};
                    obj.Y = varargin{2};
                    obj.Unit = varargin{3};
                    obj.Step = varargin{4};
                    obj.Method = varargin{5};
                    obj.Reference = varargin{6};
                    obj.KernelWidth = varargin{7};
                otherwise
                    error('PitchDistribution:PitchDistribution',[' The '...
                        'constructor should be called with 5 or 7 inputs'])
            end
        end
        
        distFeature_shifted = shift(obj, ref)
        peaks = getPeaks(obj)
        
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
    
    methods (Static)
        distFeature = compute(pitch, step, method, refFreq, kernelWidth)
    end
end
