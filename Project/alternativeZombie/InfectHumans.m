function [newHumanGrid,newZombieGrid] = InfectHumans(humans,zombies)
newHumanGrid = humans;
newZombieGrid = zombies;

for x = 1 : size(humans,1)
    for y = 1 : size(humans,2)
        if humans(x,y) == 1 && zombies(x,y) == 1
            newHumanGrid(x,y) = 0;
            newZombieGrid = AddZombieToClosestEmptyPosition(x,y,newZombieGrid);
        end
    end
end
end

