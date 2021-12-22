%Determine if any nearby tile is an obstacle, return true if that
%is the case, else false.
function [isAtObstacle] = HumanIsAtObstacle(human,obstacles)
gridSize = size(obstacles,1);
nearbyTiles = GetNeighbourTiles(human,gridSize);
nrOfTiles = size(nearbyTiles,1);
isAtObstacle = false;
for tile = 1 : nrOfTiles
    if obstacles(nearbyTiles(tile,1),nearbyTiles(tile,2)) == 1
        isAtObstacle = true;
    end
end
end

