clear
close all
clc

L=10;
T=5;
ni=0.1;
N=100;
M=20;
dx=L/N;
dt=T/M;
x=[0:dx:L];
t=[0:dt:T];


% PBC
% exact
c0=@(x) 10*exp(-((x-L/2)./(L/10)).^2 );
xf=[0:dx:L-dx];
k=[0:N/2,-N/2+1:-1];
omega=2*pi.*k/L;
alphak=ni.*(j.*omega).^2;
c0x=c0(xf);
chat0=fft(c0x);
chat=exp(alphak.*T).*chat0;
yhat=ifft(chat);
  

plot(xf,yhat,'b')
% Numerical
diffcoef=ni*dt/dx^2;

cfinal=zeros(length(t),length(x));
cfinal(1,:)=c0(x);
A=diag((1+2*diffcoef)*ones(length(x)-1,1),0)...
 +diag((-diffcoef)*ones(length(x)-2,1),1)...
 +diag((-diffcoef)*ones(length(x)-2,1),-1);
A(1,end)=(-diffcoef);
A(end,1)=(-diffcoef);

for i=2:length(t)
    b=cfinal(i-1,1:end-1)';
    cfinal(i,1:end-1)=A\b;
    cfinal(i,end)=cfinal(i,1);
end

    
hold on
plot(x,cfinal(end,:),'g*',x,cfinal(1,:),'k')






