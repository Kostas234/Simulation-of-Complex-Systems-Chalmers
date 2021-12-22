function [newZombieGrid] = MoveZombie(zombieGrid,zombie,target,obstacle,obstacleGrid,stepLength)
newZombieGrid = zombieGrid;
if target ~= 0 % No human targets available.

  obstacleDistanceX = abs(zombie(1)-obstacle(1));
  obstacleDistanceY = abs(zombie(2)-obstacle(2));
    
  distanceX = abs(zombie(1) - target(1));
  distanceY = abs(zombie(2) - target(2));
  zombieX = zombie(1);
  zombieY = zombie(2);
  zX = zombie(1);
  zY = zombie(2);
  
  %if obstacleDistanceX>0
  %  if stepLength>=obstacleDistanceX
  %    zombieX = 
  %  else
  %    zombieX = zombieX + sign(
  
  if distanceX > 0
    %if obstacleDistanceX >distanceX
      if stepLength >= distanceX
        zombieX = target(1);
      else
        zombieX = zombieX + sign(target(1)- zombieX)*stepLength;
        %{
        for k = 1:size(obstacle,1)
          if zombieX == obstacle(k,1)
            if zombieX-1<obstacle(k,1)
              zombieX = zombieX - 1;
            else
              zombieX = zombieX + 1;
            end
          end
        end
        %}
      end
    %end
  end

  if distanceY > 0 
    %if obstacleDistanceY >distanceY
      if stepLength >= distanceY
        zombieY = target(2);
      else
        zombieY = zombieY + sign(target(2) - zombieY)*stepLength;
        %{
        for l = 1:size(obstacle,1)
          if zombieY == obstacle(l,2)
           if zombieY-1<obstacle(l,2)
              zombieY = zombieY - 1;
            else
              zombieY = zombieY + 1;
            end
          end
        end
        %}
      end
    %end
  end
  
  
  if obstacleGrid(zombieX,zombieY) == 1
      disp('skata');
      if obstacleGrid(zX,zombieY) == 1
        zombieY = zY;
        if obstacleGrid(zX+1,zombieY)==1
          zombieX = zX - 1;
        else
          zombieX = zX + 1;
        end
      elseif obstacleGrid(zombieX,zY) == 1
        zombieX = zX;
        if obstacleGrid(zombieX,zY+1)==1
          zombieY = zY - 1;
        else
          zombieY = zY + 1;
        end
      else
        if obstacleGrid(zX+1,zY)==1
          zombieX = zX;
          zombieY = zY + randi([-1;1],1);
        elseif obstacleGrid(zX,zY+1)==1
          zombieX = zX + randi([-1;1],1);
          zombieY = zY;
        end
      end
      newZombieGrid(zombie(1),zombie(2)) = 0;
      newZombieGrid(zombieX,zombieY) = 1;
      
  else
    newZombieGrid(zombie(1),zombie(2)) = 0;
    newZombieGrid(zombieX,zombieY) = 1;
  end   
end
end

