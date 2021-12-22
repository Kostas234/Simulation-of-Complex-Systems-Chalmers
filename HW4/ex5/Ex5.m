clear;

smallWorldExample
graph = A;

pathStats = CalculatePathStats(graph);
fprintf('Average path length is: %.5f\n',pathStats(1));
fprintf('Diameter is: %d\n',pathStats(2));
PlotGraph(graph,size(graph,1));
