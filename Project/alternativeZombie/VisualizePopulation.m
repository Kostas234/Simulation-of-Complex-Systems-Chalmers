function [] = VisualizePopulation(humans,zombies,obstacles)
obstacles = obstacles .* 3;
zombies = zombies.* 2;
creatures = humans + zombies +obstacles;

if sum(creatures(:) == 3) > 0 
    map = [1, 1, 1
        0, 1, 0
        1, 0, 0
        0, 0, 0];

elseif sum(creatures(:) == 2) > 0 
    map = [1, 1, 1
        0, 1, 0
        1, 0, 0];
elseif sum(creatures(:) == 1) > 0 
    map = [1, 1, 1
        0, 1, 0];
else
    map = [1, 1, 1];
end
imagesc(creatures);
colormap(map);
pause(0.5);
end

