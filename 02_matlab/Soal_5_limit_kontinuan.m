% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 5 — Limit Kontinuan
%  --------------------------------------------------- 
%  Nama  : Sadewo Hasiqghani 
%  NIM   : 2510514016 
%  Parameter: N=16, a=1, b=6, K=8, theta0=60, alpha=0.007 
%  Tanggal: 2026-04-24 
% ===================================================== 

clc; clear; close all;

% =========================
% Parameter
% =========================
N = 16;  
a = 1;  
b = 6;  
K = 8; 
theta0 = 60;  % derajat 
alpha_lr = 0.007;

syms x n


% 5.1 (b) Verifikasi Limit

disp('=== 5.1(b) Verifikasi Limit ===')

L1 = limit((x^2 - K^2)/(x - K), x, K);
L2 = limit((sqrt(x + (K+1)^2) - (K+1))/x, x, 0);
L3 = limit(((a+2)*x^3 + b*x + 7)/(x^3 - x + K), x, inf);

fprintf('L1 = %.0f\n', double(L1));
fprintf('L2 = %.5f\n', double(L2));
fprintf('L3 = %.0f\n\n', double(L3));

% 5.4 (g) Plot Fungsi Piecewise

disp(' ')
disp('=== 5.4(g) Plot Fungsi Piecewise ===')

p = 16;
q = 8;

figure

% x < K
fplot(@(x) (x.^2 - K^2)./(x - K), [0 K-0.1])
hold on

% x > K
fplot(@(x) a*x + q, [K+0.1 2*K])

% titik sambungan
plot(K, p, 'ro', 'MarkerFaceColor', 'r')

xlabel('x')
ylabel('C(x)')
title('Fungsi Piecewise Kontinu (NIM 2510514016)')
legend('x < K','x > K','Titik x=K','Location','best')

grid on
axis tight