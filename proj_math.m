clear
clc
format short
m = 4;
h = 1/(m+1);
xv = 0:h:1;

k0=1;
kl=0;
c=1;
D=1;

T = 2;
n = 10;  
k = T/n; 

U=zeros(m+2,n+1);

%begynelsevilkor samt randbös-------------------------------
U(:,1) = 10*xv.*(1-xv);
U(m+2,1) = 0;

%------------------
M=(diag(4*ones(m+2,1))+diag(ones(m+1,1),1)+diag(ones(m+1,1),-1)).*(h/6);
S=(diag(2*ones(m+2,1))+diag(-1*ones(m+1,1),1)+diag(-1*ones(m+1,1),-1)).*(1/h);
C=(diag(0*ones(m+2,1))+diag(1*ones(m+1,1),1)+diag(-1*ones(m+1,1),-1)).*(1/2);
M(1,1)=h/3;M(m+2,m+2)=h/3;S(1,1)=1/h; S(m+2,m+2)=1/h; C(1,1)=1/2;C(m+2,m+2)=1/2; 
R=zeros(m+2,m+2);R(1,1)=k0+c;R(m+2,m+2)=kl-c;
M,C,S,R




%tidstegning--------------------------


F=100*exp(-100*((xv-(1/4)).^2));
Q=trapz(F)
A=c*C+D*S+R;
for l=1:n
   % Skapa högerledet 
   
   % Lös för nästa tidssteg enl ekv (11)
   xi =(M+A)\((M*U(1:m+1,l))+k*Q(l));
   U(1:m+1,l+1) = xi;
   
   % Sätt eventuellt randvillkor
   U(m+2,l+1) =0;
end 






