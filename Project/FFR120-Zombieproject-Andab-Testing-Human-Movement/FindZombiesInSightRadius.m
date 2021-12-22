function [zombiesInSight] = FindZombiesInSightRadius(human,zombies,sightRange)
zombiesInSight = [0,0];
nrOfZombies = size(zombies,1);
for i = 1 : nrOfZombies
    for j = 1 : nrOfZombies
        if zombies(i,j) == 1;
            zombieInSight = [i,j]
        end
    end
end
end

