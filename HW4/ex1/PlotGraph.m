function PlotGraph(network,numOfNodes)

  figure;
  radius = 10;
  angle = 0:2*pi/numOfNodes:2*pi;
  x = radius*cos(angle');
  y = radius*sin(angle');
  gplot(network, [x y]);
  axis([-radius-1 radius+1 -radius-1 radius+1])

end