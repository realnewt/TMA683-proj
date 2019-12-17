clc
% Mall f√∂r Studio II : v√§rmeledningsekvationen
% L√∂ser v√§rmeledningsekvationen p√• [0,1] med alpha=1,
% Neumann-randvillkor f√∂r x=0 och homogent Dirichlet-villkor f√∂r x=1
%v‰rmeekv: T'-aT''=0
% s√§tt antal delintervall, stegl√§ngd och nodpunkter
m = 10;
h = 1/(m+1);
xv = 0:h:1;

% s√§tt tidsintervall, stegl√§ngd i tiden och antal tidssteg
T = 1;  % tidsintervall [0,T]
n = 10;  % antal tidsintervall
k = T/n; % tidssteg

% skapa matris med l√∂sning f√∂r alla rums- och tidssteg (inklusive randvillkor)
U=zeros(m+2,n+1)

% s√§tt begynnelsevillkor (och randvillkor) vid t=0
U(:,1) = 1-xv;
U(m+2,1) = 0;
U
% Skapa matriser

for j=1 :m+2
  
  S(j,j) = 2; S(j+1,j) = -1; S(j,j+1) = -1;
  M(j,j) = 4; M(j+1,j) = 1; M(j,j+1) = 1;
end
S=S(1:m+1,1:m+1)/h;
M=M(1:m+1,1:m+1)*(h/6);


S;M
U(1:m+1,l)
U
M*U(1:m+1,l)

%%
clc
clf
% Tidsstegning
% OBS att indexeringen i Matlab ‰r frÂn 1, d‰rfˆr l+1 nedan
for l=1:n
   % Skapa hˆgerledet 
   F = 0
   % Lˆs fˆr n‰sta tidssteg enl ekv (11)
   
   xi =inv(M+(k*S))*(M*U(1:m+1,l)+0);
   U(1:m+1,l+1) = xi;
   % S‰tt eventuellt randvillkor
   U(m+2,l+1) =0
end 
U;

% Plotta resultat, t.ex. med plot fˆr varje tidssteg, eller surf
t=linspace(0,1,11);
U(1,:)
t
for r=1:1
semilogy(U(r,:),t), hold on 
end
legend('1','2','3','4','5','6','7','8','9','10')

grid on





