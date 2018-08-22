function [hmax, dmax] = trajectory(v0,theta)
%trajectory: calculates max height and distanec of a projectile and makes plot
%inputs:
% v0: initial velocity in m/s
% theta: angle in degrees
%outputs:
% hmax: max height in m
% dmax: max distance in m
v0x=v0*cosd(theta);
v0y=v0*sind(theta);
g=9.81;
thmax=v0y/g;
hmax=v0y^2/(2*g);
dmax=v0x*2*thmax;
t=0:0.1:2*thmax; %or can use linspace
x=v0x*t;
y=v0y*t-0.5*g*t.^2;

plot(x,y);
title('X'); xlabel('x'); ylabel('y');
%[h,d]=trajectory(230,39)
end