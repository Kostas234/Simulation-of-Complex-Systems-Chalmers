function [target] = ChooseTarget(zombie,humans,obstaclegrid,sightRadius,zombieGrid,humanGrid)
%   closestHumans = FindClosestHuman(zombie,humans,sightRadius);
%   for i = 1:size(closestHumans,1)
%       [bLineX,bLineY] = Bresenham(zombie(1),zombie(2),closestHumans(i,1),...
%       closestHumans(i,2));
%     for j = 1:size(obstacle,1)
%       for k = 1:size(bLineX)
%         if obstacle(j,:) ~= [bLineX(k),bLineY(k)]
%           target = closestHumans(i,:);
%         end
%       end
%     end
%   end
closestHumans = FindClosestEnemy(zombie,humans,sightRadius);
hasFoundTarget = 0;
numberOfHumansInSight = size(closestHumans,1);
humansIsInSight = size(closestHumans,2) == 2;
i = 1;
obstacleInTheWay = 0;
%target = [randi([0 50],1),randi([0 50],1)];
target = [-1,-1];
 while(hasFoundTarget == 0 && i <= numberOfHumansInSight && humansIsInSight)
      obstacleInTheWay = 0;
      [bLineX,bLineY] = Bresenham(zombie(1),zombie(2),closestHumans(i,1),...
      closestHumans(i,2),size(zombieGrid,1));
       
%       code for VisualizeRay
%       rayGrid = zeros(size(humanGrid,1));
%       for ind = 1:length(bLineX)
%         rayGrid(bLineX(ind),bLineY(ind)) = 1;
%       end
%       VisualizeRay(humanGrid,zombieGrid,obstaclegrid,rayGrid); 
%uncomment to see ray. Comment VisualizePopulation in Main.m first though.
            
      for ind = 1:length(bLineX)
        if(obstaclegrid(bLineX(ind),bLineY(ind)) == 1)
          obstacleInTheWay = 1;
        end
      end
      if(obstacleInTheWay == 0)
          target=closestHumans(i,:);
          hasFoundTarget = 1;
      end
      i = i + 1;
 end
end
