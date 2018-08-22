function [ BFP ] = BFP_xyang11(w,h,a,g)
% ///XIN KAI YANG/// BFP_xyang11 calculates body fat percentage of a person
% based on weight, height, age, and gender. 
% input: w-weight (in pounds)
%        h-height (in inches)
%        a-age (in years)
%        g-gender (male or female)
% output: BFP- the body fat percentage estimate
bmi=703*(w/(h^2));
BFP=(1.2*bmi)+(0.23*a)-(10.8*g)-0.54;
end