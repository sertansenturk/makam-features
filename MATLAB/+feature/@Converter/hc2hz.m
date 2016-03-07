function hz = hc2hz(hc,refHz)
% converts the pitch values given in Holderian commas to frequencies wrt a
% given reference frequency. There are 53 Hc's in an octave
%
% INPUTS
% hc: pitches in Holdrian commas
% refHz: reference frequency in hertz to convert the Holdrian comma values
%
% OUTPUTS
% hz: pitches in hertz
%
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012
hz = refHz*2.^(hc/53);

