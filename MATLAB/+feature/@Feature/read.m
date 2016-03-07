function feature = read(path, format)
%READFEATURE Summary of this function goes here
%   Detailed explanation goes here

if ~exist('path', 'file')
    error('readFeature:fileDoesNotExist', 'The file does not exist!')
end

if ~exist('format','var')
    [~,~,format] = fileparts(path);
    format = format(2:end); % remove the leading dot
end

% load the file from mat file if it already exists
[folder, file] = fileparts(path);
matFile = fullfile(folder, [file '.mat']);
if exist(matFile, 'file')
    feature = load(matFile);
else
    tic;
    switch format
        case 'json'
            feature = external.jsonlab.loadjson(path);
            if iscell(feature) % convert to array of structs if the output
                % is cell
                feature = cell2mat(feature);
            end
        case 'txt' % reads varnam audio features
            fid = fopen(path, 'r');
            tline = fgetl(fid);
            while(tline ~= -1)
                row = regexp(tline,'\t','split');
                header = row{1}(1:end-1); % remove the ':' in the end
                vals = row(2:end);
                try
                    vals = cellfun(@str2num,vals); % try to convert to double
                    vals = vals(:)'; % make it a row vector
                catch
                    if iscellstr(vals) && numel(vals) == 1
                        vals = vals{1}; % extract str from single cellstr
                    end
                end
                feature.(header) = vals;
                tline = fgetl(fid);
            end
            [~] = fclose(fid);
            
        otherwise
            error('readFeature:unknownFormat', ['Format is not known! '...
                ' Supported formats: ' 'json'])
    end
    
    tLoad = toc;
    
    % if the variable takes a lot of time to load save as .mat file
    if tLoad > 0.5 % seconds
        if ~isempty(strfind(path, 'predominantMelody'))
            save(matFile, '-struct', 'feature')
        end
    end
end