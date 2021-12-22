function [target] = ChooseTarget(zombie,humans,obstacle,zombieSight)
  closestHumans = FindClosestHuman(zombie,humans);
  closestHumansInSight = [0 0];
  for k = 1:size(closestHumans,1)
    distance = DistanceBetweenPoints(zombie,closestHumans(k,:));
    if distance<100%zombieSight
      closestHumansInSight(k,:) = closestHumans(k,:);
    end
  end
  if closestHumansInSight == 0
    target = [randi([0 50],1) randi([0 50],1)];
  else
    for i = 1:size(closestHumansInSight,1)
      for j = 1:size(obstacle,1)
        if closestHumansInSight(i,1)>=zombie(1) && (obstacle(j,1)<=zombie(1) || ...
        obstacle(j,1)>=closestHumansInSight(i,1) || obstacle(j,2)~=closestHumansInSight(i,2))
          target = closestHumansInSight(i,:);
        elseif closestHumansInSight(i,1)<=zombie(1) && (obstacle(j,1)>=zombie(1) || ...
        obstacle(j,1)<=closestHumansInSight(i,1) || obstacle(j,2)~=closestHumansInSight(i,2))
          target = closestHumansInSight(i,:);
        elseif closestHumansInSight(i,2)>=zombie(2) && (obstacle(j,1)<=zombie(2) || ...
        obstacle(j,2)>=closestHumansInSight(i,2) || obstacle(j,1)~=closestHumansInSight(i,1))
          target = closestHumansInSight(i,:);
        elseif closestHumansInSight(i,2)<=zombie(2) && (obstacle(j,2)>=zombie(2) || ...
        obstacle(j,2)<=closestHumansInSight(i,2) || obstacle(j,1)~=closestHumansInSight(i,1))
          target = closestHumansInSight(i,:);
        else
          target = [randi([0 50],1) randi([0 50],1)];
        end
      end
    end
  end
end

