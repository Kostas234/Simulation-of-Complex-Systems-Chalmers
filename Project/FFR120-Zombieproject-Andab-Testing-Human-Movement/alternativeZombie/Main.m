clc; clear;

numberOfHumans = 20;%[10 15 20 25 30 35 40];
obstacleDistance = 9;%[5 7 9 11 13 15];
gridSize = 30;%[20 30 40 50 60 70];
timeArray = zeros(1,size(obstacleDistance,2));
iterations = 50;
averageTimeArray = zeros(iterations,size(obstacleDistance,2));
chooseSim = "obDist";
% if chooseSim == "nrOfH"
%   obstacleDistance = 10;
% elseif chooseSim == "obDist"
%   numberOfHumans = 20;
% end

for nrOfHumans= numberOfHumans
    k=1;
timeArray = zeros(1,size(obstacleDistance,2));
for obDist= obstacleDistance
for grdSize = gridSize
for it = 1:iterations
gridSize = grdSize;
%nrOfHumans = 50;
nrOfZombies = 1;
nrOfObstacles = 30;
stopTime = 500;
XEdge = stopTime;
YEdge = nrOfHumans;
zombieStepLength = 2; %3/4 -> 46, 2/3 -> 35
humanStepLength = 3;
sightRange = 10;
nrHumansOverTime = zeros(1,stopTime);
nrZombiesOverTime = zeros(1,stopTime);

[humans,zombies,obstacles,nrOfObstacles] = InitializePopulation(gridSize,nrOfHumans,nrOfZombies,nrOfObstacles,obDist);
figure1 = figure(1);
%figure2 = figure(2);
timePeriod = 1 : stopTime;
time = 1;

while sum(sum(humans==1)) > 0
    for t = 1 : zombieStepLength
    zombies = MoveZombies(humans,zombies,obstacles,1,sightRange);
    end
    [humans,zombies] = InfectHumans(humans,zombies);
    set(0,'CurrentFigure',figure1);
    for t = 1 : humanStepLength
    humans = MoveHumans(humans,obstacles,zombies,sightRange);
    end
    nrHumansOverTime(time) = sum(sum(humans));
    nrZombiesOverTime(time) = sum(sum(zombies));
    
    VisualizePopulation(humans,zombies,obstacles)
    sum(sum(humans==1))
     %{
     set(0,'CurrentFigure',figure2);
     cla
     hold on
     %axis([0,XEdge,0,YEdge])
     plot(nrHumansOverTime(1:time),'b-')
     plot(nrZombiesOverTime(1:time),'r-') %uncomment this to see
     %dissappearing zombie phenomenom
     
     %Cheatcode for demonstration:
     %plot(50-nrHumansOverTime(1:time),'r-')
     hold off
     drawnow update
      %}
     time = time + 1;
end
averageTimeArray(k,it) = time;
end
%%
zombies;
sum(sum(zombies == 1));
disp(['Nr of humans: ',num2str(nrOfHumans)]);
disp(['Nr of zombies: ',num2str(nrOfZombies)]);
disp(['Nr of obstacles: ',num2str(sum(sum(obstacles)))]);
disp(['Sight range: ',num2str(sightRange)]);
disp(['Time: ',num2str(time)])
%disp(['Number of humans converted to zombies: ',num2str(nrOfHumans - sum(sum(humans == 1)))]);
timeArray(1,k)=sum(averageTimeArray(k,:))/iterations;
k=k+1;
end
end
%{
plot(obstacleDistance,timeArray)
hold on
axis([0 obstacleDistance(size(obstacleDistance,2))+5 min(timeArray)-20 max(timeArray)+20])
xlabel("Distance between obstacles")
ylabel("Time")
hold on
%}
end
%hold off
% plot(numberOfHumans,timeArray)
% axis([0 numberOfHumans(size(numberOfHumans,2))+20 timeArray(size(timeArray,2))-20 timeArray(1)+20])
% xlabel("Number of Humans")
% ylabel("Time")

% plot(obstacleDistance,timeArray)
% axis([0 numberOfHumans(size(numberOfHumans,2))+20 timeArray(size(timeArray,2))-20 timeArray(1)+20])
% xlabel("Distance between obstacles")
% ylabel("Time")