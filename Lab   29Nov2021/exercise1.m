clear
close all
format long
clc


L=10;
T=2;
a=1;
N=100;
M=50;
dx=L/N;
dt=T/M;
x=[0:dx:L];
t=[0:dt:T];


% exact
c0=@(x) 10*exp(-((x-L/2)./(L/10)).^2);
xf=[0:dx:L-dx];
k=[0:N/2,-N/2+1:-1];
omega=2*pi*k/L;
alphak=a*j*omega;
chat0=fft(c0(xf-a*T));
chat=exp(alphak*T).*chat0;
yhat=ifft(chat);

plot(xf,yhat,'k*')

cfinal=zeros(length(t),length(x));
cfinal(1,:)=c0(x);
lambda=a.*dt./dx;

for i=2:length(t);
    ctemp=[cfinal(i-1,end-1),cfinal(i-1,:)];
    cfinal(i,1:end-1)=lambda.*ctemp(1:end-2)+(1-lambda).*ctemp(2:end-1);
    cfinal(i,end)=cfinal(i,1);
end

hold on
plot(x,cfinal(1,:),'b',x,cfinal(end,:),'y')

rel_err_inf=norm(yhat-cfinal(end,end-1),inf)./norm(yhat,inf);


%%L=10;
T=2;
a=1;
N=100;
M=100;
dx=L/N;
dt=T/M;
x=[0:dx:L];
t=[0:dt:T];


% exact
c0=@(x) 10*exp(-((x-L/2)./(L/10)).^2);
xf=[0:dx:L-dx];
k=[0:N/2,-N/2+1:-1];
omega=2*pi*k/L;
alphak=a*j*omega;
chat0=fft(c0(xf-a*T));
chat=exp(alphak*T).*chat0;
yhat=ifft(chat);

plot(xf,yhat,'k*')

cfinal=zeros(length(t),length(x));
cfinal(1,:)=c0(x);
lambda=a.*dt./dx;

for i=2:length(t);
    ctemp=[cfinal(i-1,end-1),cfinal(i-1,:)];
    cfinal(i,1:end-1)=lambda.*ctemp(1:end-2)+(1-lambda).*ctemp(2:end-1);
    cfinal(i,end)=cfinal(i,1);
end

hold on
plot(x,cfinal(1,:),'b',x,cfinal(end,:),'y')


rel_err_inf_1=norm(yhat-cfinal(end,end-1),inf)./norm(yhat,inf);


%%

L=10;
T=2;
a=1;
N=200;
M=200;
dx=L/N;
dt=T/M;
x=[0:dx:L];
t=[0:dt:T];


% exact
c0=@(x) 10*exp(-((x-L/2)./(L/10)).^2);
xf=[0:dx:L-dx];
k=[0:N/2,-N/2+1:-1];
omega=2*pi*k/L;
alphak=a*j*omega;
chat0=fft(c0(xf-a*T));
chat=exp(alphak*T).*chat0;
yhat=ifft(chat);

plot(xf,yhat,'k*')

cfinal=zeros(length(t),length(x));
cfinal(1,:)=c0(x);
lambda=a.*dt./dx;

for i=2:length(t);
    ctemp=[cfinal(i-1,end-1),cfinal(i-1,:)];
    cfinal(i,1:end-1)=lambda.*ctemp(1:end-2)+(1-lambda).*ctemp(2:end-1);
    cfinal(i,end)=cfinal(i,1);
end

hold on
plot(x,cfinal(1,:),'b',x,cfinal(end,:),'y')

rel_err_inf_2=norm(yhat-cfinal(end,end-1),inf)./norm(yhat,inf);


pemperical=-log2(rel_err_inf_2/rel_err_inf_1)





