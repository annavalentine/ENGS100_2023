%% PDEPE Problem 3
clc;
close all;
clearvars;  
% example pdepe solution
Ti = 0; % K
Th = 10; %K 
Tc = 0; %K 
v = .1;
Dval = -1; % diffusivity [length^2/time]
% definitions
x = linspace(1,10,256); % mesh with L=1
t = linspace(0,3,256); 
sol = pdepe(0,@(x,t,u,DuDx)pdedef(x,t,u,DuDx,Dval, v),@(x)pdeic(x,Ti),@(xl,ul,xr,ur,t)pdebc(xl,ul,xr,ur,t,Th,Tc),x,t);
time = 0;
time_index = round(interp1(t,1:length(t),time));
%plot(x,sol(time_index,:,1),'k','linewidth',2)
set(gca,'ticklabelinterpreter','latex','fontsize',18)
figure (1);
surf(x,t,sol(:,:,1),'edgecolor','none'); view(2); colorbar;
colormap autumn
title('PDEPE Soln, nx = 20')
xlabel('Distance x')
ylabel('Time t')
% % % % % % % % % % % % % % % % % % % % % % %
function [c,f,s] = pdedef(x,t,u,DuDx,Dval, v)
c = 1;
f = Dval;
s = v;
end
% % % % % % % % % % % % % % % % % % % % % % %
function u0 = pdeic(x,c0)
u0 = 2*sin(pi* x);
end
% % % % % % % % % % % % % % % % % % % % % % %
function [pl,ql,pr,qr] = pdebc(xl,ul,xr,ur,t,cl,cr) %this problem has no BC given, so lets just use same as heat eq
pl = ul-cl; 
ql = 0;
pr = ur-cr;
qr = 0;
end
