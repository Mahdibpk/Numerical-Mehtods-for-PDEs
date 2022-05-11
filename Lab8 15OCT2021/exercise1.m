clear all
close all
clc

f=@(x) sin(x);

a=0;
b=pi;
n1=20;
h1=(b-a)/n1;
x1=[a:h1:b]' ;
xex=integral(f,a,b);

Itr1=sum(h1*(f(x1(2:end))+f(x1(1:end-1)))*0.5)
Isimp1=sum(h1/6*( f(x1(1:end-1)) +f(x1(2:end)) +4*f( (x1(1:end-1) +x1(2:end))/2 ) ))
err1= abs(Isimp1-xex)


n2=40;
h2=(b-a)/n2;
x2=[a:h2:b]' ;

Itr2=sum(h2*(f(x2(2:end))+f(x2(1:end-1)))*0.5)
Isimp2=sum(h2/6*( f(x2(1:end-1)) +f(x2(2:end)) +4*f( (x2(1:end-1) +x2(2:end))/2 ) ))

err2=abs(Isimp2-xex)
Irich=(4*Isimp2-Isimp1)/3
