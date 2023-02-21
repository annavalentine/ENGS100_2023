
%% I 
% Parameters
m = 0;
D = -0.001;
x = linspace(0, 5, 100);
t = linspace(0, 5, 100);
 
% Solve
sol = pdepe(...
    m,...
    @advectionEquation,....
    @initialCondition,...
    @boundaryConditions,...
    x,...
    t);
u = sol(:,:,1);
 
% Plot results

figure
image(sol)
colorbar

%%%%%%%%%%%%%%%%%%%%%%%%

function [c, f, s] = advectionEquation(x, t, u, dudx)
    a = x^3;
    b = 0.001; % Found through trial and error
    c = 1;
    f = -b*dudx;
    s = -a*dudx;
end

function [pl, ql, pr, qr] = boundaryConditions(xl, ul, xr, ur, t)
    pl = ul - 1;
    ql = 0;
    pr = ur - 1; 
    qr = 0;
end

function u0 = initialCondition(x)
    u0 = 1 / (1 + x^2);
end