% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 1 — Analisis Penjualan Toko 
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
theta0 = 60;  % derajat 
alpha_lr = 0.007;

% =========================
% Hitung D1 - D7
% =========================
D = zeros(1,7);

for i = 1:7
    D(i) = 20 + (K*i) + mod(a*i,7) - mod(b*i,5);
end

disp('Data penjualan (D):')
disp(D)

% =========================
% (b) Statistik
% =========================
fprintf('\n=== Statistik ===\n');
fprintf('Mean = %.2f\n', mean(D));
fprintf('Median = %.2f\n', median(D));
fprintf('Mode = %.2f\n', mode(D));
fprintf('Range = %.2f\n', range(D));
fprintf('Standar Deviasi (Populasi) = %.2f\n', std(D,1));

% Time stamp
disp('time stamp');
disp(datetime('now'));

% =========================
% (c) Diagram Batang
% =========================
figure
bar(D)
hold on

% Garis rata-rata
yline(mean(D), 'r', 'LineWidth', 2)

xlabel('Toko ke berapa')
ylabel('Penjualan dalam nominal Juta')
title('Diagram Penjualan Toko dari D1 - D7 ')

grid on

% Simpan PNG
saveas(gcf, 'penjualan_toko.png')
