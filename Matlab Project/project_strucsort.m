A = struct(...
    'name', {'Aluminum';'Brass';'Copper';'Steel';'Iron';'Zinc';'Chromium';'Nickel';'Tin'}, ...
    'stress', {Stress(1,1);Stress(1,2);Stress(1,3);Stress(1,4);Stress(1,5);Stress(1,6); ...
    Stress(1,7);Stress(1,8);Stress(1,9)}, ...
    'strain', {Strain(1,1);Strain(1,2);Strain(1,3); ...
    Strain(1,4);Strain(1,5);Strain(1,6);Strain(1,7);Strain(1,8);Strain(1,9)}, ...
    'deformation', {Deformation(1,1);Deformation(1,2);Deformation(1,3);Deformation(1,4); ...
    Deformation(1,5);Deformation(1,6);Deformation(1,7);Deformation(1,8);Deformation(1,9)})

for id = 1:length(A)
    fprintf('%d\n',id)
    disp(A(id))
end

Afields = fieldnames(A);
Acell = struct2cell(A);
sz = size(Acell)            % Notice that the this is a 3 dimensional array.
                 
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