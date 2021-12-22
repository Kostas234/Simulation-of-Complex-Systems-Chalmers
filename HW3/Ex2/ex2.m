N = 1000;
numOfParticles = 10;
DT = 0.22;
DR = 0.16;
v = 0;
omega = 0;
phi = zeros(N,numOfParticles);
x = zeros(N,numOfParticles);
y = zeros(N,numOfParticles);
x0 = [-75 -75 75 75 1 2 3 4 5 6];
y0 = [-75 75 75 -75 1 2 3 4 5 6];
t = 0.001;
time = (1:N).*t;
iterations = 200;

for i = 1:numOfParticles
  x(1,i) = x0(i);
  y(1,i) = y0(i);
  for j=2:N
    phi(j,i) = phi(j-1,i) + omega*(j*t) + sqrt(2*DR*(j*t))*randn();
    x(j,i) = x(j-1,i) + v*cos(phi(j-1,i))*(j*t) + sqrt(2*DT*(j*t))*randn();
    y(j,i) = y(j-1,i) + v*sin(phi(j-1,i))*(j*t) + sqrt(2*DT*(j*t))*randn();
    if x(j,i)>100
      x(j,i)=-100;
    elseif x(j,i)<-100
      x(j,i)=100;
    elseif y(j,i)>100
      y(j,i)=-100;
    elseif y(j,i)<-100
      y(j,i)=100;
    end
  end
  v=i;
end

figure;
dots = plot(x(1,:),y(1,:),'Marker','.','LineStyle', 'none',...
  'MarkerSize',12);
axis([-100 100 -100 100])

for l = 2:N
  set(dots,'XData',x(l,:),'YData',y(l,:));
  drawnow
  %plot(x(l,:),y(l,:),'Marker','.','LineStyle', 'none','MarkerSize',12)
  %colors = ['b';'r';'y';'m'];
  %for i = 1:numOfParticles
  %  scatter(x(N,i),y(N,i),'filled','MarkerFaceColor',colors(i));
  %end
end
