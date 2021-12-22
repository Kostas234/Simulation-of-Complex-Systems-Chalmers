clear;

initialNodes = 7;
m = 7;
nodesToAdd = 3000;
totalNodes = initialNodes+nodesToAdd;

network = zeros(initialNodes)+1;
% transform the directed network into undirected by ignoring
% the upper triangular adjacency matrix and delete the self-loops
network(triu(network,1)==0) = 0; 
network = network + network';
network = sparse(network);

initialConnections = EdgeList(network);
numOfInitialEdges = size((initialConnections),1);
edgeList = zeros(nodesToAdd*m+numOfInitialEdges,2);
edgeList(1:numOfInitialEdges,:) = initialConnections;

for i=1:nodesToAdd
  newConnections = edgeList(edgeList ~= 0);
  numEdges = length(newConnections);
  
  % Calculate nodes to connect new nodes to
  for j = 1:m
    index = randi(numEdges);
    edgeList((i-1)*m+j+numOfInitialEdges,:) = [i+initialNodes newConnections(index)];
    numEdges = numEdges - length(newConnections(newConnections == newConnections(index)));
    newConnections = newConnections(newConnections ~= newConnections(index));
  end

end

graph = ListToGraph(edgeList, totalNodes);
PlotGraph(graph,size(graph,1));
numberEdges=sum(graph);
distributions = zeros(totalNodes,1);
for k = 1:totalNodes
 distributions(k) = sum(numberEdges==(k-1));
end
distributions = distributions./totalNodes;

predictions = zeros(totalNodes);
for l = 1:totalNodes
  predictions(l) = 2*m^2*(l-1)^(-2);
end

figure;
range = (1:totalNodes);
loglog(range, distributions, range, predictions);
legend('Generated','Theoretical');

function list = EdgeList(network)
  network = triu(network);
  list = zeros(sum(network(:)),2);
  add = 1;
  for i = 1:size(network,1)
    for j = 1:size(network,2)
      if network(i,j) == 1
        list(add,:) = [i j];
        add = add + 1;
      end
    end
  end
end

function graph = ListToGraph(edgeList,totalNodes)
  graph = zeros(totalNodes);
  edgeList = edgeList(edgeList ~= 0);
  edgeList  = reshape(edgeList,[],2); % 2 columns with edges of paths
  for i = 1:size(edgeList,1)
    x = edgeList(i,1); % start edge
    y = edgeList(i,2); % end edge
    graph(x,y) = 1;
    graph(y,x) = 1;
  end
end