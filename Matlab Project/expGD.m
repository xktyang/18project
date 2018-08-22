function [ At ] = expGD( A0, At1, t1, t )
%expGD calculates exponential growth and decay
%   input: A0: primary quantity @ t=0
%          At1: quantity at time t1
%          t1: time t1
%          t: time t
%   output: At: quantity at time t
k=(1/t1)*log((At1)/A0);
At=A0*exp(k*t);

end

