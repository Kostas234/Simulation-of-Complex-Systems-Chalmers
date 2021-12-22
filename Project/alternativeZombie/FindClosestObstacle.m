function [closestObstacles] = FindClosestObstacle(zombie,obstacles)
  nrOfObstacles = size(obstacles,1);
  shortestDistance = Inf;
  closestObstacles = [];
  for i = 1:nrOfObstacles
    distance = DistanceBetweenPoints(zombie,obstacles(i,:));
    if distance<shortestDistance
      shortestDistance = distance;
      closestObstacles(i,:) = obstacles(i,:);
    end  
  end
end