% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  --------------------------------------------------- 
%  Nama  : Sadewo Ahza Hasiqghani 
%  NIM   : 2510514016 
%  Prodi : Manajemen - UPN Veteran Jakarta
%  Parameter: N=16, a=1, b=6, K=8, theta0=60, alpha=0.007 
%  Tanggal: 24 April 2026 
% ===================================================== 
clc; clear; close all;

% --- Parameter Dasar ---
N = 16; a = 1; b = 6; K = 8;
theta0 = 60; alpha_lr = 0.007;

% --- Data Himpunan (Soal 3a) ---
A = [16, 18, 20, 23, 26, 29, 31];
B = [19, 21, 23, 26, 28, 34];
C = [17, 23, 26, 27, 33, 36];
U = 16:36;

% --- Output Operasi Himpunan ---
disp('========= VERIFIKASI HIMPUNAN (SOAL 3a) =========')
res1 = intersect(intersect(A, B), C);
fprintf('1. Irisan (A n B n C)       : {%s} (n=%d)\n', num2str(res1), length(res1));

res2 = union(union(A, B), C);
fprintf('2. Gabungan (A u B u C)     : {%s} (n=%d)\n', num2str(res2), length(res2));

res3 = setdiff(union(A, B), C);
fprintf('3. (A u B) n C''            : {%s} (n=%d)\n', num2str(res3), length(res3));

res4 = setxor(A, B);
fprintf('4. Symmetric Diff (A (+) B) : {%s} (n=%d)\n', num2str(res4), length(res4));

res5 = setdiff(U, res2);
fprintf('5. Luar Lingkaran (U - ABC) : {%s} (n=%d)\n', num2str(res5), length(res5));
disp(' ');

% --- Analisis Fungsi (Soal 3e) ---
disp('========= ANALISIS FUNGSI (SOAL 3e) =========')
f = @(x) K*x + (a+b);          
g = @(x) (x.^2)/(b+1) + a;     

% Verifikasi Invers Simbolik
syms x_sym y_sym
f_sym = K*x_sym + (a+b); 
f_inv = solve(y_sym == f_sym, x_sym);
y_target = K*100 + a + b;
x_target = double(subs(f_inv, y_sym, y_target));

fprintf('Persamaan Fungsi f(x)    : 8x + 7\n');
fprintf('Persamaan Invers f^-1(y) : %s\n', char(f_inv));
fprintf('Volume Pembelian (x)     : %d unit (untuk y = %d)\n', x_target, y_target);
disp(' ');

% --- Uji Sifat Fungsi ---
disp('--- Hasil Uji Klasifikasi ---')
fprintf('Uji Injektif f(x) : f(2)=%.1f vs f(-2)=%.1f -> Injektif\n', f(2), f(-2));
fprintf('Uji Injektif g(x) : g(2)=%.2f vs g(-2)=%.2f -> Tidak Injektif\n', g(2), g(2));
fprintf('Uji Surjektif f(x): Range mencakup seluruh R -> Surjektif\n');
fprintf('Uji Surjektif g(x): Range >= %.1f -> Tidak Surjektif\n', g(0));
disp(' ');

% --- Visualisasi Grafik ---
x_plot = -10:0.1:10;
figure('Name', 'Analisis Grafik Fungsi - Sadewo');
plot(x_plot, f(x_plot), 'b-', 'LineWidth', 2); hold on;
plot(x_plot, g(x_plot), 'r--', 'LineWidth', 2);
xlabel('Sumbu x'); ylabel('Sumbu y'); grid on;
title('Visualisasi Fungsi f(x) dan g(x)');
legend('f(x) = 8x + 7 (Bijektif)', 'g(x) = x^2/7 + 1 (Non-Bijektif)', 'Location', 'best');
