% a-2

clear all
close all
clc


f=@(x,r) r.*x.^3.*sin(r.*x)-3*x.^2.*cos(r.*x)-r.*sin(r.*x);

r=10;
a=0;
b=1;

n=20;
h=(b-a)/n;
x=[a:h:b]';
xex=-1;

x_p=zeros(n,1);
x_n=zeros(n,1);
Igl=zeros(n,1);

for i=1:n
    
    x_p(i)= (x(i+1)+x(i))/2 + h/(2*sqrt(3));
    x_n(i)= (x(i+1)+x(i))/2 - h/(2*sqrt(3));
    
    Igl(i)= h*(f(x_p(i),r)+f(x_n(i),r))*0.5;
end

s_Igl=sum(Igl)
err=abs(xex-s_Igl)
% a-2


n2=40;
h2=(b-a)/n2;
x2=[a:h2:b]';
xex=-1;

x_p2=zeros(n2,1);
x_n2=zeros(n2,1);
Igl2=zeros(n2,1);

for i=1:n2
    
    x_p2(i)= (x2(i+1)+x2(i))/2 + h2/(2*sqrt(3));
    x_n2(i)= (x2(i+1)+x2(i))/2 - h2/(2*sqrt(3));
    
    Igl2(i)= h2*(f(x_p2(i),r)+f(x_n2(i),r))*0.5;
end

s_Igl2=sum(Igl2)
err2=abs(xex-s_Igl2)

pemperical=-log2(err2/err)

plot(x,f(x,r))
%% b

clear all
close all
clc


f=@(x,r) r.*x.^3.*sin(r.*x)-3*x.^2.*cos(r.*x)-r.*sin(r.*x);

r=100;
a=0;
b=1;

n=20;
h=(b-a)/n;
x=[a:h:b]';
xex=-1;

x_p=zeros(n,1);
x_n=zeros(n,1);
Igl=zeros(n,1);

for i=1:n
    
    x_p(i)= (x(i+1)+x(i))/2 + h/(2*sqrt(3));
    x_n(i)= (x(i+1)+x(i))/2 - h/(2*sqrt(3));
    
    Igl(i)= h*(f(x_p(i),r)+f(x_n(i),r))*0.5;
end

s_Igl=sum(Igl)
err=abs(xex-s_Igl)
% a-2


n2=40;
h2=(b-a)/n2;
x2=[a:h2:b]';
xex=-1;

x_p2=zeros(n2,1);
x_n2=zeros(n2,1);
Igl2=zeros(n2,1);

for i=1:n2
    
    x_p2(i)= (x2(i+1)+x2(i))/2 + h2/(2*sqrt(3));
    x_n2(i)= (x2(i+1)+x2(i))/2 - h2/(2*sqrt(3));
    
    Igl2(i)= h2*(f(x_p2(i),r)+f(x_n2(i),r))*0.5;
end

s_Igl2=sum(Igl2)
err2=abs(xex-s_Igl2)

pemperical=-log2(err2/err)

plot(x,f(x,r))
% 
% 
% چون دامنه زیاده و تایم اسپ کم اینجوری میشه
% تایم اسعتپ زیاذ بشه به 4 میل میکنه