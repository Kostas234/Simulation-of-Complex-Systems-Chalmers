function [closestEmptyPosition] = FindClosestEmptyPosition(x,y,emptyPositions)
nrOfEmptyPositions = size(emptyPositions,1);
shortestDistance = Inf;
closestEmptyPosition = 0;
for i = 1 : nrOfEmptyPositions
    distance = DistanceBetweenPoints([x,y],emptyPositions(i,:));
    if  distance < shortestDistance
        shortestDistance = distance;
        closestEmptyPosition = emptyPositions(i,:);
    end
end
end

