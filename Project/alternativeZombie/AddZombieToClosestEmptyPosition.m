function [newZombieGrid] = AddZombieToClosestEmptyPosition(x,y,zombieGrid)
newZombieGrid = zombieGrid;
[emptyX, emptyY] = find(zombieGrid == 0);
emptyPositions = [emptyX, emptyY];
closestEmptyPosition = FindClosestEmptyPosition(x,y,emptyPositions);
newZombieGrid(closestEmptyPosition(1),closestEmptyPosition(2)) = 1;
end

