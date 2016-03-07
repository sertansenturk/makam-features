function bpm = noteDur2bpm(varargin)
%DUR2BPM Summary of this function goes here
%   Detailed explanation goes here

QUARTER_NOTE_DUR_RATIO = 1/4;
DEFAULT_BEAT_DUR_RATIO = 1/4;
if nargin == 1 % assume the given duration (sec) is equal to quarter note,
    % and a beat duration is equal to a quarter note too.
    dur = varargin{1};
    symDurRatio = QUARTER_NOTE_DUR_RATIO;
    beatDurRatio = DEFAULT_BEAT_DUR_RATIO;
elseif nargin == 2 % the duration of the note and its ratio wrt to a whole
    % note is given; assume that a beat duration is equal to a quarter note
    dur = varargin{1};
    symDurRatio = varargin{2};
    beatDurRatio = DEFAULT_BEAT_DUR_RATIO;
elseif nargin == 3 % the duration of the note and its ratio wrt to a whole
    % note and the ratio of the beat duration wrt a whole note is given
    dur = varargin{1};
    symDurRatio = varargin{2};
    beatDurRatio = varargin{3};
end

% compute bpm
bpm = 60*symDurRatio/(beatDurRatio*dur);
end
