function [isInAttackRange] = IsInAttackRange(human,zombie,attackRange)
isInAttackRange = (DistanceBetweenPoints(human,zombie) <= attackRange);
end

