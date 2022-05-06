clear all
close all
clc

x=[0.18,0.3,0.5,0.6,0.72,0.75,0.8,0.9,1];
y=[0.0005,0.001,0.0013,0.0015,0.002,0.0045,0.006,0.007,0.0085];
n=length(x)-1;
x_check=[0.18:0.001:1];


%        a
p=polyfit(x,y,n);
y_int=polyval(p,x_check);

plot(x,y,'ro',x_check,y_int,'k')

%         b , c
y_int_linear=interp1(x,y,x_check,'linear');
y_int_cubic=interp1(x,y,x_check,'cubic');

hold on
plot(x_check,y_int_cubic,'k--',x_check,y_int_linear,'C')

%        e













