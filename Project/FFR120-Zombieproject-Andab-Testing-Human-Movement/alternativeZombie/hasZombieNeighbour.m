function zombieBoolean = hasZombieNeighbour(x,y,zombieGrid)
zombieBoolean = 0;
xStart = x - 1;
if(xStart < 1)
    xStart = 1;
end
xEnd = x + 1;
if(xEnd > size(zombieGrid,1))
    xEnd = size(zombieGrid,1);
end

yStart = y - 1;
if(yStart < 1)
    yStart = 1;
end
yEnd = y + 1;
if(yEnd > size(zombieGrid,1))
    yEnd = size(zombieGrid,1);
end

for i = xStart:xEnd
    for j = yStart:yEnd
        if(zombieGrid(i,j) == 1)
            zombieBoolean = 1;
        end
    end
end
end