function [T_est] = duckPnp(p) 

% Pose Esitmation
% Uses Corke's RVC Tools 
% Nov. 9, 2016


calc_cam = CentralCamera('focal', 0.004, 'pixel', 10e-6, ...
    'resolution', [640 480], 'centre', [320 240]);

P = mkcube(0.04); % assume Duke is cub with 5cm sides
P = P(:,5:8);
p(:,5)=[];

try
 T_est = calc_cam.estpose(P,p);
catch
  % Keep making Pose estimates despite errors. For dev purposes.
end
    