classdef Converter
    %CONVERSION Summary of this class goes here
    %   Detailed explanation goes here
    
    methods (Static)
        hc = hz2hc(hz,refHz)
        cent = hz2cent(varargin)
        
        hz = hc2hz(hc,refHz)
        cent = hc2cent(hc)
        
        hz = cent2hz(cent,refHz)
        hc = cent2hc(cent)
        
        deg = rad2deg(varargin)
        rad = deg2rad(varargin)
        
        bpm = noteDur2bpm(varargin)
    end
end

