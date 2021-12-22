function [isInSight] = IsInSight(human,zombie,sightRange)
isInSight = (distanceBetweenPoints(human,zombie) <= sightRange);
end

