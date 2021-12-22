clear all;

movingProbability = 0.9;
infectionRate = 0.9;
recoveryRate = 0.005;
numOfAgents = 1000;
gridSize = 100;
agentStatus = zeros(numOfAgents,3);
step = 0;
maxSteps = 1500;
sumAgentStatus = zeros(maxSteps,3);
color = ["blue","red","green"];

for i = 1:numOfAgents
  agentStatus(i,:) = [randi([1 gridSize]) randi([1 gridSize]) 1];
end

rAgent = randi([1 numOfAgents],1,0.1*numOfAgents);
agentStatus(rAgent,3) = 2;

while true
  step = step +1;
  for agent = 1:numOfAgents
    r = rand;
    if r<movingProbability
      move = randi([1 2]);
      agentStatus(agent, move) = agentStatus(agent, move) + randi([-1,1],1);
      agentStatus(agent, 1:2) = mod(agentStatus(agent,1:2)-1, gridSize)+1; %+1 to avoid position 0
    end  
  end
  
  gridStatus = cell(gridSize);
  for j = 1:numOfAgents
    x = agentStatus(j,1);
    y = agentStatus(j,2);
    gridStatus{x,y} = [gridStatus{x,y} j];
  end
  
  infectedAgents = agentStatus(agentStatus(:,3)==2,:);
  for k = 1:size(infectedAgents,1)
    x = infectedAgents(k,1);
    y = infectedAgents(k,2);
    for l = 1:length(gridStatus{x,y})
      if agentStatus(gridStatus{x,y}(l),3) == 1
        r = rand;
        if r < infectionRate
          agentStatus(gridStatus{x,y}(l),3) = 2;
        end
      end
    end
  end
  
  infectedAgents = agentStatus(agentStatus(:,3)==2,:);
  for l=1:size(agentStatus,1)
    m=rand;
    if agentStatus(l,3)==2 && m<recoveryRate
      agentStatus(l,3)=3;
    end
  end
  
  if step ==100
    for m=1:numOfAgents
      plot(agentStatus(m,1), agentStatus(m,2),'.','Color',color(agentStatus(m,3)),'MarkerSize',15);
      hold on
    end
    title('t=100');
    axis([0 gridSize+1 0 gridSize+1]);
    hold off
  end
  
  sumAgentStatus(step,1) = sum(agentStatus(:,3)==1);
  sumAgentStatus(step,2) = sum(agentStatus(:,3)==2);
  sumAgentStatus(step,3) = sum(agentStatus(:,3)==3);
  
  if sumAgentStatus(step,2)==0 | step == maxSteps
    break;
  end
end

figure;
plot(sumAgentStatus(:,1),'blue');
hold on
plot(sumAgentStatus(:,2),'red');
plot(sumAgentStatus(:,3),'green');
title(['d = ',num2str(movingProbability),', β = ',...
num2str(infectionRate),', γ = ',...
num2str(recoveryRate)]);
axis([0 step-1 0 numOfAgents]);
xlabel('Time Steps');
ylabel('Number of agents');
hold off
