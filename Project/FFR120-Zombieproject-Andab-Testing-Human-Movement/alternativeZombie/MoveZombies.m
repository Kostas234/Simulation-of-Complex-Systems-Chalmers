function [newZombieGrid] = MoveZombies(humanGrid,zombieGrid,obstacleGrid,stepLength,sightRadius)

  newZombieGrid = zombieGrid;
  [humanX, humanY] = find(humanGrid == 1);
  humans = [humanX, humanY];

  [obstacleX, obstacleY] = find(obstacleGrid == 1);
  obstacles = [obstacleX, obstacleY];

  [zombieX, zombieY] = find(zombieGrid == 1);
  for i = 1 : length(zombieX)
    zombie = [zombieX(i),zombieY(i)];
    closestObstacles = FindClosestObstacle(zombie,obstacles);
    target = ChooseTarget(zombie,humans,obstacleGrid,sightRadius,zombieGrid,humanGrid);
    %if target==[Inf Inf]
    %  break;
    %end
    for j = 1:stepLength
    newZombieGrid = MoveZombie(newZombieGrid,zombie,target,closestObstacles,obstacleGrid,1,humanGrid);
    end
  end
  
end
