clear all
close all
format long
clc

%Input
n=200;
a=16;
x=zeros(1,n)';
e=zeros(1,n)';
tolerance=1e-15;
x(1)=0.4;

%Numerical

for i=1:n
    x(i+1)=0.5.*x(i).*(3-a.*x(i).^2);
    e(i+1)=abs(x(i+1)-x(i))./(x(i))
    if e(i+1)<tolerance
        disp('DONE')
        break
    end
end
x(i:end)=[];
x

