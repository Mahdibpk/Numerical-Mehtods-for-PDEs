clear all
close all
clc

f=@(x) x.^2+x;
a=0;
b=2;

% a
answer1=14/3;
imp1=(f(a+b))*(b-a);
itr1=(f(a)+f(b)/2)*(b-a);
isimp1=(f(a)+f(b)+4*f((a+b)/2))*((b-a)/6);

rel_err_imp1=abs(imp1-answer1)/answer1
rel_err_itr1=abs(itr1-answer1)/answer1
rel_err_isimp1=abs(isimp1-answer1)/answer1

% b
c=1;
answer2=5/6;
imp2=(f(a+c))*(c-a);
itr2=(f(a)+f(c)/2)*(c-a);
isimp2=(f(a)+f(c)+4*f((a+c)/2))*((c-a)/6);

rel_err_imp2=abs(imp2-answer2)/answer2
rel_err_itr2=abs(itr2-answer2)/answer2
rel_err_isimp2=abs(isimp2-answer2)/answer2


