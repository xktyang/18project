%Project initiation
clear all; clc; close all; 
%%% START

Spec=xlsread(' ');
Global Spec 
samples=input('How many samples do you want to determine the material for?    ');  
while samples<=0 | round(samples)~=samples
samples=input(‘Please enter a non-negative integer value:   ‘);
End

 %%%%REWORD
for i=1:samples
fprintf(‘For sample #%i \n’,i);

shape=input('What is the shape of the static? (Cube, rectangular prism, cylinder)‘,’s’);
While ~strcmpi(shape, ‘cube’) & ~strcmpi(shape, ‘rectangular prism’) & ~strcmpi(shape, ‘cylinder’) 
	shape=(‘ERROR. Please enter a cube, rectangular prism, or cylinder: ‘,’s’);
End 
%%% Dimensions below
Switch shape
Case {‘cube’}
length_cube=input(‘What is the length of one edge in meters? ’);
While length_cube <=0 
length_cube=input(‘Please enter a positive length in meters: ‘);
End
L=input(‘What is the desired part length? ‘);
While L <=0 
L=input(‘Please enter a positive part length in meters: ‘);
End
A=length_cube^2;
V=A*L;


Case {‘rectangular prism’}
length_prism=input(‘What is the length of the cross sectional area in meters? ‘);
While length_prism<=0 
length_prism=input(‘Please enter a positive length in meters: ‘);
End
width_prism=input(‘What is the width of the cross sectional area in meters? ‘); 
While width_prism<=0
width_prism=input(‘Please enter a positive width in meters: ‘);
End
L=input(‘What is the desired part length? ‘);
While L <=0 
L=input(‘Please enter a positive part length in meters: ‘);
End
A=length_prism*width_prism;
V=A*L;

Case {‘cylinder’}
radius_cylinder=input(‘What is the radius of the cylinder in meters?  ‘);
While 	radius_cylinder<=0
radius_cylinder=input(‘Enter a positive radius in meters: ‘);
End
L=input(‘What is the desired part length? ‘);
While L <=0 
L=input(‘Please enter a positive part length in meters: ‘);
End
A=pi*radius_cylinder^2
V=A*L;
end

forcetype=input('Tensile Force, Compressive Force, or Shear Force? Please enter Tension, Compression, or Shear (Newtons):     ','s');
while ~strcmpi(forcetype,'Tension') && ~strcmpi(forcetype, ‘Compression’) && ~strcmpi(forcetype,'Shear');
    forcetype=input('Please enter Tension, Compression, or Shear:  ','s');
End
If strcmpi(forcetype,’Tension’)
force=input(‘What is the force applied (N)? ‘);
While force<=0 
force=input(‘Enter a positive tensile force (N): ‘);
End
Elseif strcmpi(forcetype, ‘Compression’);
force=input(‘What is the force applied (N)? ‘); 
While force<=0
force=input(‘Enter a positive compressive force (N): ‘);
end
Elseif strcmpi(forcetype,’Shear’)
force=input(‘What is the force applied (N)? ‘);
While force<=0
force=(‘Enter a positive shear force (N): ‘);
End
Else 
fprintf(‘Error’);
End



[stress,strain,deformation]=stress_calc(A,force);


fid=fopen(‘ProgramCalculations.txt’, ‘a’)
v=[1:9];
new=(deformation < ---)
new2=v(new==1)
for k=1:length(new2)
    if new2(k)==1
        mat='Aluminum';
    elseif new2(k)==2
        mat='Brass';
    elseif new2(k)==3
        mat='Copper';
    elseif new2(k)==4
        mat=’Steel’;
    elseif new2(k)==5
        mat=’Iron’;
    elseif new2(k)==6
        mat=’Zinc’;
    elseif new2(k)==7
        mat=’Chromium’;
    elseif new2(k)==8
        mat=’Nickel’;
    elseif new2(k)==9
        mat=’Tin’;
    End
 
cost(k)=Cost_Calc (V,Spec(new2(k), insert column #))

    fprintf(fid,'The material %s has a stress value of %.4f, a strain value of %.4f and a deformation value of %.4f and will cost $%.2f.\n',mat,stress(k), strain(k), deformation(k), cost(k));  
    fprintf('The material %s has a stress value of %.4f, a strain value of %.4f and a deformation value of %.4f and will cost $%.2f.\n',mat,stress(k), strain(k), deformation(k), cost(k));  

End

%%sortstruct start
A = struct(...
    'name', {'Aluminum';'Brass';'Copper';'Steel';'Iron';'Zinc';'Chromium';'Nickel';'Tin'}, ...
    'stress', {stress(1,1);stress(1,2);stress(1,3);stress(1,4);stress(1,5);stress(1,6); ...
    stress(1,7);stress(1,8);stress(1,9)}, ...
    'strain', {strain(1,1);strain(1,2);strain(1,3); ...
    strain(1,4);strain(1,5);strain(1,6);strain(1,7);strain(1,8);strain(1,9)}, ...
    'deformation', {deformation(1,1);deformation(1,2);deformation(1,3);deformation(1,4); ...
    deformation(1,5);deformation(1,6);deformation(1,7);deformation(1,8);deformation(1,9)})

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
%%%%%%sortend
fclose(fid);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
TO DO: Look for stress on sphere
Make function files for stress; subfunction (or nested) for o=Ee 
Then calculate e=(deformation)*(original length)
Might need to make a separate deformation function for spheres 

Possible function file: cost effectiveness
Or factor of safety determination 
Magnitude of deformation

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Function [stress,strain,deformation] = stress_calc(A,force,forcetype,L)

stress=force/A;
strain=strain_calc(stress, Spec) 
deformation=strain./L  (LENGTH, for cubes, prisms, cylinders), sort ;

end

Function [strain] =strain_calc(stress, Spec,forcetype) 
If strcmpi(forcetype,’tension’) | strcmpi(forcetype, ‘compression’)
	E=Spec(:,y (replace column #));
strain=stress./E;
Elseif strcmpi(forcetype,’shear’)
G=Spec(:,y (replace column #));
strain=stress./G;
End
end



Function [cost] = Cost_Calc (V,Spec)
cost=V.*Spec(:, y insert column #)
end





