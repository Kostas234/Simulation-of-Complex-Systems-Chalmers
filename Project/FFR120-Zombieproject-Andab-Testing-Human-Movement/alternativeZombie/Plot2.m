load('plot2');
plot(stepRatio,time_array)
axis([min(stepRatio)-0.2 max(stepRatio)+0.2 min(time_array)-20 max(time_array)+20])
xlabel('Time')
ylabel('Step Ratio')