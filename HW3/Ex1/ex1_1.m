N = 100;
numOfParticles = 4;
DT = 0.22;
DR = 0.16;
v = 0;
omega = 0.1;
phi = zeros(N,numOfParticles);
x = zeros(N,numOfParticles);
y = zeros(N,numOfParticles);
MSD = zeros(N,numOfParticles);
MSD(1,:) = [exp(-5) exp(-5) exp(-5) exp(-5)];
x0 = [-75 -75 75 75];
y0 = [-75 75 75 -75];
t = 0.01;
time = (1:N).*t;
iterations = 200;
sumX = x;
sumY = y;
sumMSD = MSD;

for k=1:iterations
  v=0;
  x = zeros(N,numOfParticles);
  y = zeros(N,numOfParticles);
  MSD = zeros(N,numOfParticles);
  MSD(1,:) = [exp(-5) exp(-5) exp(-5) exp(-5)];
  x0 = [-75 -75 75 75];
  y0 = [-75 75 75 -75];
  for i = 1:numOfParticles
    x(1,i) = x0(i);
    y(1,i) = y0(i);
    for j=2:N
      phi(j,i) = phi(j-1,i) + omega*(j*t) + sqrt(2*DR*(j*t))*randn();
      x(j,i) = x(j-1,i) + v*cos(phi(j-1,i))*(j*t) + sqrt(2*DT*(j*t))*randn();
      y(j,i) = y(j-1,i) + v*sin(phi(j-1,i))*(j*t) + sqrt(2*DT*(j*t))*randn();
      MSD(j,i) = (x(j,i)-x(1,i))^2 + (y(j,i)-y(1,i))^2;
    end
    v=i;
  end

  sumX = sumX + x;
  sumY = sumY + y;
  sumMSD = sumMSD + MSD;

  plot(x,y)
  hold on
  colors = ['b';'r';'y';'m'];
  for i = 1:numOfParticles
    scatter(x(N,i),y(N,i),'filled','MarkerFaceColor',colors(i));
  end
  legend('v=0','v=1','v=2','v=3','Location','north');
  xlabel('x[μm]')
  ylabel('y[μm]')
  hold off

end

sumX=sumX/iterations;
sumY=sumY/iterations;
sumMSD = sumMSD/iterations;

figure;
for i =1:4
  plot(log(time),log(sumMSD(:,i)))
  hold on 
  axis([-4 0.5 -2 10]);
  legend('v=0','v=1','v=2','v=3','Location','southeast');
  xlabel('log(t)')
  ylabel('log(MSD) [μm^2]')
end
hold off
