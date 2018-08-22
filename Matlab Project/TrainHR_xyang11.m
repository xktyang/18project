function [trainHR,TR] = TrainHR_xyang11(gender ,age, restHR, fitness)
%Calculates appropriate Training Heart Rate
%   Input arguments
%   gender: Male or Female
%   age: # years old
%   restHR: heart rate (bpm) at rest
%   fitness: fitness level(low, med, or high)
%   Output arguments
%   trainHR: training heart rate (bpm)
if strcmpi(fitness,'low');
    fit=0.55;
elseif strcmpi(fitness,'med');
    fit=0.65;
else strcmpi(fitness,'high');
    fit=0.8;
end

if strcmpi(gender,'Male') | strcmpi(gender,'M')
    trainHR=fit*(220-age-restHR)+restHR;
elseif strcmpi(gender,'Female') | strcmpi(gender,'F')
    trainHR=fit*(206-(0.88*age)-restHR)+restHR;
else
    fprintf('Error, restart program.\n');
end
end

