function [newZombieGrid] = MoveZombies(humanGrid,zombieGrid,obstacleGrid,stepLength,zombieSight)
newZombieGrid = zombieGrid;
[humanX, humanY] = find(humanGrid == 1);
humans = [humanX, humanY];

[obstacleX, obstacleY] = find(obstacleGrid == 1);
obstacles = [obstacleX, obstacleY];

[zombieX, zombieY] = find(zombieGrid == 1);
for i = 1 : length(zombieX)
    zombie = [zombieX(i),zombieY(i)];
    obstacle = FindClosestObstacle(zombie,obstacles);
    target = ChooseTarget(zombie,humans,obstacle,zombieSight);
    if target==[Inf Inf]
      break;
    end
    newZombieGrid = MoveZombie(newZombieGrid,zombie,target,obstacle,obstacleGrid,stepLength);
end
end

