function xdot = f(x)
%--------------------------------------------------------------------------
% Project: Hybrid Feedback Control book
% Description: Flow map for Dubins model
% https://hybrid.soe.ucsc.edu/software
% http://hybridsimulator.wordpress.com/
% Filename: f.m
%--------------------------------------------------------------------------

global vmax omegamax t1;

% state
p1 = x(1);
p2 = x(2);
theta = x(3);
taux = x(4);

% differential equations
p1dot = vmax*cos(theta);
p2dot = vmax*sin(theta);
if (taux > t1)
    thetadot = omegamax;
else
    thetadot = 0;
end
tauxdot = 1;
xdot = [p1dot; p2dot; thetadot; tauxdot];
end