global ns
ns=input('How many students would you like to input grades for?\n');
while ns<=0 || ns~=round(ns)
    ns=input('Please input an positive integer value for number of students:  ');
end
fprintf('You have %i student(s).\n',ns);
grades=zeros(ns,10);
for i=1:ns
    fprintf('For student #%i:\n',i);
    grades(i,1:10)=input('Enter this student''s grades as a row vector in this configuration: [HW grades, Midterm grades, Final exam grade]\n');
    while length(grades(i,:))<10 && length(grades(i,:))>10
            grades(i,1:10)=input('Please input all TEN grades as a row vector in this configuration: [HW grades, Midterm grades, Final exam grade]\n');
    end
    g=sprintf('%d ', grades(i,:));
    fprintf('The grades for student #%i: %s\n',i,g)  
end
R=grades;
G=fgrade_xyang11(R); 
for i=1:ns
    fprintf('Student #%i''s final grade is %.2f.\n',i,G(i,1));
end
  
