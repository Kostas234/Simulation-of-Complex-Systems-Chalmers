function PlotDistributions(fireStats, numOfFires, areaSize, growthRate, lightningRate )
  
  simulationRate = zeros(numOfFires,1);
  randomGeneratedForestRate = zeros(numOfFires,1);
  
  for i = 1:numOfFires
    simulationRate(i) = fireStats(i,1)/areaSize^2;
    randomGeneratedForestRate(i) = RandomGeneratedForest(areaSize,fireStats(i,2))/areaSize^2;
  end

  simulationRate = sort(simulationRate,'descend');
  randomGeneratedForestRate = sort(randomGeneratedForestRate,'descend');
  ranking = (1:numOfFires)./numOfFires;

  loglog(simulationRate,ranking,randomGeneratedForestRate,ranking);
  title(['p = ',num2str(growthRate),', f = ',num2str(lightningRate)]);
  xlabel('Relative fire size');
  ylabel('cCDF');
  legend({'Simulation','Random Forest of Similar Density'},'Location','southwest');

end

