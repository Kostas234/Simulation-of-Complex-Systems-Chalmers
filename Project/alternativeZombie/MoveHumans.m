function [newHumanGrid] = MoveHumans(humanGrid,zombieGrid,obstacleGrid,stepLength,humanSight)
newHumanGrid = humanGrid;
[zombieX, zombieY] = find(zombieGrid == 1);
zombies = [zombieX, zombieY];

[obstacleX, obstacleY] = find(obstacleGrid == 1);
obstacles = [obstacleX, obstacleY];

[humanX, humanY] = find(humanGrid == 1);
for i = 1 : length(humanX)
    human = [humanX(i),humanY(i)];
    obstacle = FindClosestObstacle(human,obstacles);
    target = ChooseObstacle(human,zombies,obstacle,humanSight);
    if target==[Inf Inf]
      break;
    end
    newHumanGrid = MoveHuman(newHumanGrid,human,target,obstacle,obstacleGrid,stepLength);
end
end