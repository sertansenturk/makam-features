function hc = hz2hc(hz,refHz)
% converts the pitch values given in hertz to Holderian commas wrt a
% given reference frequency. There are 53 Hc's in an octave
%
% INPUTS
% hz: pitches in hertz
% refHz: reference frequency in hertz to convert the Holdrian comma values
%
% OUTPUTS
% hc: pitches in holderian commas
%
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012
hc = 53*log2(hz/refHz);
