A = struct(...
    'name', {'mike', 'doug', 'steve', 'loren', 'jiro', 'brett', 'seth'}, ...
    'year', {2005, 2001, 1993, 1987, 2006, 2005, 1998}, ...
    'day', {'Mon', 'Fri', 'Wed', 'Fri', 'Mon', 'Mon', 'Mon'})

for id = 1:length(A)
    fprintf('%d\n',id)
    disp(A(id))
end

Afields = fieldnames(A);
Acell = struct2cell(A);
sz = size(Acell)            % Notice that the this is a 3 dimensional array.
                            % For MxN structure array with P fields, the size
                            % of the converted cell array is PxMxN
                            
% Convert to a matrix
Acell = reshape(Acell, sz(1), []);      % Px(MxN)

% Make each field a column
Acell = Acell';                         % (MxN)xP

% Sort by first field "name"
Acell = sortrows(Acell, 1)                            

% Put back into original cell array format
Acell = reshape(Acell', sz);

% Convert to Struct
Asorted = cell2struct(Acell, Afields, 1);

for id = 1:length(Asorted)
    fprintf('%d\n',id)
    disp(Asorted(id))
end


%%%%
B = nestedSortStruct(A, 'name');

isequal(B, Asorted)
C = nestedSortStruct(A, {'year', 'name'});

for id = 1:length(C)
    fprintf('%d\n',id)
    disp(C(id))
end