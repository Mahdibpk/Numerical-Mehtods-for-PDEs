clear all
close all
clc

f=@(x) exp(x)-2*x.^2;

a=-2;
b=4;
e=1e-10;

xmesh=[a:0.02:b];
plot(xmesh,f(xmesh))
grid on

options=optimset('TolFun',1e-8,'maxIter',1000);
xnuum1=fsolve(f,-2,options);
xnuum2=fsolve(f,1,options);
xnuum3=fsolve(f,2.5,options);

% Bisection

ag=-1;
bg=0;
midp=(ag+bg)/2;
err_b=1;
counter_b=0;

while abs(err_b)>e
    if f(ag)*f(midp)<0
       bg=midp;
    else
        ag=midp;
    end
    err_b=f(midp);
    midp=(ag+bg)/2;
    counter_b=counter_b+1;
end
Bisection=[counter_b,midp,err_b]

% Chole

ag=1;
bg=2;
intg=1.2;
err_c=1;
counter_c=0;

while abs(err_c)>10^-10;
    delta=-(bg-ag)*f(intg)./(f(bg)-f(ag));
    z=intg+delta;
    err_c=f(z);
    intg=z;
    counter_c=counter_c+1;
end
Chole=[counter_c,z,err_c]

% Secant

xk=2;
xk1=3;
err_S=1;
counter_s=0;

while abs(err_S)>e
    delta=-(xk-xk1)*f(xk)/(f(xk)-f(xk1));
    z=xk+delta;
    err_S=f(z);
    xk1=xk;
    xk=z;
    counter_s=counter_s+1;
end

Secant=[counter_s,z,err_S]

% Newton

fp=@(x) exp(x)-4*x;
intg=1;
err_n=1;
counter_n=0;

while abs(err_n)>e
    delta=-f(intg)/fp(intg);
    z=intg+delta;
    err_n=f(z);
    intg=z;
    counter_n=counter_n+1;
end

Newton=[counter_n,z,err_n]




















