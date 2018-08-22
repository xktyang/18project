clear; clc; close all;

dummy=@(x) exp((-1)*x.^2); %dummy anonymous function
ll=0; lu=3;  %ll=lower bound, lu=upper bound 
I=GaussQuad5ab_yang(dummy,ll,lu) 

%I also checked using limits of [-1,1], [2,3], [0,4]. 
%using integral(dummy, -1 (or another lower bound), 1 (or another upper bound)
% and quad(dummy, -1 (or another), 1 (or another). 