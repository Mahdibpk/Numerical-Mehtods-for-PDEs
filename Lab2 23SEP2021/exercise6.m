clear all
close all
format long 
clc

%       INPUT

f=@(x) x.*cos(x);
fz=@(x) -x.*cos(x)-2*sin(x);


a=0; b=pi/2;
n=100;
h=(b-a)/n;

myx=[a:h:b]';
myfz=fz(myx);

figure(1); plot(myx,f(myx),'k',myx,myfz,'r')
%       Central second Finit Difference

fp_app=zeros(size(myx));
fp_app(end)=myfz(end);
fp_app(2:end-1)=(f(myx(3:end)) - 2.*f(myx(2:end-1)) + f(myx(1:end-2)))./(h.^2);

figure(2)
plot(myx,myfz,'r',myx,fp_app,'ko') 


err=abs(fp_app - myfz);
rel_err_2=norm(err,2)
rel_err_inf=norm(err,inf)
abs_err_2=  rel_err_2./norm(myfz,2)
abs_err_inf=  rel_err_inf./norm(myfz,inf)




