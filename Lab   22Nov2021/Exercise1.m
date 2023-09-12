clear
close all
clc

L=10;
T=5;
ni=0.05;
N=100;
M=200;
dx=L/N;
dt=T/M;
t=[0:dt:T];
x=[0:dx:L];


% exact
c0=@(x) 10*exp(-((x-L/2)./(L/10)).^2);
xf=[0:dx:L-dx];
k=[0:N/2,-N/2+1:-1];
omega=2*pi.*k/L;
alphak=ni.*(j.*omega).^2;
c0x=c0(xf);
chat0=fft(c0x);
chat=exp(alphak*T).*chat0;
yhat=ifft(chat);

plot(xf,yhat,'k')

% numerical
diffcoef=ni*dt./dx.^2;

% stability
if diffcoef<0.5
    'stable'
else
    'not stable'
end

cfinal=zeros(length(t),length(x));
cfinal(1,:)=c0(x);

for i=2:length(t)
    ctemp=[cfinal(i-1,end-1),cfinal(i-1,:)];
    cfinal(i,1:end-1)=ctemp(3:end)*diffcoef + ctemp(2:end-1)*(1-2*diffcoef) + ctemp(1:end-2)*diffcoef;
    cfinal(i,end)=cfinal(i,1);
end


hold on
plot(x,cfinal(1,:),'b--',x,cfinal(end,:),'g*')

rel_err_inf_1=norm(yhat-cfinal(end,1:end-1),inf)/norm(yhat,inf)



%%


L=10;
T=5;
ni=0.05;
N=200;
M=400;
dx=L/N;
dt=T/M;
t=[0:dt:T];
x=[0:dx:L];


% exact
c0=@(x) 10*exp(-((x-L/2)./(L/10)).^2);
xf=[0:dx:L-dx];
k=[0:N/2,-N/2+1:-1];
omega=2*pi.*k/L;
alphak=ni.*(j.*omega).^2;
c0x=c0(xf);
chat0=fft(c0x);
chat=exp(alphak*T).*chat0;
yhat=ifft(chat);


% numerical
diffcoef=ni*dt./dx.^2;

% stability
if diffcoef<0.5
    'stable'
else
    'not stable'
end

cfinal=zeros(length(t),length(x));
cfinal(1,:)=c0(x);

for i=2:length(t)
    ctemp=[cfinal(i-1,end-1),cfinal(i-1,:)];
    cfinal(i,1:end-1)=ctemp(3:end)*diffcoef + ctemp(2:end-1)*(1-2*diffcoef) + ctemp(1:end-2)*diffcoef;
    cfinal(i,end)=cfinal(i,1);
end


rel_err_inf2=norm(yhat-cfinal(end,1:end-1),inf)/norm(yhat,inf)
pemperical=-log2(rel_err_inf2./rel_err_inf_1)
