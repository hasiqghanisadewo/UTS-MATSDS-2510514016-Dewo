% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 6 — Gradient Descent 
%  --------------------------------------------------- 
%  Nama  : [Sadewo Ahza Hasiqghani]
%  NIM   : 2510514016
%  Parameter: N=16, a=1, b=6, K=8, theta0=60, alpha=0.007 
%  Tanggal: 28 April 2026 
% ===================================================== 

clc; clear; close all; 

% 1. Parameter Personalisasi NIM ...16
N = 16; a = 1; b = 6; K = 8;
alpha_lr = 0.007; 
x0 = 1;
iters = 500;

% Definisi Fungsi Profit dan Turunannya
% pi(x) = -2x^3 + 88x^2 + 100x - 640
pi_func = @(x) -(a+1)*x.^3 + (b+5)*K*x.^2 + 100*x - (K^2*10);
% pi'(x) = -6x^2 + 176x + 100
dpi_func = @(x) -3*(a+1)*x.^2 + 2*(b+5)*K*x + 100;

% 2. Proses Gradient Descent (Alpha Normal)
history_x = zeros(iters, 1);
x_curr = x0;
for k = 1:iters
    history_x(k) = x_curr;
    x_curr = x_curr + alpha_lr * dpi_func(x_curr);
end
x_final_gd = x_curr;

% 3. Solusi Analitik (Hasil dari Soal 6.1 c)
% Menggunakan rumus ABC untuk -6x^2 + 176x + 100 = 0
A_q = -6; B_q = 176; C_q = 100;
D = B_q^2 - 4*A_q*C_q;
x_analitik = (-B_q - sqrt(D)) / (2*A_q); 

% VISUALISASI BAGIAN (e): Kurva Profit & Titik Optimasi
figure(1);
% Membuat rentang x untuk kurva (dari 0 sampai sedikit melewati x_final)
x_range = linspace(0, x_final_gd + 10, 1000);
plot(x_range, pi_func(x_range), 'b', 'LineWidth', 2); hold on;

% Menampilkan Titik Awal x0
plot(x0, pi_func(x0), 'go', 'MarkerFaceColor', 'g', 'MarkerSize', 8);

% Menampilkan Titik Akhir Gradient Descent x*
plot(x_final_gd, pi_func(x_final_gd), 'ro', 'MarkerFaceColor', 'r', 'MarkerSize', 8);

% Menampilkan Solusi Analitik (x dari bagian c)
plot(x_analitik, pi_func(x_analitik), 'kx', 'LineWidth', 2, 'MarkerSize', 12);

% Label dan Keterangan
title(['Visualisasi Optimasi Profit - NIM ', num2str(2510514016)]);
xlabel('Harga Produk (x)');
ylabel('Profit \pi(x) (Juta Rp)');
legend('Kurva Profit \pi(x)', 'Titik Awal (x_0)', 'Hasil GD (x^*)', 'Solusi Analitik (c)');
grid on;


% VISUALISASI Analisis Sensitivitas
alphas = [alpha_lr, 10*alpha_lr, 0.1*alpha_lr];
col = {'r', 'g', 'b'};
labels = {'Alpha Normal (0.007)', 'Alpha Besar (0.07)', 'Alpha Kecil (0.0007)'};

figure(2); hold on;
for i = 1:3
    temp_x = x0;
    temp_hist = zeros(iters, 1);
    for k = 1:iters
        temp_hist(k) = pi_func(temp_x);
        temp_x = temp_x + alphas(i) * dpi_func(temp_x);
    end
    plot(1:iters, temp_hist, col{i}, 'LineWidth', 1.5);
end
title('Analisis Sensitivitas Learning Rate (\alpha)');
xlabel('Iterasi (k)'); ylabel('Profit \pi(x)');
legend(labels);
grid on;

% Menampilkan hasil di Command Window
fprintf('--- Hasil Optimasi NIM 2510514016 ---\n');
fprintf('Titik Awal (x0)       : %.6f\n', x0);
fprintf('Hasil Akhir GD (x*)   : %.6f\n', x_final_gd);
fprintf('Solusi Analitik (x)   : %.6f\n', x_analitik);
fprintf('Profit Maksimum       : Rp%.2f Juta\n', pi_func(x_final_gd));

figure(2);
ylim([-1000, 30000]); % Membatasi sumbu Y agar fokus ke range profit normal