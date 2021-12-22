function [closestObstacle] = FindClosestObstacle(human,obstacles)
[obstacleX,obstacleY] = find(obstacles ==1);

nrOfObstacles = length(obstacleX);
shortestDistance = Inf;
closestObstacle = 0;
for i = 1 : nrOfObstacles
    distance = DistanceBetweenPoints(human,[obstacleX(i),obstacleY(i)]);
    if  distance < shortestDistance
        shortestDistance = distance;
        closestObstacle = [obstacleX(i),obstacleY(i)];
    end
end
end