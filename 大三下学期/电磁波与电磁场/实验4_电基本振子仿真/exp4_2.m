%% 电基本振子E面和H面方向图 - 学术级仿真
clear; clc; close all;

theta = linspace(0, 2*pi, 1000);
phi = linspace(0, 2*pi, 1000);

F_E = abs(sin(theta));
F_H = ones(size(phi));

% 图1：极坐标对比
fig1 = figure('Position', [100 100 1000 450], 'Color', 'w', 'Visible', 'off');

subplot(1,2,1);
polarplot(theta, F_E, 'r-', 'LineWidth', 2.5);
title('E面方向图', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'SimSun');
rlim([0 1.2]);
set(gca, 'FontSize', 11, 'ThetaZeroLocation', 'top', 'ThetaDir', 'clockwise', 'FontName', 'Times New Roman');

subplot(1,2,2);
polarplot(phi, F_H, 'b-', 'LineWidth', 2.5);
title('H面方向图', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'SimSun');
rlim([0 1.2]);
set(gca, 'FontSize', 11, 'FontName', 'Times New Roman');

sgtitle('电基本振子E面和H面方向图 + 曾俊超', ...
    'FontSize', 18, 'FontName', 'KaiTi', 'Color', 'k', 'FontWeight', 'bold');

print(fig1, 'E:\专业课\电磁波与电磁场\实验一\实验4_电基本振子仿真\fig4_2_1', '-dpng', '-r600');

% 图2：E面直角坐标
fig2 = figure('Position', [100 100 800 550], 'Color', 'w', 'Visible', 'off');

theta_deg = theta * 180/pi;
fill([theta_deg, fliplr(theta_deg)], [F_E, zeros(size(F_E))], ...
     [1 0.85 0.85], 'EdgeColor', 'none', 'FaceAlpha', 0.4);
hold on;
plot(theta_deg, F_E, 'r-', 'LineWidth', 2.5);

plot(90, 1, 'ro', 'MarkerSize', 10, 'MarkerFaceColor', 'r');
text(90, 1.06, '(90°, 1)', 'FontSize', 11, 'HorizontalAlignment', 'center', 'FontName', 'Times New Roman');

half_power = 1/sqrt(2);
yline(half_power, 'g--', 'LineWidth', 1.5);
text(200, half_power+0.03, '-3dB', 'FontSize', 11, 'Color', 'g', 'FontName', 'Times New Roman');

xlabel('\theta (°)', 'FontSize', 13, 'FontName', 'Times New Roman');
ylabel('F(\theta)', 'FontSize', 13, 'FontName', 'Times New Roman');
grid on;
set(gca, 'FontSize', 11, 'LineWidth', 1.5, 'Box', 'on', 'FontName', 'Times New Roman');
xlim([0 360]);
ylim([0 1.2]);
title('电基本振子E面直角坐标方向图 + 曾俊超', ...
    'FontSize', 18, 'FontName', 'KaiTi', 'Color', 'k', 'FontWeight', 'bold');
hold off;

print(fig2, 'E:\专业课\电磁波与电磁场\实验一\实验4_电基本振子仿真\fig4_2_2', '-dpng', '-r600');

% 图3：3D方向图
fig3 = figure('Position', [100 100 800 650], 'Color', 'w', 'Visible', 'off');

theta_3d = linspace(0, pi, 250);
phi_3d = linspace(0, 2*pi, 500);
[Theta, Phi] = meshgrid(theta_3d, phi_3d);
F = abs(sin(Theta));

X = F .* sin(Theta) .* cos(Phi);
Y = F .* sin(Theta) .* sin(Phi);
Z = F .* cos(Theta);

surf(X, Y, Z, F, 'EdgeColor', 'none', 'FaceAlpha', 0.9);
colormap(jet);
cb = colorbar('FontSize', 11, 'FontName', 'Times New Roman');
cb.Label.String = 'F(\theta)';
cb.Label.FontSize = 13;
axis equal;
xlabel('x', 'FontSize', 13, 'FontName', 'Times New Roman');
ylabel('y', 'FontSize', 13, 'FontName', 'Times New Roman');
zlabel('z', 'FontSize', 13, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 11, 'LineWidth', 1.5, 'FontName', 'Times New Roman');
title('电基本振子3D方向图 + 曾俊超', ...
    'FontSize', 18, 'FontName', 'KaiTi', 'Color', 'k', 'FontWeight', 'bold');
view(45, 30);
lighting gouraud;
camlight('headlight');
shading interp;

print(fig3, 'E:\专业课\电磁波与电磁场\实验一\实验4_电基本振子仿真\fig4_2_3', '-dpng', '-r600');
