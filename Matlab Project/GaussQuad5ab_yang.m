function [I] = GaussQuad5ab_yang(Fun,a,b)
%GaussQuad5ab_yang numerically calculates an integral w/ 5 pt Gauss
%Quadrature
%   Inputs: Fun- function to be evaluated
%           a- lower bound of the function
%           b- upper bound of the function
%   Outputs: I-evaulated integral using 5 pt Guass Quadrature

%Guass Quad 5pt constants
C1=0.2369269; C2=0.4786287; C3=0.5688889; C4=C2; C5=C1; % weight coeff
x1=-.90617985; x2=-.53846931; x3=0; x4=(-1)*x2; x5=(-1)*x1; %gauss pts

if a==-1 && b==1             %for -1 to 1, no transformation necessary
    x=[x1 x2 x3 x4 x5]; %vector composed of Gauss pts for 5 pt Gauss Quad
    fx=Fun(x);    %vector containing f(x) values calculated from Fun with x values of Gauss Quad.
    I=C1*fx(1,1)+C2*fx(1,2)+C3*fx(1,3)+C4*fx(1,4)+C5*fx(1,5);  %Formula for 5 pt Gauss Quad 
    
else         %transformation required for non [-1,1] boundaries
     x=[x1 x2 x3 x4 x5];   %vector containing Gauss pts 
     C=[C1 C2 C3 C4 C5];   %vector containing weight coefficients for 5 pt Gauss Quad.
% transX=(1/2).*(x.*(b-a)+a+b); Unused transformation for f(x) to f(t)
transdX=(1/2)*(b-a);         % transformation from dx to dt
I=0; %reset value of I for summation
for i=1:length(x)  %1:1:n, where n is n-point Guass Quadrature, length(x)=n inherent to n-pt Gauss Quad. 
    I=I+(C(i)*(transdX*Fun((1/2).*(x(i).*(b-a)+a+b))));    %summation of integral
end

end

