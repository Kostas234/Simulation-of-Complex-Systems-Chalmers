clear;

numOfNodes = 20;
probability = 0.4;
conNeighbours = 4;

network = GenerateGraph(numOfNodes,conNeighbours);
network2=network;
PlotGraph(network,numOfNodes);

numOfEdges = numOfNodes*conNeighbours/2;

for i = 1:numOfEdges
  r = rand();
  if r < probability
    nodes = randperm(numOfNodes, 2);
    %smaller = min(nodes(1), nodes(2));
    %bigger = max(nodes(1), nodes(2));
    %network2(nodes(1),nodes(2))=1;
    %if nodes(1)<nodes(2)
      network(nodes(1), nodes(2)) = 1;
    %else
    %  network(nodes(2), nodes(1)) = 1;
    %end
  end
end

%network3=network;
%network = sign(network+network');
PlotGraph(network,numOfNodes);
%PlotGraph(network2,numOfNodes);
%PlotGraph(network3,numOfNodes);


function graph = GenerateGraph(numOfNodes,conNeighbours)
  graph = zeros(numOfNodes);
  for i=1:conNeighbours/2
    for j=1:numOfNodes
      x = i + j;
      if x > numOfNodes
        x = x - numOfNodes;
      end
      graph(x,j) = 1;
      x=j-1;
      if x<1
        x = x + numOfNodes;
      end
      graph(x,j) = 1;
    end
  end
end