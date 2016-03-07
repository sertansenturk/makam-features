function feature_cent = hc2cent(feature_hc)
% Author: Sertan Senturk (sertan.senturk@upf.edu)
% Music Technology Group - Universitat Pompeu Fabra
% 2012

xVals = feature.Converter.hc2cent(feature_hc.X);
kernelWidth = feature_hc.KernelWidth.hc2cent();
step = feature_hc.Step.hc2cent();
unit = 'hc';

% instantiate
feature_cent = feature.PitchDistribution(xVals, feature_hc.Y, unit, ...
    step, feature_hc.Method, feature_hc.Reference, kernelWidth);

end