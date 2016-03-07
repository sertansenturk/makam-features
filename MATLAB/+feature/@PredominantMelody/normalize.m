function predominantMelodyNorm = normalize(obj, ref)

% normalize the predominant melody with respect to the reference frequency
if isa(ref, 'feature.Tonic')
    predominantMelodyNorm = obj.hz2cent(ref.Value);
elseif isnumeric(ref)
    predominantMelodyNorm = obj.hz2cent(ref);
else
    error('normalize:ref', ['The reference should be a number or a '...
        'tonic object'])
end
end