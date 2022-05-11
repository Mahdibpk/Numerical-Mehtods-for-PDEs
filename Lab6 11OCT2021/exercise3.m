clear all
close all
clc

f=@(x) x.^3+x.^2-1;
xex=-5/12

a=0;
b=1;

% Exact solution 
xex2=integral(f,a,b);

x_p=(b+a)/2+((b-a)/(2*sqrt(3)));
x_n=(b+a)/2-((b-a)/(2*sqrt(3)));

Igl=(b-a)*( (f(x_p)+f(x_n))/2 );
Imid=( f((a+b)/2))*(b-a);
Itr= ( f(a)+f(b) )*0.5*(b-a);


rel_err_Igl=abs(Igl-xex)/abs(xex)
rel_err_Imid=abs(Imid-xex)/abs(xex)
rel_err_Itr=abs(Itr-xex)/abs(xex)