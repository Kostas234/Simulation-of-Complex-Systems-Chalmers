function [xCoordinates,yCoordinates,areaGrid] = GenerateGridCoordinates(gridSize,nrOfPoints,areaGrid)
  gridDimension = [gridSize, gridSize];
  [xCoordinates,yCoordinates] = ind2sub(gridDimension,randperm(prod(gridDimension)));
  for i = 1:gridSize
    if areaGrid(xCoordinates(i),yCoordinates(i))==1
      %disp(xCoordinates(i));
      %disp(yCoordinates(i));
      xCoordinates(i) = [];
      yCoordinates(i) = [];
    end
  end
  
  xCoordinates = xCoordinates(1:nrOfPoints);
  yCoordinates = yCoordinates(1:nrOfPoints);
  for k = 1:nrOfPoints
    areaGrid(xCoordinates(k),yCoordinates(k))=1;
  end
end
