clear all;

movingProbability = 0.5;
infectionRate = 0.8;
infectionRateSize = length(infectionRate);
initialInfected = 0.1;
numOfAgents = 1000;
gridSize = 100;
agentStatus = zeros(numOfAgents,3);
step = 0;
maxSteps = 1500;
iterations = 10;
sumAgentStatus = zeros(maxSteps,3);
kRatioSteps = 10:5:130;
kRatioStepsSize = size(kRatioSteps,2);
finalAgentsRecovered = zeros(infectionRateSize,kRatioStepsSize);

for iInfectionRate = 1:infectionRateSize
  recoveryRate = infectionRate(iInfectionRate)./kRatioSteps;
  for iRecoveryRate=1:length(recoveryRate)    
  agentsRecovered = 0;
    for iter = 1:iterations

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
              if r < infectionRate(iInfectionRate)
                agentStatus(gridStatus{x,y}(l),3) = 2;
              end
            end
          end
        end
  
        infectedAgents = agentStatus(agentStatus(:,3)==2,:);
        for l=1:size(agentStatus,1)
          m=rand;
          if agentStatus(l,3)==2 && m<recoveryRate(iRecoveryRate)
            agentStatus(l,3)=3;
          end
        end
        sumAgentStatus(step,1) = sum(agentStatus(:,3)==1);
        sumAgentStatus(step,2) = sum(agentStatus(:,3)==2);
        sumAgentStatus(step,3) = sum(agentStatus(:,3)==3);
  
        if sumAgentStatus(step,2)==0 | step == maxSteps
          break;
        end
      end
      sumAgentStatus = sumAgentStatus/numOfAgents;
      agentsRecovered = agentsRecovered + sumAgentStatus(step,3);
    end
    agentsRecovered = agentsRecovered/iterations;
    finalAgentsRecovered(iInfectionRate,iRecoveryRate) = agentsRecovered
  end
end

save('test');

figure;
surf(kRatioSteps,infectionRate,finalAgentsRecovered);
title(['d = ',num2str(movingProbability)]);
xlabel('β/γ');
ylabel('β');
zlabel('R∞');

