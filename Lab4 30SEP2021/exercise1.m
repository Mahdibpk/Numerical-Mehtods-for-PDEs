clear all
close all
clc

f1=@(x) exp(x);
f2=@(x) x.*sin(x);
f3=@(x) x.^4+3*x.^3-2*x.^2+4;

x1=[-2:1:3];
x2=[0,1.5,2,2.5,4.5,5,5.5,7];
x3=[-3:1:3];

x1_check=[-2:0.001:3];
x2_check=[0:0.001:7];
x3_check=[-3:0.001:3];

y1=f1(x1);
y2=f2(x2);
y3=f3(x3);

figure(1)
subplot(3,1,1);plot(x1_check,f1(x1_check),'k')
subplot(3,1,2);plot(x2_check,f2(x2_check),'k')
subplot(3,1,3);plot(x3_check,f3(x3_check),'k')

n1=length(x1)-1;
n2=length(x2)-1;
n3=length(x3)-1;

p1=polyfit(x1,y1,n1);
p2=polyfit(x2,y2,n2);
p3=polyfit(x3,y3,n3);

y_fit1=polyval(p1,x1_check);
y_fit2=polyval(p2,x2_check);
y_fit3=polyval(p3,x3_check);

hold on
subplot(3,1,1);plot(x1_check,y_fit1,'r')
subplot(3,1,2);plot(x2_check,y_fit2,'r')
subplot(3,1,3);plot(x3_check,y_fit3,'r')

abs_err2=abs(y_fit2-f2(x2_check));
rel_err2=abs(y_fit2-f2(x2_check))/abs(f2(x2_check));

abs_err3=abs(y_fit3-f3(x3_check));


abs_err_2=norm(abs_err2,2)
rel_err_2=norm(abs_err2,2)/norm(f2(x2_check),2)

figure(2)
plot(x3_check,abs_err3)









