%MATLAB FINAL PROJECT
%Julia Weinstock, Carly Askinas, Tommy Yang
clear all; 

Spec=xlsread('Matlab_Project','Sheet2');
global Spec

%Ask user to input how many samples and loop through them and ask user to input
%parameters for each sample
samples=input('How many samples do you want to determine the material for?: ');
while samples<=0 | round(samples)~=samples
    samples=input('Please enter a non-negative integer value:  ');
end

for i=1:samples
    fprintf('For sample #%i \n',i);
    
    shape=input('What is the shape of the static? (Cube, rectangular prism, cylinder): ','s');
    while ~strcmpi(shape,'cube') & ~strcmpi(shape,'rectangular prism') & ~strcmpi(shape,'cylinder')
        shape=input('ERROR. Please enter a cube, rectangular prism, or cylinder: ','s');
    end
    
    %Dimensions below
    switch shape
        case {'cube'}
            length_cube=input('What is the length of one edge in meters?: ');
            while length_cube <=0
                length_cube=input('Please enter a positive length in meters: ');
            end
            L(i)=input('What is the desired part length?: ');
            while L(i) <=0
                L(i)=input('Please enter a positive part length in meters: ');
            end
            A(i)=length_cube^2;
            V(i)=A(i)*L(i);
            
        case {'rectangular prism'}
            length_prism=input('What is the length of the cross sectional area in meters?: ');
            while length_prism<=0
                length_prism=input('Please enter a positive length in meters: ');
            end
            width_prism=input('What is the width of the cross sectional area in meters?: ');
            while width_prism<=0
                width_prism=input('Please enter a positive width in meters: ');
            end
            L(i)=input('What is the desired part length?: ');
            while L(i) <=0
                L(i)=input('Please enter a positive part length in meters: ');
            end
            A(i)=length_prism*width_prism;
            V(i)=A(i)*L(i);
            
        case {'cylinder'}
            radius_cylinder=input('What is the radius of the cylinder in meters?: ');
            while radius_cylinder<=0
                radius_cylinder=input('Enter a positive radius in meters: ');
            end
            L(i)=input('What is the desired part length?: ');
            while L(i) <=0
                L(i)=input('Please enter a positive part length in meters: ');
            end
            A(i)=pi*radius_cylinder^2;
            V(i)=A(i)*L(i);
    end
    
    forcetype=input('What type of force is going to applied to your part? Please enter Tension, Compression, or Shear (Newtons): ','s');
    while ~strcmpi(forcetype,'Tension') && ~strcmpi(forcetype,'Compression') && ~strcmpi(forcetype,'Shear');
        forcetype=input('Please enter Tension, Compression, or Shear: ','s');
    end
    if strcmpi(forcetype,'Tension')
        forcetype1(i)=1;
        force(i)=input('What is the force applied (N)?: ');
        while force(i)<=0
            force(i)=input('Enter a positive tensile force (N): ');
        end
    elseif strcmpi(forcetype,'Compression');
        forcetype1(i)=2;
        force(i)=input('What is the force applied (N)?: ');
        while force(i)<=0
            force(i)=input('Enter a positive compressive force (N): ');
        end
    elseif strcmpi(forcetype,'Shear')
        forcetype1(i)=3;
        force(i)=input('What is the force applied (N)?: ');
        while force(i)<=0
            force(i)=input('Enter a positive shear force (N): ');
        end
    else
        fprintf('Error.');
    end
    
    stress(i)=force(i)/A(i);
    
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Calulates strain and deformation based on selected materials via the logic comparison
%Writes this data to the file
strain1=zeros(9,9);
cost=zeros(9,9);
deformation1=zeros(9,9);
for n=1:samples
    %[strain(:,1),deformation(:,1)]=stress_calculation(A(n),force(n),forcetype1(n),L(n),Spec,stress(n));
    
    fid=fopen('ProgramCalculations.txt', 'a');
    v=[1:9];
    new=(stress(n) < Spec(:,3));
    new2=v(new==1);
    m=new2;

    [strain1,deformation1]=stress_calculation(A,force,forcetype1,L,Spec,stress,n,new2)
    Spec1=Spec(:,4);
    Spec2=Spec(:,5);
    
    cost=Cost_Calc(V(n),Spec1,Spec2,n,new2)  
end

for n=1:samples
    for m=new2
        if m==1
            mat='Aluminum';
        elseif m==2
            mat='Brass';
        elseif m==3
            mat='Copper';
        elseif m==4
            mat='Steel';
        elseif m==5
            mat='Iron';
        elseif m==6
            mat='Zinc';
        elseif m==7
            mat='Chromium';
        elseif m==8
            mat='Nickel';
        elseif m==9
            mat='Tin';
        end
        fprintf(fid,'The material %s has a stress value of %.2fMPa, a strain value of %f and a deformation value of %fm and will cost $%.2f.\n',mat,stress(n)/10e6,abs(strain1(m)),deformation1(m),cost(m));
        fprintf('The material %s has a stress value of %.2fMPa, a strain value of %f and a deformation value of %fm and will cost $%.2f.\n',mat,stress(n)/10e6,abs(strain1(m)),deformation1(m),cost(m));
        
        subplot(3,1,1)
        plot(new2,cost(cost>0),'o')
        xlabel('Material');
        ylabel('Cost per Volume ($)');
        title('Cost vs. Material');
        legend('materials in order listed');
        subplot(3,1,2)
        plot(new2,Spec(new2,3),'o')
        xlabel('Material');
        ylabel('Ultimate Material Strength (MPa)');
        title('Ultimate Material Strength vs. Material');
        legend('materials in order listed');
        subplot(3,1,3)
        plot(Spec(new2,3),cost(cost>0),'o')
        xlabel('Ultimate Material Strength (MPa)');
        ylabel('Cost per Volume ($)');
        title('Cost vs. Ultimate Material Strength');
        legend('materials in order listed');

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
end

fclose(fid);

