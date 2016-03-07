function feature_hc = hz2hc(feature_hz, ref_hz)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

xVals = feature.Converter.hz2hc(feature_hz.X, ref_hz);
reference = feature.PitchDataPoint(ref_hz,'Hz');
unit = 'cent';

switch feature_hz.Step.Unit
    case 'hc' % pass
        step = feature_hz.Step;
    case 'cent'
        step = feature_hz.Step.cent2hc();
    otherwise; error('Step:unit', 'Unknown unit')
end

switch feature_hz.KernelWidth.Unit
    case 'hc' % pass
        kernelWidth = feature_hz.KernelWidth;
    case 'cent' 
        kernelWidth = feature_hz.KernelWidth.cent2hc();
    otherwise; error('KernelWidth:unit', 'Unknown unit')
end

% instantiate
feature_hc = feature.PitchDistribution(xVals, feature_hz.Y, unit, ...
    step, feature_hz.Method, reference, kernelWidth);
end