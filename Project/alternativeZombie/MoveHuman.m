function [newHumanGrid] = MoveHuman(humanGrid,human,target,obstacle,obstacleGrid,stepLength)
  newHumanGrid = humanGrid;

  obstacleDistanceX = abs(human(1)-obstacle(1));
  obstacleDistanceY = abs(human(2)-obstacle(2));
  
  distanceX = abs(human(1) - target(1));
  distanceY = abs(human(2) - target(2));
  humanX = human(1);
  humanY = human(2);
  
  if distanceX > 0
    humanX = humanX+sign(target(1)-humanX)*stepLength;
  end
  
  if distanceY > 0
    humanY = humanY+sign(target(1)-humanY)*stepLength;
  end
  
  if distanceX<=2 && distanceY<=2
    humanX = target(1)-1;
    humanY = target(2)-1;
  end
  
  newHumanGrid(human(1),human(2))=0;
  newHumanGrid(humanX,humanY)=1;
end

