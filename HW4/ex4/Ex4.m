clear;

smallWorldExample;
graph = A;

clusteringCoef = CalculateClusteringCoefficient(graph);
fprintf('Clustering coefficient: %.5f\n',clusteringCoef);
PlotGraph(graph,size(graph,1));