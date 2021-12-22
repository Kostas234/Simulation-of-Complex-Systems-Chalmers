function [humans,zombies,obstacles] = InitializePopulation(gridSize,nrOfHumans,nrOfZombies,nrOfObstacles)
humans = zeros(gridSize); 
zombies = zeros(gridSize);
obstacles = zeros(gridSize);
[humanXCoordinates,humanYCoordinates] = GenerateGridCoordinates(gridSize,nrOfHumans);
[zombieXCoordinates,zombieYCoordinates] = GenerateGridCoordinates(gridSize,nrOfZombies); % Maybe not random?
[obstacleXCoordinates,obstacleYCoordinates] = GenerateGridCoordinates(gridSize,nrOfObstacles); % Maybe not random?

for i = 1 : nrOfHumans
    humans(humanXCoordinates(i),humanYCoordinates(i)) = 1;
end

for i = 1:nrOfZombies
    zombies(zombieXCoordinates(i),zombieYCoordinates(i)) = 1;
end

for i = 1:nrOfObstacles
    obstacles(obstacleXCoordinates(i),obstacleYCoordinates(i)) = 1;
    x = randi([-1 1],1);
    y = randi([-1 1],1);
    for j = 1:10
      if obstacleXCoordinates(i)+x<gridSize+1 && obstacleXCoordinates(i)+x>0 ...
      && obstacleYCoordinates(i)+y<gridSize+1 && obstacleYCoordinates(i)+y>0
        obstacles(obstacleXCoordinates(i)+x,obstacleYCoordinates(i)+y)=1;
      end
    end
end

end

