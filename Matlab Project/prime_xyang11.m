function [ pr ] = prime_xyang11(m,n)
% ///XIN KAI YANG///prime_xyang11 finds prime numbers between two values.
% input-m: lowest boundary
%       n: highest boundary
% output- pr: a vector containing all the primes between the boundaries m
% and n.
vector=m:1:n;
vp=isprime(vector);
primes=vp.*vector;
pr=primes(primes~=0);
end