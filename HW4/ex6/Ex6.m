close all;
clear;
clc;

Network1;
network1=s;
Network2;
network2=s;
Network3;
network3=s;

graph1 = ListToGraph(network1, max(network1));
graph2 = ListToGraph(network2, max(network2));
graph3 = ListToGraph(network3, max(network3));

PlotGraph(graph1,size(graph1,1));
PlotGraph(graph2,size(graph2,1));
PlotGraph(graph3,size(graph3,1));
% 
% CalculateClusteringCoefficient(graph1)
% CalculateClusteringCoefficient(graph2)
% CalculateClusteringCoefficient(graph3)



% distributions1 = CalculateDegreeDistribution(graph1);
% range1 = (1:max(network1));
% 
% distributions2 = CalculateDegreeDistribution(graph2);
% range2 = (1:max(network2));
% 
% distributions3 = CalculateDegreeDistribution(graph3);
% range3 = (1:max(network3));
% loglog(range1, distributions1, range2, distributions2, range3, distributions3);
% 
CalculatePathStatistics(graph1)
CalculatePathStatistics(graph2)
CalculatePathStatistics(graph3)