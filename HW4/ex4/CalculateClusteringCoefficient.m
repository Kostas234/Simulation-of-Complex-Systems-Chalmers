function coefficient = CalculateClusteringCoefficient(graph)
  numOfTriangles = trace(graph^3)/2;
  numOfTriples = sum(graph).*(sum(graph)-1)/2;
  numOfTriples = sum(numOfTriples);
  coefficient = numOfTriangles/numOfTriples;
end

