function syntheticMelody =  compute(score, fs, relativeTempo)
%COMPUTE Summary of this function goes here
%   Detailed explanation goes here

if ~exist('relativeTempo','var') || isempty(relativeTempo)
    relativeTempo = 1; % no change in tempo
end

if isa(fs, 'feature.DataPoint')
    fs = fs.Value;
end

%% get the notes, durations etc.
durations = score.NoteDurations.Value / relativeTempo;
% don't process the notes with zero duration (control/comment, grace notes)
nonZeroDurBool = durations > 0;
durations = durations(nonZeroDurBool);

info.NotePitchHeight = score.PitchHeights.Value(nonZeroDurBool);
info.NoteIdx = find(nonZeroDurBool);

onsets = cumsum([0; durations(1:end-1)]);
totalDur = sum(durations);

% add the offset time of the last note to the onsets for synthesis
onsets = [onsets; totalDur];

%% create the time vector
timeStamps = 0:1/fs:sum(durations)-eps;
values = nan(size(timeStamps));
for k = 1:numel(info.NotePitchHeight)
    timeBool = timeStamps >= onsets(k) &...
        timeStamps < onsets(k+1);
    if any(timeBool)
        values(timeBool) = info.NotePitchHeight(k);
        info.OnsetTimeStamps(k) = timeStamps(find(timeBool, 1));
    else % the synthesis is fast that a note will not have any sample
        % assign the note onset to the next sample; the duration of the
        % note will be effectively zero since the next note onset will be
        % at the same sample
        onsetIdx = find(timeStamps >= onsets(k), 1, 'first');
        if isempty(onsetIdx);
            onsetIdx = length(timeStamps);
        end
        info.OnsetTimeStamps(k) = timeStamps(onsetIdx);
    end
end

%% add other related variables from the score
unit = score.PitchHeights.Unit;
scoreFile = score.Source;
reference = feature.DataPoint(score.PitchHeights.ReferenceSymbol,'symbolic_notation');
fs = feature.DataPoint(fs, 'Hz');

% for makams: if the unit is hc convert to cent
if strcmp(unit, 'hc')
    unit = 'cent';
    values = feature.Converter.hc2cent(...
        values);
    info.NotePitchHeight = feature.Converter.hc2cent(info.NotePitchHeight);
end

%% instatntiate the SyntheticMelody
syntheticMelody = feature.SyntheticMelody(values, timeStamps, unit, ...
    reference, fs, scoreFile, info);

end

% %% synthesize note by note: in this method each note with equal length will
% % have same amount of sample, however the durations will be equal to
% % numSamples / fs (not duration)
% [syntheticMelody.values, numSamples] = arrayfun(@(x,y) ...
%     computeSyntheticMelodyFromNote(x, y, fs), ...
%     score.PitchHeights.Value(nonZeroDurBool), durations(nonZeroDurBool), 'Unif', false);
% syntheticMelody.values = cell2mat(syntheticMelody.values);
% syntheticMelody.values = syntheticMelody.values(:)'; % make it a row vector
% syntheticMelody.timeStamps = (0:length(syntheticMelody.values)-1) / fs;
%
% syntheticMelody.notePitchHeight = score.PitchHeights.Value;
% numSamples = cell2mat(numSamples);
% onsetSample = cumsum([1; numSamples(1:end-1)]);
% syntheticMelody.onsetTimeStamps = syntheticMelody.timeStamps(onsetSample);
%
% end
%
% function [syntheticMelodyNote, numSamples] = ...
%     computeSyntheticMelodyFromNote(pitchHeight, duration, fs)
% numSamples = round(duration * fs);
% syntheticMelodyNote = pitchHeight * ones(numSamples,1);
% end