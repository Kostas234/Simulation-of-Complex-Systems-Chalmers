function [newHumanGrid] = MoveHuman(humans,obstacles,zombies,human,sightRange)
newHumanGrid = humans;
if HumanIsAtObstacle(human,obstacles)
     zombiesInSightRadius = FindZombiesInSightRadius(human,zombies,sightRange);
    if ZombieIsInSight(human,zombiesInSightRadius,obstacles)
       closestZombie = FindClosestZombie(human,zombies,sightRange);
       newHumanGrid = MoveHumanAroundObstacle(human,humans,obstacles,zombies,closestZombie); 
    end
else
    closestObstacle = FindClosestObstacle(human,obstacles);
    if closestObstacle(1) ~= 0 && closestObstacle(2) ~= 0
    newHumanGrid = MoveHumanTowardsObstacle(zombies,humans,obstacles,human,closestObstacle);
    else
        closestZombie = FindClosestZombie(human,zombies,sightRange);
        if closestZombie(1) ~= 0 && closestZombie(2) ~= 0
           newHumanGrid =  moveHumanAwayFromZombie(human,zombie,humans,obstacles,zombies);
        else
            %Human stands still if there is no obstacles nor zombies in
            %sight. I.e nothing happens in this case.
        end
    end
end
end

