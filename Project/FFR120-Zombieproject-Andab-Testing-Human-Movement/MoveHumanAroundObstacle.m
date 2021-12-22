function [newHumanGrid] = MoveHumanAroundObstacle(human,humans,obstacles,zombies,closestZombie)
closestZombie
newHumanGrid = humans;
gridSize = size(humans,1);
possibleNewPositions = GetNeighbourTiles(human,gridSize);
nrOfPossiblePositions = size(possibleNewPositions,1);
orderOfPossiblePositions = randsample(1:nrOfPossiblePositions,nrOfPossiblePositions);
changedPos = false;
for i = 1 : nrOfPossiblePositions
     x = possibleNewPositions(orderOfPossiblePositions(i),1);
     y = possibleNewPositions(orderOfPossiblePositions(i),2);
     if humans(x,y) ~= 1 && obstacles(x,y) ~= 1 && zombies(x,y) ~= 1 && HumanIsAtObstacle([x,y],obstacles) 
         if ~ZombieIsInSight([x,y],zombies,obstacles)
         newHumanGrid(human(1),human(2)) = 0;
         newHumanGrid(x,y) = 1;
         changedPos = true;
         break;
         end 
     end    
 end

 maxDistance = -Inf;
 newX = 0;
 newY = 0;
 if changedPos == false
     for i = 1 : nrOfPossiblePositions
         x = possibleNewPositions(i,1);
         y = possibleNewPositions(i,2);
         if newHumanGrid(x,y) ~= 1 && obstacles(x,y) ~= 1 && zombies(x,y) ~= 1 %&& HumanIsAtObstacle([x,y],obstacles)
             distance = DistanceBetweenPoints([x,y],closestZombie);
             if distance > maxDistance
                 maxDistance = distance;
                 newX = x;
                 newY = y;
             end
         end
     end
 end

if newX ~= 0 && newY ~= 0
        newHumanGrid(human(1),human(2)) = 0;
        newHumanGrid(newX,newY) = 1;
end

end

