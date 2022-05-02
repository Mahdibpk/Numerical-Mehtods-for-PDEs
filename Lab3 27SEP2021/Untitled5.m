clear all
close all
clc

f=@(x) atan(2*x);
fp=@(x) 2/(4*(x.^2)+1);

a=-2;
b=2;
h1=0.1;
h2=0.05;
myx1=[a:h1:b]';
myx2=[a:h2:b]';
figure(1)

plot(myx2,f(myx2),'k',myx2,fp(myx2),'r')

fp_forward_1=zeros(length(myx1)-1);
fp_forward_1= (f(myx1(2:end))-f(myx1(1:end-1)))/(h1);

figure(2)
plot(myx1(1:end-1),fp_forward_1,'ko',myx1,fp(myx1),'r')












