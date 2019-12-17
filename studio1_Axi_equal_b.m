clc
% Mall för Studio 1, FEM för stationärt konvektions-diffusions-problem
% Löser -Du'' + 1/2*u' = 1 på [0,pi] med homogena Dirichlet-randvillkor

% Sätt antal intervall och steglängd
m =100;
h = pi/(m+1);
% skapa vektor med nodpunkter
xv=0:h:pi;  


% v nabla Ca= Dab*nabla^2 *Ca +Ra
% v=1/2, Ra=1;
% Sätt diffusionskonstant
D = 1;

% Skapa matriser
% Görs här enkelt med en loop. Man kan också använda Matlabs kommandon 
% diag eller spdiags
S = zeros(m,m);
C = zeros(m,m);
b = zeros(m,1);


for j=1 :m
  % Fyll i själva
  S(j,j) = 2; S(j+1,j) = -1; S(j,j+1) = -1;
  
  C(j+1,j) = -1;C(j,j+1) = 1;
 
  b(j) = 1;
end
S=S(1:m,1:m)/h;
C=C(1:m,1:m)/2;
b=b*h;

A = D*S + 0.5 * C;

% Lös ekvationssystemet A xi = b
xi = A\b;

% lägg till randvärden till xi
xi =[0;xi;0]


% rita lösningen
figure(1)
plot(xv, xi, 'r-')
