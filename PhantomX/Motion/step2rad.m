function [rads] = step2rad(deg)
% step2rad: change from motor steps to radians
%   Takes in the desired stepper motor position and converts it to radians
%   for the joint configuration. See parameter, 'base.'
%   
%   Input(s): joint configuration in stepper motor position
%   Output(s): corresponding joint configuration in radians

deg = double(deg*0.29);
base = 149;
base2 = 232; % JS, use for vertical configuration
for i = 1:length(deg)
    if i == 3 
        deg(i) = -(deg(i) - base);    
% uncomment for vertical configuration **************************       
     elseif i == 4
         deg(i) = deg(i) - base2;

    else
        deg(i) = deg(i) - base;
    end
end

rads = deg*(pi/180);

