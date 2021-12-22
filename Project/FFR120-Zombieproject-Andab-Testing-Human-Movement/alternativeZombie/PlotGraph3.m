obstacleDistance = [5 7 9 11 13 15];
load('line1.mat')
plot(obstacleDistance,timeArray)
hold on
title('Sight Range = 30')
axis([0 obstacleDistance(size(obstacleDistance,2))+5 20 max(timeArray)+20])
xlabel("Distance between obstacles")
ylabel("Time")
load('line2.mat')
plot(obstacleDistance,timeArray)
load('line3.mat')
plot(obstacleDistance,timeArray)
load('line4.mat')
plot(obstacleDistance,timeArray)
load('line5.mat')
plot(obstacleDistance,timeArray)
load('line6.mat')
plot(obstacleDistance,timeArray)
load('line7.mat')
plot(obstacleDistance,timeArray)
load('line1_1.mat')
plot(obstacleDistance,timeArray,'LineWidth',2)
load('line2_1.mat')
plot(obstacleDistance,timeArray,'LineWidth',2)
load('line3_1.mat')
plot(obstacleDistance,timeArray,'LineWidth',2)
load('line4_1.mat')
plot(obstacleDistance,timeArray,'LineWidth',2)
load('line5_1.mat')
plot(obstacleDistance,timeArray,'LineWidth',2)
load('line6_1.mat')
plot(obstacleDistance,timeArray,'LineWidth',2)
load('line7_1.mat')
plot(obstacleDistance,timeArray,'LineWidth',2)
legend('10','15','20','25','30','35','40','10','15','20','25','30','35','40')