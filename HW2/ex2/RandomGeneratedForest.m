function burningTrees = RandomGeneratedForest( areaSize, numOfTrees )
  
  area = zeros(areaSize);
  treeSites = randperm(areaSize*areaSize, numOfTrees);
  area(treeSites) = 1;
  area = SetFire(area);
  burningTrees = sum(area(:) == 2);
end

