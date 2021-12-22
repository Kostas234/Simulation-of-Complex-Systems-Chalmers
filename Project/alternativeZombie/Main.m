clc; clear;
gridSize = 50;
nrOfHumans = 50;
nrOfZombies = 1;
nrOfObstacles = 20;
zombieStepLength = 1;
humanStepLength = 2;
zombieSight = 10;
humanSight = 10;

[humans,zombies,obstacles] = InitializePopulation(gridSize,nrOfHumans,nrOfZombies,nrOfObstacles);

timePeriod = 1 : 500;

while sum(sum(humans==1)) > 0
    %zombies = MoveZombies(humans,zombies,obstacles,zombieStepLength,zombieSight);
    [humans,zombies] = InfectHumans(humans,zombies);
    humans = MoveHumans(humans,zombies,obstacles,humanStepLength,humanSight); 
    VisualizePopulation(humans,zombies,obstacles)
end


%%
%zombies
%sum(sum(zombies == 1))
disp(['Number of humans converted to zombies: ',num2str(nrOfHumans - sum(sum(humans == 1)))]);