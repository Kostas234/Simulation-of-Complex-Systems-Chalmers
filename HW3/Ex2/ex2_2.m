numOfParticles = 100;
DT = 0.2;
DR = 0.1;
v = zeros(numOfParticles,1);
v(:,1) = 18;%randi([0 3],numOfParticles,1)*0.01;
dt = 0.01;
t = 1000;
x = zeros(numOfParticles ,t);
y = zeros(numOfParticles ,t);
theta = zeros(numOfParticles,t);
torque = zeros(numOfParticles,t);
torque_0 = 1;
R = 8;
rc = 1;
boxSide = 100;

x(1:numOfParticles,1) = randi([-(boxSide-R) boxSide-R],numOfParticles,1);
y(1:numOfParticles,1) = randi([-(boxSide-R) boxSide-R],numOfParticles,1);
theta(1:numOfParticles,1) = 2*rand(numOfParticles,1)*pi;
writerObj = VideoWriter('a2.avi'); % Name it.
writerObj.FrameRate = 60; % How many frames per second.
open(writerObj); 
particles = plot(x(:,1),y(:,1),'Marker','o','LineStyle', 'none',...
  'MarkerSize',R,'MarkerFaceColor','blue');
axis([-boxSide boxSide -boxSide boxSide])

W = 0; % omega
eta = 2*pi; % 2*pi 0.2*pi 0.02*pi
%ksi = randi([-1 1],1)*1/2*eta;
vHat = [v.*cos(theta(:,1)) v.*sin(theta(:,1))]/norm(v);
vHat(:,3) = 0;

for i = 2:t
  for n=1:numOfParticles
    for m = numOfParticles(numOfParticles~=n)
      rni = [[x(n,i-1) y(n,i-1)]-[x(m,i-1) y(m,i-1)],0];
      norm(rni);
      if norm(rni) < rc
        rniHat = rni/norm(rni);
        numerator = dot(vHat(n,:),rniHat);
        theSum = numerator/(norm(rni)^2);
        leftTerm=theSum*vHat(n,:);
        crossPrd = cross(leftTerm,rni);
        torque(n,i)=torque_0*dot(crossPrd,[0 0 1]);
      end
    end
  end
  theta(:,i) = theta(:,i-1) + sqrt(2*DR*dt)*randn()+dt*(eta*rand()-eta/2)+torque(:,i); % dt*W or ξ
  x(:,i) = x(:,i-1) + sqrt(2*DT*dt)*randn()+ v(:,1)*dt.*cos(theta(:,i));
  y(:,i) = y(:,i-1) + sqrt(2*DT*dt)*randn()+ v(:,1)*dt.*sin(theta(:,i));
  x(x>100)=-100;
  x(x<-100)=100;
  y(y>100)=-100;
  y(y<-100)=100;
  for n=1:numOfParticles
    for m = 1:numOfParticles(numOfParticles~=n)
      if norm([x(m,i) y(m,i)]-[x(n,i) y(n,i)])<(R*1.1)
        if x(m,i)>x(n,i)
          x(n,i)=x(n,i)-0.1;%(R*1.001-1.3*norm([x(m,i) y(m,i)]-[x(n,i) y(n,i)]))/2;
          x(m,i)=x(m,i)+0.1;%(R*1.001-1.3*norm([x(m,i) y(m,i)]-[x(n,i) y(n,i)]))/2;
        else
          x(n,i)=x(n,i)+0.1;%(R*1.001-1.3*norm([x(m,i) y(m,i)]-[x(n,i) y(n,i)]))/2;
          x(m,i)=x(m,i)-0.1;%(R*1.001-1.3*norm([x(m,i) y(m,i)]-[x(n,i) y(n,i)]))/2;
        end
        if y(m,i)>y(n,i)
          y(n,i)=y(n,i)-0.1;%(R*1.001-1.3*norm([x(m,i) y(m,i)]-[x(n,i) y(n,i)]))/2;
          y(m,i)=y(m,i)+0.1;%(R*1.001-1.3*norm([x(m,i) y(m,i)]-[x(n,i) y(n,i)]))/2;
        else
          y(n,i)=y(n,i)+0.1;%(R*1.001-1.3*norm([x(m,i) y(m,i)]-[x(n,i) y(n,i)]))/2;
          y(m,i)=y(m,i)-0.1;%(R*1.001-1.3*norm([x(m,i) y(m,i)]-[x(n,i) y(n,i)]))/2;
        end
      end      
    end
  end
  set(particles,'XData',x(:,i),'YData',y(:,i));
  drawnow
  frame = getframe(gcf); % 'gcf' can handle if you zoom in to take a movie.
  writeVideo(writerObj, frame);
end
close(writerObj); 