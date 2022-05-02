close all
clear all
clc

f=@(x) abs(sin(x));

a=-2; b=4;
h=0.01;
x=[a:h:b];
x_int=[-2,-1.3,-pi/4,0,1,pi/2,2,3,4];
y_int=f(x_int);

p=polyfit(x_int,f(x_int),length(x_int));
y_fit=polyval(p,x);

y_fit_lin=interp1(x_int,y_int,x,'linear');
y_fit_cub=interp1(x_int,y_int,x,'cubic');
y_fit_spline=interp1(x_int,y_int,x,'spline');

plot(x,f(x),'b',x,y_fit,'r',x,y_fit_lin,'k--',x,y_fit_cub,'g',x,y_fit_spline,'c')

