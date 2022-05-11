% Midpoint

close all
clear all
format long
clc

f=@(x) exp(-x).*cos(x);
a=0;

b=pi/2;
xex=0.5*(1+exp(-pi/2));
xex2=integral(f,a,b);

nn=[20,40,80,160]';
err = zeros(1,length(nn))';
S_Imid = zeros(1,length(nn))';


for i=1:length(nn)
    
n=nn(i);
h=(b-a)/n;
x=[a:h:b]';

Imid=zeros(1,n)';
Imid= f((x(1:end-1)+x(2:end))*0.5)*h;
S_Imid(i)=sum(Imid);
err(i)=abs(S_Imid(i)-xex)/abs(xex);
end

S_Imid
err

pempercical=-log2(err(2:end)./err(1:end-1))

%% Gouse legender
clc

f=@(x) exp(-x).*cos(x);
a=0;

b=pi/2;
xex=0.5*(1+exp(-pi/2));
xex2=integral(f,a,b);

nn=[20,40,80,160,320,640]';
err = zeros(1,length(nn))';
S_Igl2 = zeros(1,length(nn))';


for i=1:length(nn)
    
n=nn(i);
h=(b-a)/n;
x=[a:h:b]';
Igl2=zeros(1,n)';

    for j=1:n
        x_p(j) =(x(j+1)+x(j))/2 +(x(j+1)-x(j))/(2*sqrt(3));
        x_n(j) =(x(j+1)+x(j))/2 -(x(j+1)-x(j))/(2*sqrt(3));
        Igl2(j)= h*( f(x_p(j))+f(x_n(j)) ).*0.5;
    end
    
S_Igl2(i)=sum(Igl2);    
err(i)=abs(S_Igl2(i)-xex)/abs(xex);
end

S_Igl2
err

pempercical=-log2(err(2:end)./err(1:end-1))

% why it become close to 4?





