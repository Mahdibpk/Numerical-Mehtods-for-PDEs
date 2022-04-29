clear all
close all
format long
clc

a=-1;
b=1;
n=50;
h=(b-a)/n;
xmesh=[a:h:b];

f=@(x) 3*x.*log(x.^2+1);
df=@(x) 3*log(x.^2+1)+(6*x.^2)./(x.^2+1);

fxmesh=f(xmesh);
% plot(xmesh,f(xmesh),'k')

dfxmesh=zeros(size(xmesh));

for i=2:n
    dfxmesh(1,i)=(fxmesh(1,i+1)-fxmesh(1,i-1))./(2*h);
end

err=abs(df(xmesh)-dfxmesh);

figure(1)
plot(xmesh,fxmesh,'r',xmesh,df(xmesh),'bo')

figure(2)
plot(xmesh,df(xmesh),'r',xmesh,dfxmesh,'bo')

abs_error_2=norm(err,2)
abs_error_inf=norm(err,inf)
rel_error_2=norm(err,2)./norm(df(xmesh),2)
rel_error_inf=norm(err,inf)./norm(df(xmesh),inf)





