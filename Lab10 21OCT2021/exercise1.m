clear all
close all
clc

f=@(x) cos(5*x).*x.^(3/7);
fp=@(x) (3/7)*cos(5*x).*x.^(-4/7)-5*x.^(3/7).*sin(5*x);

% Newton
a=0;
b=2;
e=1e-11;
xmesh=[a:0.02:b];

plot(xmesh,f(xmesh),'b')
grid on
intg=0.8;
err=1;
counter=0;
while abs(err)>e
    delta=-f(intg)/fp(intg);
    z=intg+delta;
    err=f(z);
    intg=z;
    counter=counter+1;
    
end
Newton=z

% Bisection
ag=0.8;
bg=1.2;
midp=(ag+bg)/2;
err1=1;
counter2=0;

while abs(err1)>1e-11
    if f(ag)*f(midp)<0
        bg=midp;
    else
        ag=midp;
    end
    err1=f(midp);
    midp=(ag+bg)/2;
    counter2=counter2+1;
end

Bisection=[midp,err1]
    































