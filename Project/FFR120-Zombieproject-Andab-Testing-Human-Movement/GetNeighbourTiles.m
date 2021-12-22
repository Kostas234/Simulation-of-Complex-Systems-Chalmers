%Returns the existing neighbour tiles for a given human.
function [neighbourTiles] = GetNeighbourTiles(human,gridSize)
x = human(1); y = human(2);
possibleTiles = [];
if x == 1
    if y == 1
        possibleTiles = [possibleTiles, [x+1,y]];
        possibleTiles = [possibleTiles, [x,y+1]];
        possibleTiles = [possibleTiles, [x+1,y+1]]; 
    elseif y == gridSize
        possibleTiles = [possibleTiles, [x+1,y]];
        possibleTiles = [possibleTiles, [x,y-1]];
        possibleTiles = [possibleTiles, [x+1,y-1]]; 
    else
        possibleTiles = [possibleTiles, [x+1,y+1]];
        possibleTiles = [possibleTiles, [x+1,y]];
        possibleTiles = [possibleTiles, [x+1,y-1]]; 
        
        possibleTiles = [possibleTiles, [x,y+1]];
        possibleTiles = [possibleTiles, [x,y-1]];
    end
elseif x == gridSize
    if y == 1
        possibleTiles = [possibleTiles, [x-1,y]];
        possibleTiles = [possibleTiles, [x,y+1]];
        possibleTiles = [possibleTiles, [x-1,y+1]];    
    elseif y == gridSize
        possibleTiles = [possibleTiles, [x-1,y]];
        possibleTiles = [possibleTiles, [x,y-1]];
        possibleTiles = [possibleTiles, [x-1,y-1]]; 
    else
        possibleTiles = [possibleTiles, [x-1,y+1]];
        possibleTiles = [possibleTiles, [x-1,y]];
        possibleTiles = [possibleTiles, [x-1,y-1]]; 
        
        possibleTiles = [possibleTiles, [x,y+1]];
        possibleTiles = [possibleTiles, [x,y-1]];
    end
else
    if y == 1
        possibleTiles = [possibleTiles, [x+1,y]];
        possibleTiles = [possibleTiles, [x+1,y+1]]; 
        
        possibleTiles = [possibleTiles, [x-1,y]];
        possibleTiles = [possibleTiles, [x-1,y+1]];
        possibleTiles = [possibleTiles, [x,y+1]]; 
    elseif y == gridSize
                possibleTiles = [possibleTiles, [x+1,y]];
        possibleTiles = [possibleTiles, [x+1,y-1]]; 
        
        possibleTiles = [possibleTiles, [x-1,y]];
        possibleTiles = [possibleTiles, [x-1,y-1]];
        possibleTiles = [possibleTiles, [x,y-1]]; 
    else
        possibleTiles = [possibleTiles, [x+1,y+1]];
        possibleTiles = [possibleTiles, [x+1,y]];
        possibleTiles = [possibleTiles, [x+1,y-1]];
        
        possibleTiles = [possibleTiles, [x,y+1]];
        possibleTiles = [possibleTiles, [x,y-1]];
        
        possibleTiles = [possibleTiles, [x-1,y+1]];
        possibleTiles = [possibleTiles, [x-1,y]];
        possibleTiles = [possibleTiles, [x-1,y-1]]; 
    end
end
    nrOfTiles = length(possibleTiles)/2;
    neighbourTiles = zeros(nrOfTiles,2);
    j = 0;
    for i = 1 :  nrOfTiles
        j = j + 1;
        neighbourTiles(j,1) = possibleTiles(2*i-1);
        neighbourTiles(j,2) = possibleTiles(2*i);
    end
end

