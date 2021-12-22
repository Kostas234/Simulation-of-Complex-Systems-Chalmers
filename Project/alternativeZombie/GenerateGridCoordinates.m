function [xCoordinates,yCoordinates] = GenerateGridCoordinates(gridSize,nrOfPoints)
gridDimension = [gridSize, gridSize];
[xCoordinates,yCoordinates] = ind2sub(gridDimension,randperm(prod(gridDimension)));
xCoordinates = xCoordinates(1:nrOfPoints); yCoordinates(1:nrOfPoints);
end

