close all
clear all
clc

f=@(x) exp(-x.^2);
fp=@(x) -2*x.*exp(-x.^2);

nn=[10,20,40,80,160,320,640]';
rel_err_2=zeros(size(nn));
rel_err_inf=zeros(size(nn));


for j=1:7
% Input
a=-3;
b=3;
n=nn(j);
h=(b-a)/n;
myx=[a:h:b]';

% figure(1)
% plot(myx,f(myx),'k', myx,fp(myx),'r')


f_app=zeros(size(myx));

% for i=2:n-1
%     f_app(i)=(f(myx(1+i)) - f(myx(i-1)))./(2*h);
% end
f_app=(f(myx(3:end))-f(myx(1:end-2)))./(2*h);  

rel_err_2(j)= norm(f_app-fp(myx(2:end-1)),2)./(norm(fp(myx(2:end-1)),2));
rel_err_inf(j)= norm(f_app-fp(myx(2:end-1)),inf)./(norm(fp(myx(2:end-1)),inf));


figure(2)
hold on
plot(myx,fp(myx),'r',myx(2:end-1),f_app)
end
rel_err_2
rel_err_inf


p_eperical=-log2(rel_err_inf(2:end)./rel_err_inf(1:end-1))









