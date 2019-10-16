function [path, num_expanded] = astar(map, start, goal)
% ASTAR Find the shortest path from start to goal.
%   PATH = ASTAR(map, start, goal) returns an mx6 matrix, where each row
%   consists of the configuration of the Lynx at a point on the path. The 
%   first row is start and the last row is goal. If no path is found, PATH 
%   is a 0x6 matrix. Consecutive points in PATH should not be farther apart
%   than neighboring voxels in the map (e.g. if 5 consecutive points in 
%   PATH are co-linear, don't simplify PATH by removing the 3 intermediate points).
% 
%   PATH = ASTAR(map, start, goal) finds the path using euclidean
%   distance to goal as a heuristic.
%
%   [PATH, NUM_EXPANDED] = ASTAR(...) returns the path as well as
%   the number of nodes that were expanded while performing the search.
%   
% INPUTS:
%   map     - the map object to plan in (cartesian map)
%   start   - 1x6 vector of the starting configuration
%   goal:   - 1x6 vector of the goal configuration


%% Prep Code

path = [];
num_expanded = 0;

% Optional but highly recommended
cmap = getCmap(map)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                  Algortihm Starts Here             %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%                  Algortihm Ends Here               %%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


end