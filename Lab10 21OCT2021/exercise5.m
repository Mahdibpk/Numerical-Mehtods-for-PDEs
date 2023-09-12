clear 
close all
clc

f=@(x) (2*x.^2-3*x-2)./(x-1);
fp=@(x) (- 2*x.^2 + 3*x + 2)./(x - 1).^2 + (4*x - 3)./(x - 1);

a=-3;
b=3;
xmesh=[a:0.002:b];
plot(xmesh,f(xmesh),'k')
grid on

phi1=@(x) (3*x.^2-5*x)./(x-1);
phi2=@(x) x-2+(x)./(x-1);

intg=1.2;
err=1;
counter=0;

while abs(err)>1e-8
    z=phi2(intg);
    err=abs(intg-z);
    intg=z;
    counter=counter+1;
end
z
counter

err2=1;
intg2=1.2;
counter2=0;

while abs(err2)>1e-8
    delta=-f(intg2)/fp(intg2);
    z1=intg2+delta;
    err2=f(z1);
    intg2=z1;
    counter2=counter2+1;
end
z1


    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    