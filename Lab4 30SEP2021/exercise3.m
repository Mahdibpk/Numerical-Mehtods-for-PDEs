clear all
close all
clc

f=@(x) exp(x)./(x.^5);
n=5;
x_interpol=linspace(3,15,n+1);
x_check=[3:0.01:15];

p=polyfit(x_interpol,f(x_interpol),n);
y_fit=polyval(p,x_check);

x_plot=[1:0.01:17];
plot(x_plot,f(x_plot),'b',x_plot,polyval(p,x_plot),'r')