function [newHumanGrid] = MoveHumanTowardsObstacle(zombieGrid,humanGrid,obstacleGrid,human,obstacle)

newHumanGrid = humanGrid;
stepLength = 1;
if obstacle ~= 0 % No human targets available.

distanceX = abs(human(1) - obstacle(1));
distanceY = abs(human(2) - obstacle(2));
humanX = human(1);
humanY = human(2);
if distanceX > 0
    if stepLength >= distanceX
        humanX = obstacle(1);
    else
        humanX = humanX + sign(obstacle(1)- humanX); 
    end
end

if distanceY > 0 
    if stepLength >= distanceY
        humanY = obstacle(2);
    else
        humanY = humanY + sign(obstacle(2) - humanY);
    end
end
if humanGrid(humanX,humanY) == 1 
else
    newHumanGrid(obstacle(1),obstacle(2)) = 0;
    newHumanGrid(human(1),human(2)) = 0;
    newHumanGrid(humanX,humanY) = 1;
end   
end
end

