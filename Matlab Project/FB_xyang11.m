function [ fseq ] = FB_xyang11(fb)
% ///XIN KAI YANG///FB_xyang11 calculates the value of the Fibonacci
% sequence in the nth position of the sequence where n=fb
% input: fb- the nth position in the Fibonacci sequence
% output: fseq- the value of the nth position in the Fibonacci sequence
% F1=0; F2=1; 
% fseq=F(fb-1)+F(fb-2)
if fb==1
     fseq=0;
 elseif fb==2
     fseq=1;
 else
     fseq=FB_xyang11(fb-1)+FB_xyang11(fb-2);   
end
end