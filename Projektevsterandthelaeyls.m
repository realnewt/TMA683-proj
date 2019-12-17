%% Projekt

% s�tt antal delintervall, stegl�ngd och nodpunkter
m =4;
h = 1/(m+1);
xv = 0:h:1;

% s�tt tidsintervall, stegl�ngd i tiden och antal tidssteg
T = 2;  % tidsintervall [0,T]
n = 10;  % antal tidsintervall
k = T/n; % tidssteg
tv=0:k:T;

% skapa matris med l�sning f�r alla rums- och tidssteg (inklusive randvillkor)
U=zeros(m+2,n+1);

% s�tt begynnelsevillkor (och randvillkor) vid t=0
U(:,1)=10.*xv.*(1-xv);


%Definiera konstanter
ko=1;
kl=1;
c=0;
D=1;

% Skapa matriser
M =(h/6)*[diag(4*ones(m+2,1)) + diag(ones(m+1,1),1) + (diag(ones(m+1,1),-1))];
M(1,1)=(2*h)/6;
M(m+2,m+2)=(2*h)/6;

S =(1/h)*[diag(2*ones(m+2,1)) + (-1)*diag(ones(m+1,1),1) + ((-1)*diag(ones(m+1,1),-1))];
S(1,1)=1/h;
S(m+2,m+2)=1/h;

C=(1/2)*[diag(zeros(m+2,1)) + diag(ones(m+1,1),1) + (-1)*(diag(ones(m+1,1),-1))];
C(1,1)=-1/2;
C(m+2,m+2)=1/2;

R=zeros(m+2,m+2);
R(1,1)=ko+c;
R(m+2,m+2)=kl-c;

f=@(x)100*exp(-100*(x-1/4).^2);

% Tidsstegning
% OBS att indexeringen i Matlab är fr�n 1, d�rf�r l+1 nedan

for l=1:n
   % Skapa h�gerledet 
  F=zeros(m+2,1);
    for q=1:m+2
        if tv(l)<=1
            F(q,1)=f(xv(q))*h;
            F(1,1)=f(xv(1))*h/2;
            F(m+2,1)=f(xv(m+2))*h/2;
        elseif tv(l)>1
            F(q,1)=0;
        end
    end
    
   % L�s f�r n�sta tidssteg enl ekv (11)
   xi=(M+k.*(c*C+R+D*S))\(M*U(1:m+2,l)+k*F); 
   U(1:m+2,l+1) = xi;

   % Sätt eventuellt randvillkor
   %U(m+2,l+1)=0;
   
end

%semilogy(tv,U)
surf(tv,xv,U)

% Plotta resultat, t.ex. med plot för varje tidssteg, eller surf


