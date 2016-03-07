function feature_cent = hz2cent(feature_hz, ref_hz)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

reference = feature.PitchDataPoint(ref_hz,'Hz');
unit = 'cent';

switch feature_hz.Step.Unit
    case 'hc' 
        step = feature_hz.Step.hc2cent();
    case 'cent'
        step = feature_hz.Step;
    otherwise; error('Step:unit', 'Unknown unit')
end

% make sure xVals obey the step
xVals = feature.Converter.hz2cent(feature_hz.X, ref_hz);
step_dev = diff(xVals) - step.Value;
if any(step_dev > 10^-9)
    error('hz2cent:xVals', 'The x-axis values do not follow the step size')
end
xVals(2:end) = xVals(2:end) - cumsum(step_dev);

switch feature_hz.KernelWidth.Unit
    case 'hc' 
        kernelWidth = feature_hz.KernelWidth.hc2cent();
    case 'cent' %pass
        kernelWidth = feature_hz.KernelWidth;
    otherwise; error('KernelWidth:unit', 'Unknown unit')
end

% instantiate
feature_cent = feature.PitchDistribution(xVals, feature_hz.Y, unit, ...
    step, feature_hz.Method, reference, kernelWidth);
end