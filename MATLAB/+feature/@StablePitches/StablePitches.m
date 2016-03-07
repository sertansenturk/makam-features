classdef StablePitches < feature.DistributionPeaks & feature.PitchFeature
    %STABLEPITCHES Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = StablePitches(varargin)
            % get superconstructor inputs
            switch nargin
                case 0 % default initialization;call superclass constructor
                    % w/o inputs
                    superIn = {};
                case 1 % PitchDistribution or superclass given; call
                    % superclass constructor w/o inputs
                    superIn = {};
                case 2 %
                    superIn = {};
                case 4 % all the parameters are given; use them to call the
                    % constructor of the super class
                    superIn = varargin(1:4);
                otherwise
                    error('StablePitches:nargin', ['Wrong number of'...
                        'inputs'])
            end
            
            % call superconstructor
            obj = obj@feature.DistributionPeaks(superIn{:});
            
            % add the other parameters
            switch nargin
                case 0 % pass
                case 1 % compute from pitch distribution
                    if isa(varargin{1}, 'feature.DistributionPeaks')
                        % cast from super constructor
                        obj.Values = varargin{1}.Values;
                        obj.Unit = varargin{1}.Unit;
                        obj.DistributionMethod=varargin{1}.DistributionMethod;
                        obj.Reference = varargin{1}.Reference;
                    elseif isa(varargin{1}, 'feature.PitchDistribution')
                        obj = varargin{1}.getPeaks();
                    elseif isa(varargin{1}, 'feature.PitchClassDistribution')
                        error('StablePitches:StablePitches', ['The input '...
                            'feature is a pitch class distribution. Use '...
                            'feature.StablePitchClasses class instead.'])
                    else
                        error('StablePitches:StablePitches','Unknown input')
                    end
                case 4 %pass
            end
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
