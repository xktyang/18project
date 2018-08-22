function [ gpa ] = GPA_xyang11(grades)
% ///XIN KAI YANG///GPA_xyang11 calculates final gpa for letter grades from user inputs
% input: grades- a string of letter grades
% output: gpa- the converted numerical credit hour grade
% grades(~cellfun('isempty',grades)) 
% cateconate
% q=length(grades);
% for i=1:q
%     if grades(1,i)==strcmpi(grades(1,i),'A')||strcmpi(grades(1,i),'B')||strcmpi(grades(1,i),'C')||strcmpi(grades(1,i),'D')||strcmpi(grades(1,i),'F')
%         grades(1,i)=grades(1,i);
%     else
%         grades(1,i)=[];
%     end
% end

k=length(grades);
n=zeros(1,k);
for i=1:k
    switch grades(1,i)
    case 'A'
         n(1,i)=4;
    case 'B'
         n(1,i)=3;
    case 'C'
         n(1,i)=2;
    case 'D'
         n(1,i)=1;
    case 'F'
         n(1,i)=1e-99;
    case ~'A' && ~'B' && ~'C' && ~'D' && ~'F'  
         n(1,i)=[];
    end
end

y=n>0;        
indices=n<=0;
y(indices)=[];      %removes unwanted strings

m=length(y);
gpa=sum(n)/m;
end
