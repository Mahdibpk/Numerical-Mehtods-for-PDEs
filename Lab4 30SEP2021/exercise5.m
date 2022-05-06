clear all
close all
clc

f=@(x) (1-x).^(1/5);

x=[0,0.1,0.2,0.5,0.7,0.8,1];
xmesh=[0:0.01:1];

y=f(x);
% plot(xmesh,f(xmesh),'k',x,y,'ro')
n=length(x)-1;

p=polyfit(x,y,n);
y_interpolation=polyval(p,xmesh);

figure(1)
plot(xmesh,y_interpolation,'k',xmesh,f(xmesh),'r')

abs_err=abs(f(xmesh)-y_interpolation);
rel_err_inf=norm(abs_err,inf)/norm(f(xmesh),inf);

figure(2)
semilogy(xmesh,abs_err,'b')
grid on


%%
clear all
close all
clc

f=@(x) (1-x).^(1/5);

x=[0,0.1,0.2,0.5,0.7,0.8];
xmesh=[0:0.01:1];

y=f(x);
% plot(xmesh,f(xmesh),'k',x,y,'ro')
n=length(x)-1;

p=polyfit(x,y,n);
y_interpolation=polyval(p,xmesh);

figure(1)
plot(xmesh,y_interpolation,'k',xmesh,f(xmesh),'r')

abs_err=abs(f(xmesh)-y_interpolation);
rel_err_inf=norm(abs_err,inf)/norm(f(xmesh),inf);

figure(2)
semilogy(xmesh,abs_err,'b')
grid on








