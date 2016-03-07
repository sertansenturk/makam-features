function featureInInterval = getTimeInterval(feature, interval)
%GETFEATUREININTERVAL Summary of this function goes here
%   Detailed explanation goes here
featureInInterval = feature;

% get the field names with the same length as timeStamps
names = fieldnames(feature);
names = names(cellfun(@(x) length(feature.(x)) == ...
    length(feature.TimeStamps), names));

bool = feature.TimeStamps>=interval(1) & feature.TimeStamps<=interval(2);
for k = 1:length(names)
    featureInInterval.(names{k}) = feature.(names{k})(bool);
end
end

