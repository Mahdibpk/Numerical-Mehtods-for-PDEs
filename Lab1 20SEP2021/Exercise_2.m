close all;
clear all;
format long;
clc

%Input
f=@(k) 1+10.^(-k)-1;
f_apx=@(k) (abs((1+10.^(-k)-1)-10.^(-k)))./(10.^(-k));
f_apx_2=@(k) abs(((1+10.^(-k)-1)-10.^(-k)))./(10.^(-k));

%Numerical

rel_err_vec=zeros(3,21)';
for k =0:20;
    rel_err_1=abs(f(k)-f_apx(k))./f(k);
    rel_err_2=abs(f(k)-f_apx_2(k))./(f(k));
    
    rel_err_vec(k+1,1)=k+1;
    rel_err_vec(k+1,2)=rel_err_1;
    rel_err_vec(k+1,3)=rel_err_2;
   
end
rel_err_vec

figure(1)
semilogy(rel_err_vec(:,1),rel_err_vec(:,2),'ko')

%part_2


