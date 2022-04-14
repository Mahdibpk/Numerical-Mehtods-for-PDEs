close all
clear all
format long
clc

% Input
k=[0:1:20];
h=10.^(-k);
func=(exp(h)-1)./h;


% Numerical
abs_err=abs(1-func);
semilogy(k,abs_err,'r*')


% so as we know that the floating points are rounded
% ans the accuracy is limited (10e-16), so if our clculation
% goes over this, our percision will decrees