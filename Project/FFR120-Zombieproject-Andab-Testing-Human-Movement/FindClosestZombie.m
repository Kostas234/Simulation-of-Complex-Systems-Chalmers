function [closestZombie] = FindClosestZombie(human,zombies,sightRange)
[zombiesX,zombiesY] = find(zombies == 1);
zombies = [zombiesX,zombiesY];
nrOfZombies = size(zombies(:,1));
shortestDistance = Inf;
closestZombie = 0;
for i = 1 : nrOfZombies
    distance = DistanceBetweenPoints(human,zombies(i,:));
    if  distance < shortestDistance
        shortestDistance = distance;
        closestZombie = zombies(i,:);
    end
end
end
