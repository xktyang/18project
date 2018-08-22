function [cost] = Cost_Calc(V,Spec1,Spec2,n,new2)
%This function calculates the cost for the materials which meet the
%criteria stress<yield strength
%   inputs: V - volume (m^3) of the shape given the dimensions from user input
%           Spec1 - cost ($/kg) column in Spec data sheet 
%           Spec2 - density (g/cm^3) column in Spec data sheet
%           n - sample number
%           new2 - vector consisting of elements of v where stress(n) is
%           less than the ultimate strength of listed materials 
%   output: cost - cost in $ for selected materials 

cost=zeros(9,1);
for z=new2
    c=Spec1(z,1);
    density_gcm=Spec2(z,1);
    density_kgm=density_gcm*1e3;
    mass=V(n)*density_kgm;
    cost(z,1)=mass.*c;
end

end


