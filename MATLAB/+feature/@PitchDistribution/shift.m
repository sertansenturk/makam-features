function distFeature_shifted = shift(distFeature, ref)
%SHIFT Summary of this function goes here
%   Detailed explanation goes here

%% I/O
if ~strcmpi(distFeature.Reference.Unit, 'Hz')
    error('shift:distFeature', ['Unknown unit for '...
        'the pitch distribution reference: "' ...
        distFeature.Reference.Unit '"'])
end

if isa(ref, 'feature.Tonic')
    if strcmpi(ref.Unit, 'Hz')
        ref = ref.Value;
    else
        error('shift:ref', ['Unknown unit for the '...
            'tonic reference: "' ref.Unit '"'])
    end
elseif isnumeric(ref) % assume the value is given in hertz
    % pass
else
    error('shift:ref', ['Unknown type for the tonic '...
        'reference.'])
end

%% initialize
distFeature_shifted = distFeature;

%% shift
distFeature_shifted.Reference.Value = ref;
switch lower(distFeature_shifted.Unit)
    case 'cent'
        dist = feature.Converter.hz2cent(ref, ...
            distFeature.Reference.Value);
    case 'hc'
        dist = feature.Converter.hz2hc(ref, ...
            distFeature.Reference.Value);
    otherwise
        error('shift:distFeature', ['Unknown unit for '...
            'the x-axis values of the pitch distribution: "' ...
            distFeature.Unit '"'])
end
distFeature_shifted.X = distFeature_shifted.X - dist;
