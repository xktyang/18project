function [ chang ] =CalcChange_xyang11( ch )
%CalcChange_xyang11 calculates the change in increment amounts based on
%pay.
%   Detailed explanation goes here
chang=zeros(1,6);
ch=ch;
chang(1,1)=fix(ch/10);
A=rem(ch,10);
chang(1,2)=fix(A/5);
B=rem(A,5);
chang(1,3)=fix(B/1);
C=rem(B,1);
chang(1,4)=fix(C/0.25);
D=rem(C,0.25);
chang(1,5)=fix(D/0.1);
E=rem(D,0.1);
chang(1,6)=fix(E/0.05);
change=chang;

end

