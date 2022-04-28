% MY way
clear all
close all
format long
clc

% In
f=@(x) exp(-3*x.^2);
fp=@(x) -6*x.*exp(-3*x.^2);

a=-1; b=2;
n=150;
h=(b-a)/n;


myx=[a:h:b]';
myf=f(myx);
myfp=fp(myx);
figure(1); plot(myx,f(myx),'k',myx,myfp,'r')

%           Forward Differnce Vector

df_app_f=zeros(size(myx));
df_app_f(1:end-1)=( f(myx(2:end)) - f(myx(1:end-1)) )./h;

figure(2);
plot(myx,myfp,'r',myx,df_app_f,'ko')


%            Backward Diffrence Vector

df_app_b=zeros(size(myx));
df_app_b(2:end) = ( f(myx(2:end)) - f(myx(1:end-1)) )./h;

figure(3);
plot(myx,myfp,'r' ,myx,df_app_b,'ko')

%            Central Finit Diffrence

df_app_c=zeros(size(myx));
df_app_c(2:end-1)=( f(myx(3:end))  -  f(myx(1:end-2)) )./(2*h);

figure(4)
plot(myx,myfp,'r',myx,df_app_c,'ko')

%            finit difrence  forth order 

df_app_4=zeros(size(myx));
df_app_4(3:end-2)=( -f(myx(5:end)) + 8.*(f(myx(4:end-1))) ...
    -8.*(f(myx(2:end-3))) + f(myx(1:end-4)))./(12*h);


figure(5)
plot(myx,myfp,'r',myx,df_app_4,'bo')

%             Error calculation for forward

err_f= abs(myfp-df_app_f);

rel_error_f_2= norm(err_f,2);
rel_error_f_inf= norm(err_f,inf);

abs_error_f_2= rel_error_f_2./norm(myfp,2);
abs_error_f_inf= rel_error_f_inf./norm(myfp,inf);

figure(6)
semilogy(myx,err_f)
















