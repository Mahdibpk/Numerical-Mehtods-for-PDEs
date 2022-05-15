clear all
close all
format short
clc

f=@(x) x.^2-x+1-exp(-x);
fp=@(x) 2.*x+exp(-x)-1;
a=-2 ;
b=1  ;
e=1e-12;
xmesh=[a:0.02:b];

plot(xmesh,f(xmesh))
grid on

%   Bisection

ag=-2; bg=-1.5;
midp=(ag+bg)/2;
counter_b=0;
err_b=1;

while abs(err_b)>e
    if f(ag)*f(midp)<0
        bg=midp;
    else
        ag=midp;
    end
    midp=(ag+bg)/2;
    err_b=f(midp);
    counter_b=counter_b+1;
end

Bisection=[counter_b midp err_b]

% Chord

ag=-2;
bg=-1.5;
intg=-1.9;
err_c=1;
counter_Chord=0;

while abs(err_c)>e
    delta=-(bg-ag).*f(intg)/(f(bg)-f(ag));
    z=intg+delta;
    err_c=f(z);
    intg=z;
    counter_Chord=counter_Chord+1;
end

Chord=[counter_Chord,z,err_c]


% Secant

xk=-1.9; xk1=-1.5;
err_s=1;
counter_s=0;

while abs(err_s)>10^-12
     delta_s=-(xk-xk1)*f(xk)/(f(xk)-f(xk1));
     z1=xk+delta_s;
     err_s=f(z1);
     xk1=xk;
     xk=z1;
     counter_s=counter_s+1;
     
end
Secant=[counter_s,z1,err_s]


% Newton
intg=-1.9;
err_n=1;
counter_new=0;

while abs(err_n)>e
    delta_n=-f(intg)/fp(intg);
    z_2=intg+delta_n;
    err_n=f(z_2);
    intg=z_2;
    counter_new=counter_new+1;
end

Newton=[counter_new,z_2,err_n]
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    