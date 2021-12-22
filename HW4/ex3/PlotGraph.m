function PlotGraph(network,numOfNodes)
  radius = 10;
  angle = 0:2*pi/numOfNodes:2*pi;
  x = radius*cos(angle');
  y = radius*sin(angle');
  figure;
  gplot(network, [x y]);
  axis([-10-1 radius+1 -radius-1 radius+1])

end