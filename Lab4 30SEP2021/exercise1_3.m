close all
clear all
clc


f=@(x) x.^4+3*x.^3-2*x.^2+4;

a=-3; b=3;
n=4;
h=(b-a)/n;
myx=[a:h:b];
x_check=[a:0.01:b];

p=polyfit(myx,f(myx),n);
y_fit=polyval(p,x_check);

err=abs(y_fit-f(x_check));

plot(x_check,err)














