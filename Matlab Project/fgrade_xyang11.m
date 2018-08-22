function [ G ] = fgrade_xyang11(R)
% ///XIN KAI YANG///fgrade_xyang11 calculates final grades for students from user inputs
% input: R- a [number of students, 10] size matrix of grades
% output: G- the final grades in a [ns, 1] size matrix
global ns
hwg=zeros(ns,6);   %HW grade calculation
hwgd=zeros(ns,5);
for i=1:ns
    hwg(i,:)=sort(R(i,1:6));
end
for i=1:ns   %drops lowest hw
    hwgd(i,:)=hwg(i,2:6);
end
hwsum=sum(hwgd');
hwavg=hwsum/5; %or length(hwgd(1,:))
hwperc=(hwavg*10).*0.15; %gets point fraction out of 100 (for final grade) from hw
%%%%END HW GRADE CALCULATION  hwavg gives each student's hw avg in each
%%%%column 
mid=zeros(ns,3);
for i=1:ns
   mid(i,:)=R(i,7:9);
end
midsum=sum(mid');
midavg=(midsum/3);
%%%% END MIDTERM GRADE CALCULATIONS 
final=zeros(ns,1);
for i=1:ns
    final(i,:)=R(i,10);
end
finalt=final';
%%%% END FINAL GRADE MATRIX
% comp=midavg>finalt;
% compa=midavg.*(comp);
testgrade=zeros(ns,1);
for i=1:ns
if midavg(1,i)>finalt(1,i)
    testgrade(i,1)=0.85*midavg(1,i);
else 
    testgrade(i,1)=(0.45*midavg(1,i))+(0.4*finalt(1,i));
end
end
K=zeros(1,ns);
for i=1:ns
    K(1,i)=hwperc(1,i)+testgrade(i,1);
end
G=K';
end

