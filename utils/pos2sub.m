function [ijk] = pos2sub(map, pos, order)
% POS2SUB converts [x y z] position vectors into the subscripts [i, j, k]
% of the corresponding map voxels
%
% INPUTS:
%   pos - nx3 matrix of points; each row is an [x y z] position vector
%   map - map data structure loaded from a map textfile using load_map(...)
%   ijk - nx3 matrix of subscripts; each row is a set of subscripts
%         describing a voxel in the map
%   order - flag to use yxz ordering (from MEAM620). If not set as 1, use
%               default xyz ordering
%
% USAGE:
%   [ijk] = pos2sub(map, pos)    for MEAM520
%   [ijk] = pos2sub(map, pos, 1) for MEAM620
%
% NOTE: this function assumes pos is inside the map; bound checking must
%       be performed before calling

if nargin < 3
    order = 0;
end

[jik] = floor((pos - map.bound_th123(1:3))./map.res_th123) + 1;

if ~order
    ijk = [jik(:,1) jik(:,2) jik(:,3)];
else
    ijk = [jik(:,2) jik(:,1) jik(:,3)];
end