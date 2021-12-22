function pathStats = CalculatePathStats(graph)

  graphSize = size(graph,1);
  numOfPaths = graphSize*(graphSize-1)/2;
  foundPaths = zeros(graphSize);
  
  averagePath = 0;
  diameter = 1;
  pathsFound = 0;
  paths=1;
  
  while pathsFound < numOfPaths
    paths = sign(paths*graph);
    paths(logical(eye(size(paths)))) = 0;
    paths((paths-foundPaths) <= 0 ) = 0;
    foundPaths = foundPaths + paths;
    numPathsFound = sum(sum(paths))/2;
    averagePath = averagePath + diameter*numPathsFound;
    pathsFound = pathsFound + numPathsFound;
    diameter = diameter + 1;
  end
  diameter = diameter - 1;
  averagePath = averagePath/numOfPaths;
  pathStats = [averagePath diameter];

end
