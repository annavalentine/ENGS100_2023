clearvars; close all; clc

% example pdepe solution
Ti = 220; % K (T_0)
Th = 0; % K (T_l)
Tc = 280; % K (T_l)

K = 0.1; % kappa [length^2/time]

% definitions
x = linspace(0,10,50); % mesh with L=10
t = linspace(0,100,50); 
sol = pdepe(0,@(x,t,u,DuDx)pdedef(x,t,u,DuDx,K),@(x)pdeic(x,Ti),@(xl,ul,xr,ur,t)pdebc(xl,ul,xr,ur,t,Th,Tc),x,t);
u = sol(:,:,1);

figure
image(sol)
xlabel('x-position','interpreter','latex','fontsize',20)
ylabel('time','interpreter','latex','fontsize',20)
colorbar

%time = 5;
%time_index = round(interp1(t,1:length(t),time));
%plot(x,sol(time_index,:,1),'k','linewidth',2)
%set(gca,'ticklabelinterpreter','latex','fontsize',18)

% % % % % % % % % % % % % % % % % % % % % % %
function [c,f,s] = pdedef(x,t,u,DuDx,K)
c = 1;
f = K*DuDx;
s = 0;
end
% % % % % % % % % % % % % % % % % % % % % % %
function u0 = pdeic(x,c0)
u0 = c0;
end
% % % % % % % % % % % % % % % % % % % % % % %
function [pl,ql,pr,qr] = pdebc(xl,ul,xr,ur,t,cl,cr)
pl = ul-cl;
ql = 0;
pr = ur-cr;
qr = 0;
end
% % % % % % % % % % % % % % % % % % % % % % %