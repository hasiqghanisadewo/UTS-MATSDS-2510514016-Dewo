% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 2 — Enkripsi Matriks Citra 
%  --------------------------------------------------- 
%  Nama  : Sadewo Hasiqghani 
%  NIM   : 2510514016 
%  Parameter: N=16, a=1, b=6, K=8, theta0=60, alpha=0.007 
%  Tanggal: 2026-04-24 
% ===================================================== 

clc; clear; close all;

% Parameter personalisasi
N = 16;  
a = 1;  
b = 6;  
K = 8; 
theta0 = 60;  
alpha_lr = 0.007;
% Matriks A dan P
A = [2 6 2;
     1 3 6;
     6 1 4];

P = [120 66 200;
     80 3 26;
     46 90 170];

% (d) Verifikasi Invers

A_inv_manual = (1/170) * [6 -22 30;
                         32 -4 -10;
                         -17 34 0];

A_inv_matlab = inv(A);

fprintf('Norm error (Frobenius): %.10f\n', ...
    norm(A_inv_manual - A_inv_matlab, 'fro'));


% Enkripsi & Dekripsi

E = A * P;
P_dekripsi = A_inv_matlab * E;

disp('Hasil Dekripsi (harus sama dengan P):')
disp(P_dekripsi)


% (f) Visualisasi Citra

figure

subplot(1,2,1)
imshow(uint8(P))
title('Citra Asli (P)')

subplot(1,2,2)
imshow(uint8(E))
title('Citra Terenkripsi (E)')