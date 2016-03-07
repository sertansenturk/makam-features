function plot(distribution, peaks, titleStr, style)
%PLOT Summary of this function goes here
%   Detailed explanation goes here

epsilon = 10^-9; % a small number to compare the peaks
tuningYLoc = 0.7; % the y value when plotting the tuning
tuningNoteYLoc = 0.8;% the y value to print the notes symbols in the tuning
tuningColors = {'r', 'm'}; % the color to show the tuning

%% plot distribution
% normalize the max value to 1 for visualization
y = distribution.Y/max(distribution.Y);

if ~exist('style', 'var') || isempty(style)
    style = '';
end

switch distribution.Method
    case 'histogram'
        bar(distribution.X, y, style)
    case 'kernelDensity'
        plot(distribution.X, y, style)
end

if strcmpi(distribution.Unit, 'Hz')
    xlabel(distribution.Unit)
else
    xlabel([distribution.Unit ' (Ref = ' num2str(distribution.Reference...
        .Value,  '%0.1f') ' ' distribution.Reference.Unit ')'])
end
ylabel({'Relative', 'occurence'})

if exist('titleStr', 'var') && ~isempty(titleStr)
    title(titleStr, 'Interpreter', 'none')
end

%% points, if given
if exist('peaks','var') && ~isempty(peaks)
    if ismember('scaleDegree', fieldnames(peaks)) % tuning
        hold on
        % plot the theoretical tuning
        theoreticalVals = [peaks.scaleDegree.theoretical];
        ht =plot(theoreticalVals,tuningYLoc*ones(size(theoreticalVals)),...
            [tuningColors{1} 'o'], 'MarkerSize', 5);
        for k = 1:numel(theoreticalVals);
            x = theoreticalVals(k);
            plot([x x], [0 tuningYLoc], [':' tuningColors{1}])
        end
        
        % write the note names
        performedVals = [peaks.scaleDegree.performed];
        textColors = tuningColors([peaks.scaleDegree.isSwitched] + 1);
        for k = 1:numel(performedVals);
            text(performedVals(k), tuningNoteYLoc, ...
                peaks.scaleDegree(k).noteSymbol, 'Color', textColors{k},...
                'HorizontalAlignment', 'center', 'Interpreter', 'none');
        end
        
        % plot the performed tuning
        performedVals = performedVals([peaks.scaleDegree.isSwitched]);
        hp = plot(performedVals, tuningYLoc * ones(size(performedVals)),...
            [tuningColors{2} '+'], 'MarkerSize', 5);
        for k = 1:numel(performedVals);
            x = performedVals(k);
            plot([x x], [0 tuningYLoc], ['--' tuningColors{2}])
        end
        
        legend([ht, hp], {'theoretical', 'performed'})
    elseif isa(peaks, 'feature.StablePitches') % stable pitches
        if ~strcmpi(distribution.Unit, peaks.Unit)
            error('plot:unitMismatch',['The unit of the peaks and the '...
                'distribution must match'])
        end
        hold on
        
        peakInds = arrayfun(@(x) find(abs(distribution.X-x)<epsilon), ...
            peaks.Values);
        plot(peaks.Values, y(peakInds), 'r+', 'MarkerSize', 10)
    else
        error('plot:peaks', ['The second input should be either a '...
            'struct with the stable piches or the tuning.'])
    end
end

%%
grid on
axis tight
ylim([0 1])
hold off

