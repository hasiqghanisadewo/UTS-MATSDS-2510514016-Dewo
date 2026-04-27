% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 7 — Data Penjualan & Forecasting 
%  --------------------------------------------------- 
%  Nama  : <Sadewo Ahza Hasiqghani> 
%  NIM   : <2510514016> 
%  Parameter: N=16, a=1, b=6, K=8, theta0=60, alpha=0.007  
%  Tanggal: 2026-04-26 
% ===================================================== 

clc; clear; close all;

%% Parameter
N = 16;  
a = 1;  
b = 6;  
K = 8; 
theta0 = 60;  % derajat 
alpha_lr = 0.007;
n = 1:12;

%%Hitung Sn, T1, T2

S = 50 + K*n + (-1).^n .* (a+1);

T1 = sum(S);
T2 = sum(S.^2);

fprintf('=== HASIL SIGMA ===\n');
fprintf('T1 (jumlah total) = %.0f\n', T1);
fprintf('T2 (jumlah kuadrat) = %.0f\n', T2);

%%Linear Fit & Forecast

t = 1:12;

% Linear regression
p = polyfit(t,S,1);

slope = p(1);
intercept = p(2);

fprintf('\n=== LINEAR FIT ===\n');
fprintf('Slope = %.4f\n', slope);
fprintf('Intercept = %.4f\n', intercept);

% Prediksi 6 bulan
t_future = 13:18;

S_pred = polyval(p,t_future);

%% Plot

figure;

% Data historis
plot(t,S,'bo','LineWidth',2)
hold on

% Garis tren
plot(t,polyval(p,t),'r--','LineWidth',2)

% Prediksi
plot(t_future,S_pred,'g^','LineWidth',2)

legend('Data Historis',...
       'Garis Tren',...
       'Prediksi 6 Bulan')

xlabel('Bulan')
ylabel('Penjualan (juta rupiah)')

title('Forecast Penjualan 6 Bulan ke Depan')

grid on

%% Hitung MAE

S_fit = polyval(p,t);

MAE = mean(abs(S - S_fit));

fprintf('\n=== ERROR ANALYSIS ===\n');
fprintf('MAE = %.4f\n', MAE);

%% Residual (opsional tapi bagus)

residual = S - S_fit;

figure;

stem(t,residual,'filled')

xlabel('Bulan')
ylabel('Residual')

title('Residual Model Linear')

grid on