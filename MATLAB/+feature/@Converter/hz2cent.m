function cent = hz2cent(varargin)
% converts the pitch values given in hertz to cents wrt a
% given reference frequency. There are 1200 cents in an octave
%
% INPUTS
% hz: pitches in hertz
% refHz: reference frequency in hertz to convert to cents
% minFreq: all frequencies below this will be assigned to nan cents 
%          (default: 20Hz)
%
% OUTPUTS
% cent: pitches in cents
%
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012
if nargin == 2
    hz = varargin{1};
    refHz = varargin{2};
    minFreq = 20;
elseif nargin == 3
    hz = varargin{1};
    refHz = varargin{2};
    minFreq = varargin{3};
end

cent = 1200*log2(hz/refHz);
cent(hz < minFreq) = nan;
