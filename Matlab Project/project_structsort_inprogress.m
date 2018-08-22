%% SORT
A=[1 2 3 4 5 6 7];
B=A'
for i=1:4
    Newcol=[i+1; i+2; i+1; i+3; i+4; i+6; i+7];
B=[B Newcol]
end

%%% Struc sort
    fprintf('For sample %i :\n',n); % Might not be necessary
    A = struct(...
        'name', {'Aluminum';'Brass';'Copper';'Steel';'Iron';'Zinc';'Chromium';'Nickel';'Tin'}, ...
        'strain', {strain1(1,1);strain1(2,1);strain1(3,1); ...
        strain1(4,1);strain1(5,1);strain1(6,1);strain1(7,1);strain1(8,1);strain1(9,1)}, ...
        'deformation', {deformation1(1,1);deformation1(2,1);deformation1(3,1);deformation1(4,1); ...
        deformation1(5,1);deformation1(6,1);deformation1(7,1);deformation1(8,1);deformation1(9,1)}, ...
        'cost', {cost(1,1);cost(2,1);cost(3,1);cost(4,1);cost(5,1);cost(6,1);cost(7,1);cost(8,1);cost(9,1)});
%     
%     for id = 1:length(A)
%         fprintf('%d\n',id)
%         disp(A(id))
%     end
    
    Afields = fieldnames(A);
    Acell = struct2cell(A);
    sz = size(Acell);            % Notice that the this is a 3 dimensional array.
    
    % Convert to a matrix
    Acell = reshape(Acell, sz(1), []);      % Px(MxN)
    
    % Make each field a column
    Acell = Acell';                         % (MxN)xP
    Materials_Table=Acell
    fprintf('What parameter do you want to sort by?\n');
    sortparameter=input('Enter strain, deformation, or cost: ','s');
    while ~strcmpi(sortparameter, 'strain') && ~strcmpi(sortparameter, 'deformation') && ~strcmpi(sortparameter, 'cost')
        sortparameter=input('Please enter strain, deformation, or cost:  ','s');
    end
    %% strain is 2, deformation is 3, cost is 4
    switch sortparameter
        case {'strain','Strain'}
            alakazam=2;
        case {'deformation','Deformation'}
            alakazam=3;
        case {'cost','Cost'}
            alakazam=4;
    end
    % Sort by first field "name"
    Acell = sortrows(Acell, alakazam); %% 2nd part denotes row to be sorted by
    
    % Put back into original cell array format
    Acell = reshape(Acell', sz);
    
    % Convert to Struct
    Asorted = cell2struct(Acell, Afields, 1);
    
%     for id = 1:length(Asorted)
%         fprintf('%d\n',id)
%         disp(Asorted(id))
%     end
    
    szm = size(Asorted);
    Asorted1 = reshape(Asorted, szm(1), []);      % Px(MxN)
       
    % Make each field a column
%     Asorted1 = Asorted';    
      for id = 1:length(Asorted1)
        fprintf('%d\n',id)
        disp(Asorted1(id))
      end
    %%%END SORT