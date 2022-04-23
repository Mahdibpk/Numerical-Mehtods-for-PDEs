% Prof way

clear  all
close all
clc


% Input
a=-3;
b=3;
n=200;
h=(b-a)/n;
xmesh=[a:h:b];
f=@(x) exp(-x.^2).*sin(2*x+1);
df=@(x) 2*exp(-x.^2).*cos(2*x+1)-2*x.*exp(-x.^2).*sin(2*x+1);
% plot(xmesh,f(xmesh),'b',xmesh,df(xmesh),'r')

fxmesh=f(xmesh);
dfxmesh=zeros(size(xmesh)-1);

 for i=1:n
     dfxmesh(1,i)=(f(xmesh(1,i+1))-f(xmesh(1,i)))/h;
 end

 err=abs(dfxmesh-df(xmesh(1:end-1)));
 
 
figure(1)
subplot(3,1,1);plot(xmesh(1:end-1),dfxmesh,'r-*',xmesh,df(xmesh),'b')
subplot(3,1,2);semilogy(xmesh(1:end-1),err,'k')
subplot(3,1,3);plot(xmesh(1:end-1),err,'k')

abs_error_2=norm(err,2)
abs_error_inf=norm(err,inf)
rel_error_2=abs_error_2/norm(df(xmesh),2)
rel_error_inf=abs_error_inf/norm(df(xmesh),2)
 
 
 
