function cent = hc2cent(hc)
% converts the pitch values given in Holderian commas to cents
% there are 1200 cents and 53 Hc's in an octave
%
% INPUTS
% hc: pitch values given in Holerian commas
%
% OUTPUTS
% cent: pitch values given in cents
%
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012
cent = 1200*hc/53;
