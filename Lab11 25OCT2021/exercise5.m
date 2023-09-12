clear
close all
clc

yp=@(t,y) -2*t*y;
y_ext=@(t) exp(-t.^2)/2;

tspan=[0 2];
y0=0.5;

option=odeset("RelTol",1e-10,"MaxStep",0.01);
[t,y]=ode45(yp,tspan,y0,option);

plot(t,y_ext(t),'k',t,y,'r*')

rel_err_2=norm(y-y_ext(t),2)./norm(y_ext(t),2)