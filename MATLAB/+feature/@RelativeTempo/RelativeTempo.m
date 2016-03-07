classdef RelativeTempo <feature.Tempo
    %RELATIVETEMPO Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        Method = ''
        Citation = ''
        RelativeTo = ''
    end
    
    methods
        function obj = RelativeTempo(varargin)
            switch nargin
                case 1
                    val = varargin{1}.Value;
                    relativeTo = varargin{1}.RelativeTo;
                    method = varargin{1}.Method;
                    citation = varargin{1}.Citation;
                case 2
                    val = varargin{1};
                    relativeTo = varargin{2};
                case 4
                    val = varargin{1};
                    relativeTo = varargin{2};
                    method = varargin{3};
                    citation = varargin{4};
            end
            if ~exist('method','var'); method = '';end
            if ~exist('citation','var'); citation = '';end
            obj = obj@feature.Tempo(val, method, citation);
            if ischar(relativeTo)
                obj.RelativeTo = relativeTo;
            else
                error('RelativeTempo:RelativeTo', ['The "RelativeTo" '...
                    'property should be a string indicating the score '...
                    'file path'])
            end
        end
    end
end
