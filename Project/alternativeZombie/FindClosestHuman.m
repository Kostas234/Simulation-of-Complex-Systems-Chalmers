function [closestHumans] = FindClosestHuman(zombie,humans)
nrOfHumans = size(humans(:,1));
shortestDistance = Inf;
closestHuman=0;
closestHumans = [];%zeros(nrOfHumans(1),2);
for i = 1 : nrOfHumans
    distance = DistanceBetweenPoints(zombie,humans(i,:));
    if  distance < shortestDistance
        shortestDistance = distance;
        closestHumans(i,:) = humans(i,:);
        closestHuman = humans(i,:);
    end
end
end

