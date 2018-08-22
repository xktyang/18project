function [strain1,deformation1] = stress_calculation(A,force,forcetype1,L,Spec,stress,n,new2)
%This function serves to calculate the stress, strain and deformation
%given user input data
%   inputs: A - area (m^2) calculated in script file from user input dimensions
%           force - force (N) from user input
%           forcetype1 - type of force from user input (1, 2, or 3)
%           L - (m) length of part from user input
%           Spec - excel file read in by script with data
%           stress - (N/m^2 or Pa)stress of material given force and area
%           n - sample number 
%           new2 - vector consisting of elements of v where stress(n) is
%           less than the ultimate strength of listed materials 
%   outputs: strain1 - strain given E from Spec and stress
%            deformation1 - deformation (m) given length and strain

strain1=strain_calculation(stress,Spec,forcetype1,n,new2);
deformation1=strain1.*L(n);

end

function [strain1] = strain_calculation(stress,Spec,forcetype1,n,new2)

strain1=zeros(9,1);
for z=new2
    if forcetype1(n)==1
        E=Spec(:,1);
        strain1(z,1)=stress(n)./E(z);
    elseif forcetype1(n)==2
        E=Spec(:,1);
        strain1(z,1)=(-1).*(stress(n)./E(z));
    elseif forcetype1(n)==3
        G=Spec(:,2);
        strain1(z,1)=stress(n)./G(z);
    end
end
strain1;

end
