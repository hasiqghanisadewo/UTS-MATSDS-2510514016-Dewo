% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 3(e) — Klasifikasi Fungsi 
%  --------------------------------------------------- 
%  Nama  : Sadewo Hasiqghani 
%  NIM   : 2510514016 
%  Parameter: N=16, a=1, b=6, K=8, theta0=60, alpha=0.007 
%  Tanggal: 2026-04-24 
% ===================================================== 

clc; clear; close all;

% Parameter
a = 1;
b = 6;
K = 8;

% Definisi fungsi
f = @(x) K*x + (a+b);          % f(x) = 8x + 7
g = @(x) (x.^2)/(b+1) + a;     % g(x) = x^2/7 + 1


% Uji Injektif

disp('=== Uji Injektif ===')

x1 = 2;
x2 = -2;

fprintf('f(2) = %.2f, f(-2) = %.2f\n', f(x1), f(x2));
fprintf('g(2) = %.2f, g(-2) = %.2f\n', g(x1), g(x2));


% Uji Surjektif (contoh)

disp(' ')
disp('=== Uji Surjektif ===')

y = 10; % nilai bebas tapi real

% nyari x dari f(x)=y
x_f = (y - (a+b))/K;
fprintf('Untuk f(x)=y, x = %.2f (selalu ada)\n', x_f);

% ngecek g(x)
fprintf('Nilai minimum g(x) terjadi saat x=0: g(0)=%.2f\n', g(0));
disp('g(x) >= 1, jadi tidak mencakup seluruh R')


% Visualisasi Grafik

x = -10:0.1:10;

figure
plot(x, f(x), 'LineWidth', 2)
hold on
plot(x, g(x), 'LineWidth', 2)

xlabel('x')
ylabel('y')
title('Perbandingan Fungsi f dan g')

legend('f(x) = 8x + 7', 'g(x) = x^2/7 + 1')
grid on