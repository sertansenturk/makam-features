classdef NoteSymbol < feature.Feature
    %NOTE Summary of this class goes here
    %   Detailed explanation goes here
    % It only defines the symbol in the symbtr format now. Later add other
    % properties such as traditional name octave, accidental symbol etc.
    properties
        Symbol = ''
    end
    
    methods
        function obj = NoteSymbol(symbol)
            if exist('symbol', 'var'); obj.Symbol = symbol; end
        end
    end
end

