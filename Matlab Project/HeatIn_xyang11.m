function [HeatIndex] = HeatIn_xyang11(temperature, humidity)
%HeatIn_xyang11 Calculates heat index for temperatures>80 degrees
%Fahrenheit and relative humidity>40%
%   input arguments
%   temperature: degrees Fahrenheit of measured temperature
%   humidity: measured % relative humidity 
%   output arguments
%   HeatIndex: tha apparent temperature calculated from temperature and
%   humidity.
A=load('HW8_P5.txt');
C1=A(1,1); C2=A(2,1); C3=A(3,1); C4=A(4,1); C5=A(5,1); C6=A(6,1); C7=A(7,1); C8=A(8,1); C9=A(9,1);
HeatIndex=C1+C2*temperature+C3*humidity+C4*humidity*temperature+C5*(temperature^2)+C6*(humidity^2)+C7*(temperature^2)*humidity+C8*temperature*(humidity^2)+C9*(temperature^2)*(humidity^2);

end

