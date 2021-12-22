function [humans,zombies,obstacles,nrOfObstacles] = InitializePopulation(gridSize,nrOfHumans,nrOfZombies,nrOfObstacles,obstacleDistance)
  
  humans = zeros(gridSize); 
  zombies = zeros(gridSize);
  obstacles = zeros(gridSize);
  areaGrid = zeros(gridSize);
  obstacleSize = 5; %10
  disp(['Obstacle Distance: ',num2str(obstacleDistance)])
  %obstacleDistance=10; %5+ for fixed(im=1,im=2), 2+ for random(im=3,im=4)
  
  im=1; % Number of different implementations 1-5
  % Implementations 1 and 2 dont use the nrOfObstacles variable but
  % the number of obstacles is determined by the grid size
  if im == 1 %%
  
  obstacleCoordinates = []; 
  for i = ceil(obstacleDistance/2):obstacleDistance:gridSize-floor(obstacleDistance/2)
    for j = ceil(obstacleDistance/2):obstacleDistance:gridSize-floor(obstacleDistance/2)
    obstacleCoordinates = [obstacleCoordinates;[i j]];
    obstacles(i,j)=1;
    areaGrid(i,j)=1;
    end
  end
  nrOfObstacles = sum(sum(areaGrid));
  for i = 1:nrOfObstacles
    for j = 1:obstacleSize
      r=randi([0;1],1);
      x = randi([-1 1],1)*r;
      y = randi([-1 1],1)*(1-r);
      if obstacleCoordinates(i,1)+x<gridSize+1 && obstacleCoordinates(i,1)+x>0 ...
      && obstacleCoordinates(i,2)+y<gridSize+1 && obstacleCoordinates(i,2)+y>0
        obstacles(obstacleCoordinates(i,1)+x,obstacleCoordinates(i,2)+y)=1;
        areaGrid(obstacleCoordinates(i,1)+x,obstacleCoordinates(i,2)+y)=1;
      end
    end
  end

  elseif im == 2 %%

  i=2;
  obstacleCoordinates = []; 
  while i<=gridSize
    j=2;
    while j<=gridSize
        obstacleCoordinates = [obstacleCoordinates;[i j]];
        obstacles(i,j)=1;
        areaGrid(i,j)=1;
        j=j+obstacleDistance+randi([-2 2],1);
    end
    i=i+obstacleDistance+randi([-2 2],1);
  end
  nrOfObstacles = sum(sum(areaGrid));
  for i = 1:nrOfObstacles
    for j = 1:obstacleSize
      r=randi([0;1],1);
      x = randi([-1 1],1)*r;
      y = randi([-1 1],1)*(1-r);
      if obstacleCoordinates(i,1)+x<gridSize+1 && obstacleCoordinates(i,1)+x>0 ...
      && obstacleCoordinates(i,2)+y<gridSize+1 && obstacleCoordinates(i,2)+y>0
        obstacles(obstacleCoordinates(i,1)+x,obstacleCoordinates(i,2)+y)=1;
        areaGrid(obstacleCoordinates(i,1)+x,obstacleCoordinates(i,2)+y)=1;
      end
    end
  end

  elseif im == 3 %%
  
  [obstacleXCoordinates,obstacleYCoordinates,areaGrid] = GenerateGridCoordinates(gridSize,nrOfObstacles,areaGrid);

  for i = 1:nrOfObstacles
    obstacles(obstacleXCoordinates(i),obstacleYCoordinates(i)) = 1;
    for j = 1:obstacleSize
      x = randi([-1 1],1);
      y = randi([-1 1],1);
      if obstacleXCoordinates(i)+x<gridSize+1 && obstacleXCoordinates(i)+x>0 ...
      && obstacleYCoordinates(i)+y<gridSize+1 && obstacleYCoordinates(i)+y>0
        obstacles(obstacleXCoordinates(i)+x,obstacleYCoordinates(i)+y)=1;
        areaGrid(obstacleXCoordinates(i)+x,obstacleYCoordinates(i)+y)=1;
      end
    end
  end
  
  end %%
  
  [humanXCoordinates,humanYCoordinates,areaGrid] = GenerateGridCoordinates(gridSize,nrOfHumans,areaGrid);
  %[zombieXCoordinates,zombieYCoordinates,areaGrid] = GenerateGridCoordinates(gridSize,nrOfZombies,areaGrid);
  i=1;
  for j=gridSize/2:-1:1
    if areaGrid(i,j)==0
        zombies(i,j)=1;
        areaGrid(i,j)=1;
        break;
    end
  end
  
  for i = 1 : nrOfHumans
    humans(humanXCoordinates(i),humanYCoordinates(i)) = 1;
  end
      
  %for i = 1:nrOfZombies
  %  zombies(zombieXCoordinates(i),zombieYCoordinates(i)) = 1;
  %end

  if im == 4 %%
  
 [obstacleXCoordinates,obstacleYCoordinates,areaGrid] = GenerateGridCoordinates(gridSize,nrOfObstacles,areaGrid);
 obstacles(obstacleXCoordinates(1),obstacleYCoordinates(1)) = 1;
 for i = 2:nrOfObstacles
   l=0;
   for j=1:i-1  
   if DistanceBetweenPoints([obstacleXCoordinates(i) obstacleYCoordinates(i)], ...
   [obstacleXCoordinates(j) obstacleYCoordinates(j)])>obstacleDistance
     %obstacles(obstacleXCoordinates(i),obstacleYCoordinates(i)) = 1;
     l=l+1;
   %else
     %nrOfObstacles=nrOfObstacles+1;
   %  continue;
   end
   end
   if l==i-1
          obstacles(obstacleXCoordinates(i),obstacleYCoordinates(i)) = 1;
   else
       nrOfObstacles=nrOfObstacles+1;
       continue;
   end
    r = randi([0 1],1);
    x = randi([-1 1],1);%*(1-r);
    y = randi([-1 1],1);%*r;
    for j = 1:obstacleSize
      r = randi([0 1],1);
      x = randi([-1 1],1)*(1-r);
      y = randi([-1 1],1)*r;
      if obstacleXCoordinates(i)+x<gridSize+1 && obstacleXCoordinates(i)+x>0 ...
      && obstacleYCoordinates(i)+y<gridSize+1 && obstacleYCoordinates(i)+y>0 ...
      && areaGrid(obstacleXCoordinates(i)+x,obstacleYCoordinates(i)+y)~=1
        obstacles(obstacleXCoordinates(i)+x,obstacleYCoordinates(i)+y)=1;
      end
    end
 end
  elseif im == 5
      
  [obstacleXCoordinates,obstacleYCoordinates,areaGrid] = GenerateGridCoordinates(gridSize,nrOfObstacles,areaGrid);

  for i = 1 : nrOfHumans
    humans(humanXCoordinates(i),humanYCoordinates(i)) = 1;
  end
      
  for i = 1:nrOfZombies
    zombies(zombieXCoordinates(i),zombieYCoordinates(i)) = 1;
  end
  
  for i = 1:nrOfObstacles
    obstacles(obstacleXCoordinates(i),obstacleYCoordinates(i)) = 1;
    %r = randi([0 1],1);
    %x = randi([-1 1],1);%*(1-r);
    %y = randi([-1 1],1);%*r;
    for j = 1:obstacleSize
      x = randi([-1 1],1);%*(1-r);
      y = randi([-1 1],1);%*r;
      if obstacleXCoordinates(i)+x<gridSize+1 && obstacleXCoordinates(i)+x>0 ...
      && obstacleYCoordinates(i)+y<gridSize+1 && obstacleYCoordinates(i)+y>0 ...
      && areaGrid(obstacleXCoordinates(i)+x,obstacleYCoordinates(i)+y)~=1
        obstacles(obstacleXCoordinates(i)+x,obstacleYCoordinates(i)+y)=1;
      end
    end
  end
      
  end %%
  
 
end