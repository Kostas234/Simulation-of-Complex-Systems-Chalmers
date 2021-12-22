function [newHumanGrid] = MoveHuman(humans,obstacles,zombies,human,sightRange)
newHumanGrid = humans;
if HumanIsAtObstacle(human,obstacles)
    zombiesInSight = FindZombiesInSightRadius(human,zombies,sightRange); 
    if ZombieIsInSight(human,zombies,obstacles)
       newHumanGrid = MoveHumanAroundObstacle(human,humans,obstacles,zombies); 
    end
else
    closestObstacle = FindClosestObstacle(zombie,humans,obstacles,sightRange);
    if closestObstacle(1) ~= 0 && closestObstacle(2) ~= 0
    newHumanGrid = MoveHumanTowardsObstacle(human,closestObstacle);
    else
        closestZombie = FindClosestZombie();
        if closestZombie(1) ~= 0 && closestZombie(2) ~= 0
           newHumanGrid =  moveHumanAwayFromZombie(human,zombie,humans,obstacles,zombies);
        else
            %Human stands still if there is no obstacles nor zombies in
            %sight. I.e nothing happens in this case.
        end
    end
end
end

