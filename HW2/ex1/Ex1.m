clear;
clc;

areaSize = 128;
area = zeros(areaSize);
growthRate = 0.001; % p
lightningRate = 0.01; % f
step = 0;
maxSteps = 1000;

while true
  % Generate Trees
  step = step + 1;
  newTrees = rand(areaSize);
  area(newTrees<growthRate & area == 0) = 1;
  % Lighting Strike
  if rand()<lightningRate
    x = randi(areaSize);
    y = randi(areaSize);
    if area(x,y) == 1
      area(x,y) = 2;
    end
  end
  
  % Spread Fire
  [fRow,fCol] = find(area == 2);
  for i = 1:size(fRow)
    area = Firespread(area,fRow(i),fCol(i));
    if(sum(area(:) == 2) > 1000)
      plotData(area);
    end
    area(area==2)=0;    
  end
  
  if step == maxSteps
    break;
  end
end

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

function plotData(area)
  areaSize = size(area,2);
  figure;
  [treeRow,treeCol]=find(area==1);
  [fireRow,fireCol]=find(area==2);
  scatter(treeRow,treeCol,'filled','s','MarkerEdgeColor','green',...
    'MarkerFaceColor','green');
  hold on
  scatter(fireRow,fireCol,'filled','s','MarkerEdgeColor','red',...
    'MarkerFaceColor','red');
  size(fireRow,1)
  if size(fireRow,1)>0
    title(['Burning cluster size: ',num2str(size(fireRow,1)),' trees']);
  end
  axis([0 areaSize 0 areaSize]);
  hold off
end
