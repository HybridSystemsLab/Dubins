%--------------------------------------------------------------------------
% Project: Hybrid Feedback Control book
% Description: Dubins model
% https://hybrid.soe.ucsc.edu/software
% http://hybridsimulator.wordpress.com/
% Filename: run.m
% Set of simulation files created and edited by 
% Ricardo Sanfelice
%--------------------------------------------------------------------------

% initial conditions
p1_0 = 0;
p2_0 = 0;
theta_0 = pi/4;
taux_0 = 0;
x0 = [p1_0;p2_0;theta_0;taux_0];

% generate input
global vmax omegamax t1;
vmax = 1;
omegamax = 0.5;
t1 = 5;

% simulation horizon
TSPAN=[0 10];
JSPAN = [0 20];

% rule for jumps
% rule = 1 -> priority for jumps
% rule = 2 -> priority for flows
rule = 1;

options = odeset('RelTol',1e-6,'MaxStep',0.001);

% simulate
[t,j,x] = HyEQsolver(@f,@g,@C,@D,x0,TSPAN,JSPAN,rule,options,'ode23t');

% regenerate thetadot
maxindex = length(x(:,1));
taux = x(:,4);
for i =1:maxindex
if (taux(i) > t1)
    thetadot(i) = omegamax;
else
    thetadot(i) = 0;
end
end

% plot solution
figure(1) % position
clf
subplot(2,1,1), plot(t,x(:,3),'Linewidth',1)
grid on
%ylabel('theta')
%xlabel('t')
axis([0 10 0.5 3.5])
set(gca,'fontsize',17)
subplot(2,1,2), plot(t,thetadot,'Linewidth',1)
grid on
%ylabel('thetadot')
%xlabel('t')
axis([0 10 -0.5 1])
set(gca,'fontsize',17)
print -depsc -tiff -r300 Matlab-DubinsPosition

% plot phase plane
figure(2) % position
clf
%plotHarcColor(x(:,1),j,x(:,2));
plot(x(:,1),x(:,2),'Linewidth',1);
%xlabel('p1')
%ylabel('p2')
grid on
axis([-1 5 -1 8])
axis equal
hold on
plot(x(1,1),x(1,2),'*')
plot(x(maxindex,1),x(maxindex,2),'*')
set(gca,'fontsize',17)
print -depsc -tiff -r300 Matlab-DubinsPlanar