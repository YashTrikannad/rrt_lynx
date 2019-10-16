function [pos] = sub2pos(map, ijk, order)
% SUB2POS converts an [i j k] vector of subscripts to the world [x y z]
% position of the corresponding map voxel
%
% INPUTS
%   ijk - nx3 matrix of subscripts; each row is a set of subscripts
%         describing a voxel in the map
%   map - map data structure loaded from a map textfile using load_map(...)
%   pos - nx3 matrix of points; each row is an [x y z] position vector
%   order - flag to use yxz ordering (from MEAM620). If not set as 1, use
%               default xyz ordering
%
% USAGE:
%   [ijk] = pos2sub(map, pos)    for MEAM520
%   [ijk] = pos2sub(map, pos, 1) for MEAM620
%
% NOTE: this function assumes the give subscripts are within bounds of the
%       map matrix; bound checking must be performed before calling

if nargin < 3
    order = 0;
end

if ~order
    pos = ([ijk(:,1) ijk(:,2) ijk(:,3)] - 1).*map.res_th123 + map.bound_th123(1:3);
else
    pos = ([ijk(:,2) ijk(:,1) ijk(:,3)] - 1).*map.res_th123 + map.bound_th123(1:3);
end