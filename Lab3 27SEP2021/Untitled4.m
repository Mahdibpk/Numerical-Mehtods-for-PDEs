close all
clear all
clc


f=@(x) x.*cos(x);
fp2=@(x) -x.*cos(x)-2*sin(x);
nn=50*2.^(0:5);
rel_err_2=zeros(1,length(nn))';
rel_err_inf=zeros(1,length(nn))';


for i=1:length(nn)
a=0;
b=pi/2;
n=nn(i);
h=(b-a)/n;
myx=[a:h:b]';

% figure(1)
% plot(myx,f(myx),'k',myx,fp2(myx),'k')

fp_app_2=zeros(size(myx));
fp_app_2=(f(myx(3:end))-2*f(myx(2:end-1))+f(myx(1:end-2)))./(h.^2);

figure(2)
hold on
plot(myx,fp2(myx),'k',myx(2:end-1),fp_app_2,'o')

rel_err_2(i)=norm(fp_app_2-fp2(myx(2:end-1)),2)./(norm(fp2(myx(2:end-1)),2));
rel_err_inf(i)=norm(fp_app_2-fp2(myx(2:end-1)),inf)./(norm(fp2(myx(2:end-1)),inf));

end

rel_err_2
rel_err_inf

pemp=-log2(rel_err_inf(2:end)./rel_err_inf(1:end-1))

figure(3)
plot(pemp)










