clc
% Mall f�r Studio 1, FEM f�r station�rt konvektions-diffusions-problem
% L�ser -Du'' + 1/2*u' = 1 p� [0,pi] med homogena Dirichlet-randvillkor

% S�tt antal intervall och stegl�ngd
m =100;
h = pi/(m+1);
% skapa vektor med nodpunkter
xv=0:h:pi;  


% v nabla Ca= Dab*nabla^2 *Ca +Ra
% v=1/2, Ra=1;
% S�tt diffusionskonstant
D = 1;

% Skapa matriser
% G�rs h�r enkelt med en loop. Man kan ocks� anv�nda Matlabs kommandon 
% diag eller spdiags
S = zeros(m,m);
C = zeros(m,m);
b = zeros(m,1);


for j=1 :m
  % Fyll i sj�lva
  S(j,j) = 2; S(j+1,j) = -1; S(j,j+1) = -1;
  
  C(j+1,j) = -1;C(j,j+1) = 1;
 
  b(j) = 1;
end
S=S(1:m,1:m)/h;
C=C(1:m,1:m)/2;
b=b*h;

A = D*S + 0.5 * C;

% L�s ekvationssystemet A xi = b
xi = A\b;

% l�gg till randv�rden till xi
xi =[0;xi;0]


% rita l�sningen
figure(1)
plot(xv, xi, 'r-')
