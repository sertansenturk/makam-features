function plot(feature, yLabel, titleStr, style)
%PLOT Summary of this function goes here
%   Detailed explanation goes here
if ~exist('style','var')
    style = '';
end
plot(feature.TimeStamps, feature.Values, style)
xlabel('Time (sec)')
if exist('yLabel','var')
    ylabel({yLabel, ['(' feature.Unit ')']}, 'Interpreter', 'none')
end
xlim([feature.TimeStamps(1) feature.TimeStamps(end)])
grid on
if exist('titleStr', 'var')
    title(titleStr, 'Interpreter', 'none')
end
end
