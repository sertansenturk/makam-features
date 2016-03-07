classdef StablePitchClasses < feature.StablePitches
    %STABLEPITCHCLASSES Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
    end
    
    methods
        function obj = StablePitchClasses(varargin)
            % superclass constructor inputs
            if nargin == 1 && isa(varargin{1}, 'feature.StablePitches')
                superIn = {};
            else
                superIn = varargin;
            end
            obj = obj@feature.StablePitches(superIn{:});
            
            %% property assingment
            if nargin == 1 && isa(varargin{1}, 'feature.StablePitches')
                % cast from the superclass
                obj.Values = varargin{1}.Values;
                obj.Unit = varargin{1}.Unit;
                obj.DistributionMethod = varargin{1}.DistributionMethod;
                obj.Reference = varargin{1}.Reference;
            else
                % pass
            end
            
            %% value checking
            switch obj.Unit
                case 'hc'
                    octave = [0 fragmentLinker.MusicTheory.HC_PER_OCTAVE];
                    vals = obj.Values;
                case 'cent'
                    octave = [0 fragmentLinker.MusicTheory.CENT_PER_OCTAVE];
                    vals = obj.Values;
                case 'Hz'
                    octave = [0 fragmentLinker.MusicTheory.CENT_PER_OCTAVE];
                    vals = feature.Converter.hz2cent(obj.Values,...
                        min(obj.Values));
                otherwise
                    error('StablePitchClasses:unit', 'Unknown unit')
            end
            
            if any((vals < octave(1)) | (vals > octave(2)))
                error('StablePitchClasses:X', ['The pitch values '...
                    'stored in property "X" spans to more than an octave'])
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

