function feature_hc = cent2hc(feature_cent)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

xVals = feature.Converter.cent2hc(feature_cent.X);
kernelWidth = feature_cent.KernelWidth.cent2hc();
step = feature_cent.Step.cent2hc();
unit = 'hc';

% instantiate
feature_hc = feature.PitchDistribution(xVals, feature_cent.Y, unit, ...
    step, feature_cent.Method, feature_cent.Reference, kernelWidth);
end