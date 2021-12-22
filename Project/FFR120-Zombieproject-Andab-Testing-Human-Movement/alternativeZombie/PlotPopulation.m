function [] = PlotPopulation(humans,zombies)
[humansX, humansY] = find(humans == 1);
[zombiesX, zombiesY] = find(zombies == 1);
plot(humansX,humansY,'o','Color','blue');
hold on
plot(zombiesX,zombiesY,'o','Color','green');
drawnow

end

