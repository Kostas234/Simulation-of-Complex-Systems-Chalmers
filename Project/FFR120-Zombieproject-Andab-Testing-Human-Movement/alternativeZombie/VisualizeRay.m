function [] = VisualizeRay(humans,zombies,obstacles,ray)

  obstacles = obstacles .* 3;
  zombies = zombies.* 2;
  ray = ray.*4;
  creatures = humans + zombies +obstacles +ray;
%   if sum(creatures(:) == 4) > 0 
%     map = [1, 1, 1
%           0, 1, 0
%           1, 0, 0
%           0, 0, 0
%           0, 0, 1];
%   elseif sum(creatures(:) == 3) > 0 
%     map = [1, 1, 1
%           0, 1, 0
%           1, 0, 0
%           0, 0, 0
%           0, 0, 1];
%   elseif sum(creatures(:) == 2) > 0 
%     map = [1, 1, 1
%           0, 1, 0
%           1, 0, 0];
%   elseif sum(creatures(:) == 1) > 0 
%     map = [1, 1, 1
%           0, 1, 0];
%   else
%     map = [1, 1, 1];
%   end
map = [1, 1, 1
          0, 1, 0
          1, 0, 0
          0, 0, 0
          0, 0, 1
          0, 0, 1];
  
  imagesc(creatures);
  colormap(map);
  pause(0.1);
  
end
