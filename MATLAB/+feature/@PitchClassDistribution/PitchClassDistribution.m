classdef PitchClassDistribution < feature.PitchDistribution
    %PITCHCLASSDISTRIBUTION Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        % defined in feature.PitchDistribution
    end
    
    methods
        function obj = PitchClassDistribution(varargin)
            % superclass constructor inputs
            if nargin == 1 && isa(varargin{1}, 'feature.PitchDistribution')
                superIn = {};
            else
                superIn = varargin;
            end
            obj = obj@feature.PitchDistribution(superIn{:});
            
            %% property assingment
            if nargin == 1 && isa(varargin{1}, 'feature.PitchDistribution')
                % cast from the superclass
                obj.KernelWidth = varargin{1}.KernelWidth;
                obj.X = varargin{1}.X;
                obj.Y = varargin{1}.Y;
                obj.Unit = varargin{1}.Unit;
                obj.Step = varargin{1}.Step;
                obj.Method = varargin{1}.Method;
                obj.Reference = varargin{1}.Reference;
            else
                % pass
            end
            
            %% value checking
            switch obj.Unit
                case 'hc'
                    octave = [0 fragmentLinker.MusicTheory.HC_PER_OCTAVE];
                    x = obj.X;
                case 'cent'
                    octave = [0 fragmentLinker.MusicTheory.CENT_PER_OCTAVE];
                    x = obj.X;
                case 'Hz'
                    octave = [0 fragmentLinker.MusicTheory.CENT_PER_OCTAVE];
                    x = [0 feature.Converter.hz2cent(obj.X,...
                        min(obj.X))];
                otherwise
                    error('PitchClassDistribution:unit', 'Unknown unit')
            end
            
            if any((x < octave(1)) | (x > octave(2)))
                error('PitchClassDistribution:x', ['The pitch values '...
                    'stored in property "x" spans to more than an octave'])
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
        distFeature_octaveWrapped = octaveWrap(distFeature)
        distFeature = compute(pitch, step, varargin)
    end
end