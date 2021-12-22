clear all;

movingProbability = 0.5;
numOfAgents = 1;
gridSize = 100;
agentPosition = zeros(numOfAgents,2);

for i = 1:numOfAgents
  agentPosition(i,1:2) = [randi([1 gridSize]) randi([1 gridSize])];
end

for steps = 1:1000
  r = rand;
  for agent = 1:numOfAgents
    if r<movingProbability
      move = randi([1 2]);
      agentPosition(agent, move) = agentPosition(agent, move) + randi([-1,1],1);
      agentPosition(agent, 1:2) = mod(agentPosition(agent, 1:2), gridSize);
    end  
  end
  plot(agentPosition(agent,1), agentPosition(agent,2),'.','Color','blue');
  axis([0 gridSize 0 gridSize]);
  xlabel('x');
  ylabel('y');
  hold on
end
hold off