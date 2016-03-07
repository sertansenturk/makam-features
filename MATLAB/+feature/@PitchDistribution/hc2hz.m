function feature_hz = hc2hz(feature_hc)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

xVals = feature.Converter.hc2hz(feature_hc.X, feature_hc.Reference.Value);
reference = feature.PitchDataPoint.empty(0,0); % converted to hz, no reference
unit = 'Hz';

% instantiate
feature_hz = feature.PitchDistribution(xVals, feature_hc.Y, unit, ...
    feature_hc.Step, feature_hc.Method, reference, feature_hc.KernelWidth);
end
