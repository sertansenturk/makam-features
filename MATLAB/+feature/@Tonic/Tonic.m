classdef Tonic < feature.PitchDataPoint & feature.NoteSymbol
    %TONIC Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        OctaveWrapped = false
        Method = ''
        Citation = ''
    end
    
    methods
        function obj = Tonic(varargin)
            % call superconstructor
            switch nargin
                case 0 % pass
                    superInPitchData = {};
                    superInNoteSymbol = {};
                case 1 % struct
                    superInPitchData = {varargin{1}.Value, varargin{1}.Unit};
                    superInNoteSymbol = {varargin{1}.Symbol};
                case 6
                    superInPitchData = varargin(1:2);
                    superInNoteSymbol = varargin(3);
                otherwise
                    error('Tonic:nargin', 'Wrong number of inputs')
            end
            obj = obj@feature.PitchDataPoint(superInPitchData{:});
            obj = obj@feature.NoteSymbol(superInNoteSymbol{:});
            
            % instantiate
            switch nargin
                case 0 % pass
                case 1 % struct input
                    obj.OctaveWrapped = varargin{1}.OctaveWrapped;
                    obj.Method = varargin{1}.Method;
                    obj.Citation = varargin{1}.Citation;
                case 5
                    obj.OctaveWrapped = varargin{4};
                    obj.Method = varargin{5};
                    obj.Citation = varargin{6};
            end
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

