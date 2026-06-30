%% 无耗媒质中电磁波传播 - 学术级仿真
clear; clc; close all;

E0 = 1;
f = 1e9;
omega = 2*pi*f;
c = 3e8;
lambda = c/f;
k = 2*pi/lambda;
eta = 377;
T = 1/f;

z = linspace(0, 2*lambda, 1000);

% 图1：多时刻电场分布
fig1 = figure('Position', [100 100 900 500], 'Color', 'w', 'Visible', 'off');

t1 = 0;
t2 = T/4;
t3 = T/2;
E1 = E0 * cos(omega*t1 - k*z);
E2 = E0 * cos(omega*t2 - k*z);
E3 = E0 * cos(omega*t3 - k*z);

plot(z/lambda, E1, 'b-', 'LineWidth', 2, 'DisplayName', 't = 0');
hold on;
plot(z/lambda, E2, 'r--', 'LineWidth', 2, 'DisplayName', 't = T/4');
plot(z/lambda, E3, 'g-.', 'LineWidth', 2, 'DisplayName', 't = T/2');
xlabel('z / \lambda', 'FontSize', 13, 'FontName', 'Times New Roman');
ylabel('E (V/m)', 'FontSize', 13, 'FontName', 'Times New Roman');
legend('FontSize', 11, 'FontName', 'Times New Roman', 'Location', 'northeast');
grid on;
set(gca, 'FontSize', 11, 'LineWidth', 1.5, 'Box', 'on', 'FontName', 'Times New Roman');
title('无耗媒质中多时刻电磁波电场分布 + 曾俊超', ...
    'FontSize', 18, 'FontName', 'KaiTi', 'Color', 'k', 'FontWeight', 'bold');
axis([0 2 -1.3 1.3]);
hold off;

print(fig1, 'E:\专业课\电磁波与电磁场\实验一\实验3_电磁波传播仿真\fig3_1_1', '-dpng', '-r600');

% 图2：电场和磁场对比
fig2 = figure('Position', [100 100 900 500], 'Color', 'w', 'Visible', 'off');

t = 0;
E = E0 * cos(omega*t - k*z);
H = (E0/eta) * cos(omega*t - k*z);

yyaxis left;
plot(z/lambda, E, 'b-', 'LineWidth', 2);
ylabel('E (V/m)', 'FontSize', 13, 'FontName', 'Times New Roman', 'Color', 'b');
ylim([-1.3 1.3]);

yyaxis right;
plot(z/lambda, H*eta, 'r-', 'LineWidth', 2);
ylabel('H \times \eta', 'FontSize', 13, 'FontName', 'Times New Roman', 'Color', 'r');
ylim([-1.3 1.3]);

xlabel('z / \lambda', 'FontSize', 13, 'FontName', 'Times New Roman');
legend('电场 E', '磁场 H \times \eta', 'FontSize', 11, 'FontName', 'SimSun');
grid on;
set(gca, 'FontSize', 11, 'LineWidth', 1.5, 'Box', 'on', 'FontName', 'Times New Roman');
title('无耗媒质中电磁波电场和磁场分布 + 曾俊超', ...
    'FontSize', 18, 'FontName', 'KaiTi', 'Color', 'k', 'FontWeight', 'bold');

print(fig2, 'E:\专业课\电磁波与电磁场\实验一\实验3_电磁波传播仿真\fig3_1_2', '-dpng', '-r600');
