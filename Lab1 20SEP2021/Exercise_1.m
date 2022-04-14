clc
close all
clear all
format long

%Input
f=@(a,x) a.*exp(x);
f_apx=@(a,x) a.*(1+x+x.^2/2);
f_apx2=@(a,x) a.*(1+x+x.^2/2+x.^3/6+x.^4/24);

%Numerical
%1
abs_err_1=f(2,0.2)-f_apx(2,0.2)
rel_err_1=abs_err_1/f(2,0.2)
%2
abs_err_2=f(10^5,0.2)-f_apx(10^5,0.2)
rel_err_2=abs_err_2/f(10^5,0.2)
%3
abs_err_3=f(10^3,4)-f_apx(10^3,4)
rel_err_3=abs_err_3/f(10^3,4)
%4
abs_err_4=f(2,0.2)-f_apx2(2,0.2)
rel_err_4=abs_err_4/f(2,0.2)

abs_err_5=f(10^5,0.2)-f_apx2(10^5,0.2)
rel_err_5=abs_err_5/f(10^5,0.2)

abs_err_6=f(10^3,4)-f_apx2(10^3,4)
rel_err_6=abs_err_6/f(10^3,4)

