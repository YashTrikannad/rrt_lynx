function [isCollided] = isRobotCollided(q, map)
% ISROBOTCOLLIDED Detect if a configuration of the Lynx is in collision
%   with any obstacles on the map.
%
% INPUTS:
%   q   - a 1x6 configuration of the robot
%   map - a map strucutre containing axis-aligned-boundary-box obstacles
%   robot - a structure containing the robot dimensions and joint limits
%
% OUTPUTS:
%   isCollided - a boolean flag: 1 if the robot is in collision, 0 if not.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                  Algortihm Starts Here             %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%  q = [0 0 0 0 0 0];
%  map = loadmap('example_map.txt');
% load('robot.mat')

link_thickness = 50;

%get x,y,z for all joints of lynx robot at configuration q
joint_pos = calculateFK_sol(q);

%end points of 5 line segments representing the 5 links
linePt1 = joint_pos(1:5, :);
linePt2 = joint_pos(2:6, :);

%number of obstacles in map
obstacles_size = size(map.obstacles);
obstacles_num = obstacles_size(1);

%initially no collisions
isCollided = 0;

%looping through all obstacles
for i=1:obstacles_num 
    
    obstacle = map.obstacles(i,:);
    
    %increasee size of obstacle in workspace to account for link thickness
    obstacle(1:3) = obstacle(1:3) - link_thickness;
    obstacle(4:6) = obstacle(4:6) + link_thickness;
    
    %array showing if any link collides with obstacle
    result = detectCollision(linePt1, linePt2, obstacle);
    
    %to check if any link collided with obstacle
    if any(result) == 1
        isCollided = 1;
        break
    end
end


    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                  Algortihm Ends Here               %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

end