clear all
close all
clc

f=@(x) cos(x);

% a

a=-2; b=4;
n=6;
h=(b-a)/n;
myx1=[a:h:b];
myx2=[-2:0.01:4];

y_int=f(myx1);

p=polyfit(myx1,y_int,n);
y_fit=polyval(p,myx2);

abs_err_inf1=norm(abs(f(myx2)-y_fit),inf);
rel_err_inf1=abs_err_inf/norm(f(myx2),inf);


% b
myx3=[-1:((2+1)/6):2];
myx4=[-1:0.01:2];

pb=polyfit(myx3,f(myx3),n);
y_fit_2=polyval(pb,myx4);

abs_err_inf2=norm(abs(f(myx4)-y_fit_2),inf);
rel_err_inf2=abs_err_inf/norm(f(myx4),inf);

subplot(1,2,1)
plot(myx2,f(myx2),'k',myx2,y_fit,'r')
subplot(1,2,2)
plot(myx4,f(myx4),'k',myx4,y_fit_2,'r')




