%% 低损耗导电媒质中电磁波传播 - 学术级仿真
clear; clc; close all;

E0 = 1;
f = 1e9;
omega = 2*pi*f;
epsilon_0 = 8.854e-12;
mu_0 = 4*pi*1e-7;
epsilon_r = 4;
sigma = 0.01;
epsilon = epsilon_r * epsilon_0;

alpha = (sigma/2) * sqrt(mu_0/epsilon);
beta = omega * sqrt(mu_0*epsilon);
lambda = 2*pi/beta;
delta = 1/alpha;

z = linspace(0, 5*lambda, 1000);

% 图1：电场衰减
fig1 = figure('Position', [100 100 900 500], 'Color', 'w', 'Visible', 'off');

E = E0 * exp(-alpha*z) .* cos(omega*0 - beta*z);
E_envelope = E0 * exp(-alpha*z);

fill([z/lambda, fliplr(z/lambda)], [E_envelope, -fliplr(E_envelope)], ...
     [0.85 0.92 1], 'EdgeColor', 'none', 'FaceAlpha', 0.4);
hold on;
plot(z/lambda, E, 'b-', 'LineWidth', 1.5);
plot(z/lambda, E_envelope, 'r--', 'LineWidth', 2);
plot(z/lambda, -E_envelope, 'r--', 'LineWidth', 2);

xline(delta/lambda, 'k--', 'LineWidth', 1.5);
text(delta/lambda+0.15, 0.85, sprintf('\\delta = %.2f\\lambda', delta/lambda), ...
     'FontSize', 12, 'FontName', 'Times New Roman');

xlabel('z / \lambda', 'FontSize', 13, 'FontName', 'Times New Roman');
ylabel('E (V/m)', 'FontSize', 13, 'FontName', 'Times New Roman');
legend('衰减区域', '电场', '包络线', 'FontSize', 11, 'FontName', 'SimSun');
grid on;
set(gca, 'FontSize', 11, 'LineWidth', 1.5, 'Box', 'on', 'FontName', 'Times New Roman');
title('低损耗导电媒质中电磁波电场衰减 + 曾俊超', ...
    'FontSize', 18, 'FontName', 'KaiTi', 'Color', 'k', 'FontWeight', 'bold');
axis([0 5 -1.2 1.2]);
hold off;

print(fig1, 'E:\专业课\电磁波与电磁场\实验一\实验3_电磁波传播仿真\fig3_2_1', '-dpng', '-r600');

% 图2：分贝衰减
fig2 = figure('Position', [100 100 800 500], 'Color', 'w', 'Visible', 'off');

E_dB = 20*log10(exp(-alpha*z));
plot(z/lambda, E_dB, 'r-', 'LineWidth', 2);
xlabel('z / \lambda', 'FontSize', 13, 'FontName', 'Times New Roman');
ylabel('衰减量 (dB)', 'FontSize', 13, 'FontName', 'SimSun');
grid on;
set(gca, 'FontSize', 11, 'LineWidth', 1.5, 'Box', 'on', 'FontName', 'Times New Roman');
title('低损耗导电媒质中电磁波分贝衰减 + 曾俊超', ...
    'FontSize', 18, 'FontName', 'KaiTi', 'Color', 'k', 'FontWeight', 'bold');

print(fig2, 'E:\专业课\电磁波与电磁场\实验一\实验3_电磁波传播仿真\fig3_2_2', '-dpng', '-r600');

% 图3：不同时刻对比
fig3 = figure('Position', [100 100 900 500], 'Color', 'w', 'Visible', 'off');

t1 = 0;
t2 = pi/omega;
E1 = E0 * exp(-alpha*z) .* cos(omega*t1 - beta*z);
E2 = E0 * exp(-alpha*z) .* cos(omega*t2 - beta*z);

plot(z/lambda, E1, 'b-', 'LineWidth', 2, 'DisplayName', 't = 0');
hold on;
plot(z/lambda, E2, 'r-', 'LineWidth', 2, 'DisplayName', 't = T/2');
plot(z/lambda, E_envelope, 'k--', 'LineWidth', 1.5, 'DisplayName', '包络线');
plot(z/lambda, -E_envelope, 'k--', 'LineWidth', 1.5, 'HandleVisibility', 'off');
xlabel('z / \lambda', 'FontSize', 13, 'FontName', 'Times New Roman');
ylabel('E (V/m)', 'FontSize', 13, 'FontName', 'Times New Roman');
legend('FontSize', 11, 'FontName', 'Times New Roman');
grid on;
set(gca, 'FontSize', 11, 'LineWidth', 1.5, 'Box', 'on', 'FontName', 'Times New Roman');
title('低损耗导电媒质中不同时刻电磁波对比 + 曾俊超', ...
    'FontSize', 18, 'FontName', 'KaiTi', 'Color', 'k', 'FontWeight', 'bold');
axis([0 5 -1.2 1.2]);
hold off;

print(fig3, 'E:\专业课\电磁波与电磁场\实验一\实验3_电磁波传播仿真\fig3_2_3', '-dpng', '-r600');
