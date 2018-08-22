function y=fact(n)
% y=fact(n). This is a recursive program for
% computing y=factorial(n).
if n==0
    y=1;
    fprintf('STOP\n');
else
    fprintf('n is %i\n',n);
    y=n*fact(n-1);
    fprintf('n is %i, y is %i\n',n,y);
end
