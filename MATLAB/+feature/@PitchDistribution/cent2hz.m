function feature_hz = cent2hz(feature_cent)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

xVals = feature.Converter.cent2hz(feature_cent.X, feature_cent.Reference.Value);
reference = feature.PitchDataPoint.empty(); % converted to hz, no reference
unit = 'Hz';

% instantiate
feature_hz = feature.PitchDistribution(xVals, feature_cent.Y, unit, ...
    feature_cent.Step, feature_cent.Method, reference, ...
    feature_cent.KernelWidth);
end