function hz = cent2hz(cent,refHz)
% converts the pitch values given in cents to frequencies wrt a
% given reference frequency. There are 1200 cents in an octave
%
% INPUTS
% cent: pitches in cents
% refHz: reference frequency in hertz to convert the Holdrian comma values
%
% OUTPUTS
% hz: pitches in hertz
%
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012
hz = refHz*2.^(cent/1200);

