function [x,t,DT,DR] = complexbox(N,dt,x0,R,T,eta,V,W,L)
kB = 1.38e-23;
gamma = 6*pi*R*eta;
DT = kB*T/gamma;
DR = 6*DT/(8*R^2);

x(1,:) = x0;
theta = 0;

for n = 1:1:N
% Translational diffusion step
x(n+1,:) = x(n,:) + sqrt(2*DT*dt)*randn(1,2);
% Rotational diffusion step
theta = theta + sqrt(2*DR*dt)*randn(1,1);% Torque step
theta = theta + dt*W;
% Drift step
x(n+1,:) = x(n+1,:) + dt*V*[cos(theta) sin(theta)];
% Boundary conditions: box vertical edge
if abs(x(n+1,1))>L/2
x(n+1,1) = sign(x(n+1,1))*(L-abs(x(n+1,1)));
end
% Boundary conditions: box horizontal edge
if abs(x(n+1,2))>L/2
x(n+1,2) = sign(x(n+1,2))*(L-abs(x(n+1,2)));
end
% Plot
cla
hold on
plot(x(1:n+1,1)*1e6,x(1:n+1,2)*1e6,'k')
plot(x(n+1,1)*1e6,x(n+1,2)*1e6,'o', ...
'MarkerEdgeColor','k', ...
'MarkerFaceColor','g')
fill(1e6*[-L L L -L -L]/2,1e6*[-L -L L L -L]/2, 'k', 'FaceAlpha', 0)
hold off
axis equal square
title(['velocity = ' num2str(V*1e6) ' \mum/s, ', ...
'angular velocity = ' num2str(W) ' rad/s, ', ...
'time = ', num2str(dt*(n+1)) ' s'])
xlabel('x [\mum]')
ylabel('y [\mum]')
box on
drawnow();
end
t = [0:dt:(N-1)*dt];