classdef PredominantMelody < feature.AudioFeature & feature.Melody
    %PROMINENTMELODY Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Confidence
    end
    
    properties (Dependent)
        Fs
        HopSize
    end
    
    methods
        function obj = PredominantMelody(varargin)
            % call superconstructors
            switch nargin
                case 0 % pass
                    superIn1 = {};
                    superIn2 = {};
                case 1 % struct
                    fields = fieldnames(varargin{1});
                    
                    if ismember('pitch', fields) %pycompmusic
                        superIn1={varargin{1}.pitch(:,2),...
                            varargin{1}.pitch(:,1), varargin{1}.pitchUnit};
                        if ismember('peakDistributionThreshold', fields) % makampitch
                            superIn2={varargin{1}.source,...
                                struct('PeakDistributionThreshold', ...
                                varargin{1}.peakDistributionThreshold,...
                                'AudioFs', double(varargin{1}.sampleRate), ...
                                'Algorithm', varargin{1}.slug, ...
                                'Version', varargin{1}.version,...
                                'EssentiaVersion', varargin{1}.essentiaVersion,...
                                'FrameSize', varargin{1}.frameSize,...
                                'BinResolution', feature.PitchDataPoint(...
                                double(varargin{1}.binResolution), 'cent'),...
                                'Citation', varargin{1}.citation)};
                        else % varnam
                            superIn2={varargin{1}.source,...
                                struct('AudioFs', double(varargin{1}.sampleRate), ...
                                'Algorithm', varargin{1}.algorithm, ...
                                'FrameSize', varargin{1}.frameSize,...
                                'BinResolution', feature.PitchDataPoint(...
                                double(varargin{1}.binResolution), 'cent'))};
                        end
                    else
                        if ismember('GuessUnvoiced', fields)
                            % predominantMelody JNMR sectionLinking 2015;
                            % DEPRECATED
                            superIn1={varargin{1}.Values,varargin{1}...
                                TimeStamps, varargin{1}.Unit};
                            superIn2={varargin{1}.Filename,struct(...
                                'GuessUnvoiced',varargin{1}.GuessUnvoiced,...
                                'PeakDistributionThreshold', ...
                                varargin{1}.PeakDistributionThreshold,...
                                'AudioFs', varargin{1}.AudioFs, ...
                                'Algorithm', varargin{1}.Algorithm, ...
                                'EssentiaVersion', varargin{1}.Version,...
                                'FrameSize', varargin{1}.FrameSize,...
                                'HopSize', varargin{1}.HopSize, ...
                                'BinResolution', feature.PitchDataPoint(...
                                varargin{1}.BinResolution, 'cent'),...
                                'Citation', varargin{1}.Citation)};
                        else
                            % varnam; will be DEPRECATED
                            superIn1={varargin{1}.values,varargin{1}...
                                .timeStamps, varargin{1}.unit};
                            superIn2={varargin{1}.audioFile,struct(...
                                'AudioFs', 44100.0, ...
                                'HopSize', varargin{1}.hopSize, ...
                                'Algorithm', varargin{1}.algorithm, ...
                                'BinResolution', feature.PitchDataPoint(...
                                varargin{1}.binResolution, 'cent'))};
                        end
                    end
                otherwise
                    error('PredominantMelody:nargin', ...
                        'Wrong number of inputs')
            end
            obj = obj@feature.Melody(superIn1{:});
            obj = obj@feature.AudioFeature(superIn2{:});
            
            %% instantiate
            switch nargin
                case 0 % pass
                    obj.Info.AudioFs = [];
                case 1 % struct input
                    obj.Reference = feature.PitchDataPoint.empty(); % the
                    % values in the json file are Hz, there's no reference
                    
                    if any(strcmp(fields, 'pitch')) %pycompmusic makampitch
                        obj.Confidence = varargin{1}.pitch(:,3);
                    else 
                        try
                            % predominantMelody JNMR sectionLinking 2015;
                            % DEPRECATED
                            obj.Confidence = varargin{1}.Confidence;
                        catch
                            % varnam DEPRECATED
                            obj.Confidence = varargin{1}.confidence;
                        end
                    end
            end
        end
        
        objNorm = normalize(obj, ref) % normalize wrt tonic
        featureDown=downsample(feature,newHopSiz) % downsample to newHopSiz
        
        % getters
        function fs = get.Fs(obj)
            if numel(obj.TimeStamps) < 2
                %'There are less than 2 values in PredominantMelody
                fs = nan;
            else
                fs = 1/diff(obj.TimeStamps(1:2));
            end
        end
        
        function hopSize = get.HopSize(obj)
            if isempty(obj.Fs); hopSize = nan; else
            hopSize = round(obj.Info.AudioFs / obj.Fs); end
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
end
