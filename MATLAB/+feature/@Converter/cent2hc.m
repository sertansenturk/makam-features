function hc = cent2hc(cent)
% converts the pitch values given in cents to Holderian commas
% there are 1200 cents and 53 Hc's in an octave
%
% INPUTS
% cent: pitch values given in cents
%
% OUTPUTS
% hc: pitch values given in Holdrina commas
%
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012
hc = cent/1200*53;