clear;
clc;

areaSize = 128;
area = zeros(areaSize);
growthRate = 0.1; % p
lightningRate = 1; % f
step = 0;
maxSteps = 1000;
numOfFires = 1;
maxNumOfFires = 1000;
fireStats = zeros(maxNumOfFires,2);

while true
  %VisualizeArea(area);
  % Generate Trees
  step = step + 1;
  newTrees = rand(areaSize);
  area(newTrees<growthRate & area == 0) = 1;
  % Lighting Strike
  if rand()<lightningRate
    x = randi(areaSize);
    y = randi(areaSize);
    if area(x,y) == 1
      fireStats(numOfFires,2) = sum(area(:) == 1);
      area(x,y) = 2;
    end
  end
  
  % Spread Fire
  [fRow,fCol] = find(area == 2);
  for i = 1:size(fRow)
    area = Firespread(area,fRow(i),fCol(i));
    
    if(sum(area(:) == 2) > 0)
      fireStats(numOfFires,1) = sum(area(:) == 2);
      %fireStats(numOfFires,2) = sum(area(:) == 1);
      numOfFires = numOfFires + 1;
    end
    
    area(area==2)=0;    
  end
  
  if numOfFires > maxNumOfFires
    break;
  end
end

tau = 1.15;
numOfFires = numOfFires - 1;

simulationRate = zeros(numOfFires,1);
syntheticData = zeros(numOfFires,1);

for i = 1:numOfFires
  simulationRate(i) = fireStats(i,1)/areaSize^2;
end

minFire = min(simulationRate);
for i = 1:numOfFires
  syntheticData(i) = minFire*(1-rand())^(-1/(tau-1));
end

simulationRate = sort(simulationRate,'descend');
syntheticData = sort(syntheticData,'descend');

ranking = (1:numOfFires)./numOfFires;
loglog(simulationRate,ranking,syntheticData,ranking);
title(['p = ',num2str(growthRate),', f = ',num2str(lightningRate),...
  ', tau = ',num2str(tau)]);
legend({'Simulation','Synthetic Data'},'Location','northeast');
xlabel('Relative fire size');
ylabel('cCDF');

function newArea = Firespread(area, fRow, fCol)
  areaSize = size(area,2);
  if area(mod(fRow,areaSize)+1,fCol) == 1
    area(mod(fRow,areaSize)+1,fCol) = 2;
    area = Firespread(area,mod(fRow,areaSize)+1,fCol);
  end
  if fRow == 1
    if area(areaSize,fCol) == 1
      area(areaSize,fCol) = 2;
      area = Firespread(area,areaSize,fCol);
    end
  elseif area(fRow-1,fCol) == 1
    area(fRow-1,fCol) = 2;
    area = Firespread(area,fRow-1,fCol);
  end
  if area(fRow,mod(fCol,areaSize)+1) == 1
    area(fRow,mod(fCol,areaSize)+1) = 2;
    area = Firespread(area,fRow,mod(fCol,areaSize)+1);
  end
  if fCol == 1
    if area(fRow,areaSize) == 1
      area(fRow,areaSize) = 2;
      area = Firespread(area,fRow,areaSize);
    end
  elseif area(fRow,fCol-1) == 1
    area(fRow,fCol-1) = 2;
    area = Firespread(area,fRow,fCol-1);
  end
  newArea=area;
end
