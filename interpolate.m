function [Q] = interpolate(q_curr, q_near)
% INTERPOLATE find intermediate configurations between q_curr and
% q_near. The interpolation is by a unit of 0.1
% INPUTS:
%   q_curr - randomly sampled configuration
%   q_near - nearest node to q from existing tree
%
% OUTPUTS:
%   Q - Nx3 matrix having all intermidiate configurations

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                  Algortihm Starts Here             %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% q_curr = [-100 0 0]
% q_near = [200 10 1]

Q = [];
for i=1:19
    x = q_curr(1) + i*(q_near(1) - q_curr(1))/20;
    y = q_curr(2) + i*(q_near(2) - q_curr(2))/20;
    z = q_curr(3) + i*(q_near(3) - q_curr(3))/20;
    Q = [Q; x y z];
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                  Algortihm Ends Here               %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end