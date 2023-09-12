clear
close all
clc

yp=@(t,y) -50*y+4*y.^2+t;

tspan=[0 1];
y0=2;
option=odeset("RelTol",1e-10,"MaxStep",1e-4);
[t,y]=ode15s(yp,tspan,y0,option);

plot(t,y,'k')
                

            % Expelicit Euler with N=15
tic
N=100;
h=1/N;
tt=[0:h:1];
y_FE=zeros(1,length(tt));
y_FE(1)=y0;

for i=1:(length(tt)-1)
    y_FE(i+1)=y_FE(i)+h*yp(tt(i),y_FE(i));
end
toc
hold on
plot(tt,y_FE,'r-*')

% We see that with N=15 the explicit Euler method doesn't work properly
% but if we increase N to about 100, it will work according the theroy


            % Implicit Euler Method %



option2=optimoptions('fsolve','Display','none','TolX',1e-6)

IE=zeros(1,length(tt));
IE(1)=2;

for i=1:(length(tt)-1)
    g=@(y) y-IE(i)-h*yp(tt(i+1),y);
    IE(i+1)=fsolve(g,IE(i),option2);
end
    
hold on
plot(tt,IE,'m')





            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            
            