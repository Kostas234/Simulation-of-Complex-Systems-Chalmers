function [isBlockingSight] = obstacleIsBlockingSight(human,zombie,obstacles)
xDifference = abs(human(1) - zombie(1));
yDifference = abs(human(2) - zombie(2));
isBlockingSight = true;

end

