classdef PitchSynthesizer
    %PITCHSYNTHESIZER Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        MaxAmplitude = 0.8 % maximum amplitude of the generated signal
        NumHarmonics = 4 % number of harmonics to be synthesized
        Fs = [] % if not given it will be automatically selected as an
        % integer multiple FsIncr property
        SignalType = 'sawtooth' % waveform: "sawtooth" or "square"
        FadeDuration = 0.01 % unit: ms
        Verbose = false;
    end
    
    properties (Dependent)
        Harmonic_idx
        Fader
    end
    
    properties (Constant, Hidden)
        FsIncr = 2000 % hz
    end
    
    methods
        function obj = PitchSynthesizer(options)
            % replace any value of parameter with the value given in the options
            if exist('options', 'var') && ~isempty(options)
                % get the parameters and values
                params = options(1:2:end);
                values = options(2:2:end);
                
                % check if a parameter is given twice
                if numel(unique(params)) ~= numel(params)
                    error('parseOptions:duplicateParam', ['Each '...
                        'parameter should be passed only once.'])
                end
                
                for k = 1:numel(params)
                    obj.(params{k}) = values{k};
                end
            end
        end
        
        [signal, fs] = synthesize(obj, pitchStruct)
        signal = normalize(obj, signal)
        signal = fade(obj, signal, pitch)
        
        % getters
        function harmonic_idx = get.Harmonic_idx(obj)
            switch obj.SignalType
                case 'sawtooth'
                    harmonic_idx = (1:obj.NumHarmonics)';
                case 'square'
                    harmonic_idx = (1:2:2*obj.NumHarmonics)';
                otherwise
                    error('synthesize:signalType', ['The SignalType '...
                        'can be either "sawtooth" or "square"'])
            end
        end
        
        function fader = get.Fader(obj)
            fadeNumSamples = obj.FadeDuration*obj.Fs;
            fader = linspace(0,1,fadeNumSamples);
        end
        
        % custom setter
        function obj = setFs(obj, pitchVals)
            maxVal = max(pitchVals);
            nyquistFreq = 2*obj.Harmonic_idx(end)*maxVal;
            
            obj.Fs = obj.FsIncr * ceil(nyquistFreq/obj.FsIncr);
        end
        
        function checkFs(obj, pitchVals)
            % check aliasing
            maxVal = max(pitchVals);
            nyquistFreq_harm = 2*obj.Harmonic_idx*maxVal;
            aliasBool = (nyquistFreq_harm > obj.Fs);
            if aliasBool(end)
                warningStr = ['Aliasing occurs with the given sampling '...
                    'frequency: ' num2str(obj.Fs, '%.0f') ' Hz. The '...
                    'sampling frequency, Fs, should be at least '...
                    num2str(ceil(nyquistFreq_harm(end)), '%.0f') ' Hz.'];
                if ~all(aliasBool)
                    numHarm = find(aliasBool == 0, 1, 'last');
                    warningStr = [warningStr ' Alternatively you can '...
                        'reduce the number of harmonics of the '...
                        'generated signal to ' num2str(numHarm) '.'];
                end
                
                warning('synthesize:fs',  warningStr)
            end
        end
    end
end
