% Using the for loop
clear all
close all
format long
clc

%Input
n=200;
x=zeros(1,n)';
e=zeros(1,n)';
x(1)=1;
a=5;
tolerance=1e-15;

for i=1:n
    x(i+1)=0.5.*(x(i)+a./x(i));
    e(i+1)=abs(x(i+1)-x(i));
    if e(i+1)<tolerance
        disp('done')
        break
    end
end

x(i:end)=[];
x
%% using the while loop

clear all
close all
format long
clc

%Input
n=200;
x=zeros(1,n)';
e=zeros(1,n)';
x(1)=1;
a=5;
tolerance=1e-15;
i=1;

while i<100
    x(i+1)=0.5.*(x(i)+a./x(i));
    e(i+1)=abs(x(i+1)-x(i));
    if e(i+1)<tolerance
        disp('done')
        break
    end
    i=i+1;
end
x(i:end)=[];
x
        
        
        
        
        
        
        
        
        
        
        