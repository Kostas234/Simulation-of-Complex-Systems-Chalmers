function [isInSight] = ZombieIsInSight(human,zombies,obstacles)
nrOfZombies = size(zombies,1);
hasFoundTarget = 0;
i = 1;
obstacleInTheWay = 0;
isInSight = false;
if(size(zombies,2) ~= 1)
 while(hasFoundTarget == 0 && i <= nrOfZombies)
      obstacleInTheWay = 0;
      [bLineX,bLineY] = Bresenham(human(1),human(2),zombies(i,1),...
      zombies(i,2),size(obstacles,1));
       
  
      %code for VisualizeRay
%       rayGrid = zeros(size(humanGrid,1));
%       for ind = 1:length(bLineX)
%         rayGrid(bLineX(ind),bLineY(ind)) = 1;
%       end
%       VisualizeRay(humanGrid,zombieGrid,obstaclegrid,rayGrid); 
%uncomment to see ray. Comment VisualizePopulation in Main.m first though.
      
      
      for ind = 1:length(bLineX)
        if(obstacles(bLineX(ind),bLineY(ind)) == 1)
          obstacleInTheWay = 1;
        end
      end
      if(obstacleInTheWay == 0)
          isInSight = true;
          hasFoundTarget = 1;
      end
      i = i + 1;
 end
end
end

