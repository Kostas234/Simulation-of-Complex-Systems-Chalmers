function [isInSight] = ZombieIsInSight(human,zombies,obstacles)
nrOfZombies = size(zombies,1);
isInSight = false;
for i = 1 : nrOfZombies
    if obstacleIsBlockingSight(human,zombies(i,:),obstacles)
        isInSight = true;
    end
end
end

