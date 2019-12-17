clc
a =1:4;
e=length(a);
q=size(a);
diag (a);
eye (3,4)
zeros (4 ,1);
diag(a);

B=[ diag(a) zeros(4,1) ; ones(1,5)];

A=[1 2 3; 4 5 6; 7 8 9; 10 11 12]

A(2:3 , :)
C= repmat (a ,4 ,2)
E= repmat (a ,1 ,2)
F= reshape (E ,4 ,2)
F= reshape (E ,2 ,4)
sort (E)
sum (F ,1)
R=[zeros(1 ,6);-1*eye(5,6) ]
Q=[diag(1:6)]
L=[zeros(5 ,1) 8*eye(5);zeros(1 ,6) ]
R+Q+L
%%
x=1:4;
y=1:4;
plot (x,y,'r*--')


%%
clc
x =0:0.5:5; y =0:1:10;
u=sin (x)'* sin (y);
surf (y,x,u)


%%
clc
clf
L=6;
syms x
y = piecewise(0<x<3,(2*k*x)./L , 6>x>3,((L-x)*2*k)/L);
%f=@(x)[(2*k*x)./L;((L-x)*2*k)/L];
fplot(y)
axis([0 6 0 2])

%%
clc
clf
k=1; L=6;
n=1:100;
u= ((8*k)/(pi^2))*sum((1/(n.^2))*sin((n*pi)/2))*(cos((n.*pi*t)/L)'*sin((n.*pi*x)/L))
x=linspace(0,6); t=linspace(0,10);
surf(t,x,u)






