function xplus = g(x)
%--------------------------------------------------------------------------
% Project: Hybrid Feedback Control book
% Description: Jump map for Dubins model
% https://hybrid.soe.ucsc.edu/software
% http://hybridsimulator.wordpress.com/
% Filename: g.m
%--------------------------------------------------------------------------

% state
p1 = x(1);
p2 = x(2);
theta = x(3);
taux = x(4);

xplus = [p1; p2; theta; taux];
end