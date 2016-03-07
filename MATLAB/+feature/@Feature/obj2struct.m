function st = obj2struct(obj) % convert to struct for easier saving
%STRUCT Summary of this function goes here
%   Detailed explanation goes here
propertynames = properties(obj);
for p = 1:numel(propertynames)
    for o = numel(obj):-1:1
        st(o).(propertynames{p}) = obj(o).(propertynames{p});
    end
end
end