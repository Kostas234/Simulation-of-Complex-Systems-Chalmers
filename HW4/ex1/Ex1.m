clear;

numOfNodes = 1000;
probability = 0.4;
network = rand(numOfNodes);
network(network(:,:)<probability) = 1;
network(network(:,:)<1) = 0;
% transform the directed graph into undirected by ignoring
% the upper triangular adjacency matrix and delete the self-loops
network(triu(network,1)==0) = 0;
network = network + network';
network = sparse(network);

PlotGraph(network,numOfNodes);

distributions = zeros(numOfNodes);
predictions = zeros(1,numOfNodes);
numberEdges = sum(network);
for i = 1:numOfNodes
  distributions(i) = sum(numberEdges==(i-1));
end
distributions = distributions./numOfNodes;
range = (1:numOfNodes)-1;
n = numOfNodes;
k = 0:numOfNodes-1;
p = probability;
for j = 0:n-1
 predictions(j+1) = nchoosek((n-1),j)*p^j*(1-p)^(n-1-j);
end

figure;
plot(range,distributions)
hold on
plot(range,predictions)
legend('Distribution','Prediction')
hold off
