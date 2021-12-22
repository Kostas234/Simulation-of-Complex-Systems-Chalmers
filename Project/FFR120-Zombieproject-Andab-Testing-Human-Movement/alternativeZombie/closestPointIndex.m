function indexOfClosestPoint2D = closestPointIndex(point2D,points2D)
n = size(points2D);
shortestDistance = inf;
indexOfClosestPoint2D = 1;
for i = 1:n
    distance = DistanceBetweenPoints(point2D,points2D(i,:));
    if(distance < shortestDistance)
        shortestDistance = distance;
        indexOfClosestPoint2D = i;
    end
end

