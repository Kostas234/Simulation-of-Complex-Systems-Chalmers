function [zombiesInSight] = FindZombiesInSightRadius(human,zombies,sightRange)
nrOfZombies = size(zombies,1);
zombiesInSightX = [];
zombiesInSightY = [];
z = 1;
for i = 1 : nrOfZombies
    for j = 1 : nrOfZombies
        if zombies(i,j) == 1 && DistanceBetweenPoints([i,j],human) < sightRange
            zombiesInSightX = [zombiesInSightX i];
            zombiesInSightY = [zombiesInSightY j];
            z = z + 1;
        end
    end
end
zombiesInSight = zeros(length(zombiesInSightX),2);
zombiesInSight(:,1) = zombiesInSightX;
zombiesInSight(:,2) = zombiesInSightY;
end

