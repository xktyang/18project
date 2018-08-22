function y=twoexp(n)
% y=twoexp(n). This is a recursive program for
% computing y=2ˆn .
% Program halts only if n is a nonnegative integer.
%Halts when n reaches 0
if n==0
    y=1;
    fprintf('STOP\n');
else
    fprintf('n is %i\n',n);
    y=2*twoexp(n-1);
    fprintf('n is %i, y is %i\n',n,y); 
end