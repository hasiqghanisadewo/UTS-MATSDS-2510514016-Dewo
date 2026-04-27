% ===================================================== 
%  UTS Matematika Sains Data — Semester Genap 2025/2026 
%  Soal 4 —  Segmentasi Pelanggan
%  --------------------------------------------------- 
%  Nama  : Sadewo Hasiqghani 
%  NIM   : 2510514016 
%  Parameter: N=16, a=1, b=6, K=8, theta0=60, alpha=0.007 
%  Tanggal: 2026-04-24 
% ===================================================== 

clc; clear; close all;


% Parameter
N = 16;  
a = 1;  
b = 6;  
K = 8; 
theta0 = 60;  % derajat 
alpha_lr = 0.007;


% Fasor

z1 = (a+2) + (b+1)*1i;   % 3 + 7i
z2 = (b+1) - (a+2)*1i;   % 7 - 3i

% (b) Operasi Kompleks

disp('=== (b) Operasi Kompleks ===')

z_add = z1 + z2;
z_mul = z1 * z2;
z_div = z1 / z2;
z_abs = abs(z1 - z2);

fprintf('z1 + z2 = %.2f + %.2fi\n', real(z_add), imag(z_add));
fprintf('z1 * z2 = %.2f + %.2fi\n', real(z_mul), imag(z_mul));
fprintf('z1 / z2 = %.4f + %.4fi\n', real(z_div), imag(z_div));
fprintf('|z1 - z2| = %.4f\n\n', z_abs);


% (e) Plot Akar Pangkat Tiga

disp('=== (e) Plot Akar Kubik ===')

r = 2; % akar dari 8
theta0_rad = deg2rad(theta0);

z_roots = zeros(1,3);

for k = 0:2
    theta_k = (theta0_rad + 2*pi*k)/3;
    z_roots(k+1) = r * exp(1i * theta_k);
    
    fprintf('z%d = %.4f + %.4fi\n', k+1, real(z_roots(k+1)), imag(z_roots(k+1)));
end


% Plot Argand

figure
plot(real(z_roots), imag(z_roots), 'o', 'LineWidth', 2)
hold on

% garis dari origin
for k = 1:3
    plot([0 real(z_roots(k))], [0 imag(z_roots(k))])
end

% lingkaran radius 2
t = linspace(0,2*pi,100);
plot(r*cos(t), r*sin(t),'--')

xlabel('Real')
ylabel('Imaginer')
title('Akar Pangkat Tiga di Bidang Argand (NIM 2510514016)')
axis equal
grid on

% label titik
for k = 1:3
    text(real(z_roots(k))+0.1, imag(z_roots(k)), ['z' num2str(k)])
end


% Bukti segitiga sama sisi

d12 = abs(z_roots(1)-z_roots(2));
d23 = abs(z_roots(2)-z_roots(3));
d31 = abs(z_roots(3)-z_roots(1));

fprintf('\nJarak antar titik:\n');
fprintf('z1-z2 = %.4f\n', d12);
fprintf('z2-z3 = %.4f\n', d23);
fprintf('z3-z1 = %.4f\n', d31);