function sortedPoints2D = sortByDistance(point2D,points2D)
%A = input('Enter numbers between [ ] separated by comma, i.e. [1,2,3,4]: ');

n = size(points2D,1);
if(n > 1)
    for i=1:n-1
        index = closestPointIndex(point2D,points2D(i:n,:)); 
        minIndex = index + i-1; 
        temp = points2D(i,:);
        points2D(i,:) = points2D(minIndex,:);
        points2D(minIndex,:) = temp;
    end
    sortedPoints2D = points2D;
else
    sortedPoints2D = points2D;
end

