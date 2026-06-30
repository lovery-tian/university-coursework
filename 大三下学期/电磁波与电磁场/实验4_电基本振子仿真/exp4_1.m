%% 电基本振子立体方向图 - 学术级仿真
clear; clc; close all;

theta = linspace(0, pi, 300);
phi = linspace(0, 2*pi, 600);
[Theta, Phi] = meshgrid(theta, phi);

F = abs(sin(Theta));

X = F .* sin(Theta) .* cos(Phi);
Y = F .* sin(Theta) .* sin(Phi);
Z = F .* cos(Theta);

% 图1：立体方向图
fig1 = figure('Position', [100 100 800 700], 'Color', 'w', 'Visible', 'off');

surf(X, Y, Z, F, 'EdgeColor', 'none', 'FaceAlpha', 0.95);
colormap(jet);
cb = colorbar('FontSize', 11, 'FontName', 'Times New Roman');
cb.Label.String = 'F(\theta)';
cb.Label.FontSize = 13;
cb.Label.FontName = 'Times New Roman';
axis equal;
xlabel('x', 'FontSize', 13, 'FontName', 'Times New Roman');
ylabel('y', 'FontSize', 13, 'FontName', 'Times New Roman');
zlabel('z', 'FontSize', 13, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 11, 'LineWidth', 1.5, 'Box', 'on', 'FontName', 'Times New Roman');
title('电基本振子立体方向图 + 曾俊超', ...
    'FontSize', 18, 'FontName', 'KaiTi', 'Color', 'k', 'FontWeight', 'bold');
view(45, 30);
lighting gouraud;
camlight('headlight');
camlight('right');
shading interp;

print(fig1, 'E:\专业课\电磁波与电磁场\实验一\实验4_电基本振子仿真\fig4_1_1', '-dpng', '-r600');

% 图2：多视角
fig2 = figure('Position', [100 100 1200 400], 'Color', 'w', 'Visible', 'off');

subplot(1,3,1);
surf(X, Y, Z, F, 'EdgeColor', 'none');
colormap(jet);
axis equal;
title('侧视图', 'FontSize', 13, 'FontName', 'SimSun');
view(0, 0);
lighting gouraud;
camlight('headlight');
set(gca, 'FontSize', 10, 'FontName', 'Times New Roman');

subplot(1,3,2);
surf(X, Y, Z, F, 'EdgeColor', 'none');
colormap(jet);
axis equal;
title('俯视图', 'FontSize', 13, 'FontName', 'SimSun');
view(0, 90);
lighting gouraud;
camlight('headlight');
set(gca, 'FontSize', 10, 'FontName', 'Times New Roman');

subplot(1,3,3);
surf(X, Y, Z, F, 'EdgeColor', 'none');
colormap(jet);
axis equal;
title('斜视图', 'FontSize', 13, 'FontName', 'SimSun');
view(45, 30);
lighting gouraud;
camlight('headlight');
set(gca, 'FontSize', 10, 'FontName', 'Times New Roman');

sgtitle('电基本振子多视角方向图 + 曾俊超', ...
    'FontSize', 18, 'FontName', 'KaiTi', 'Color', 'k', 'FontWeight', 'bold');

print(fig2, 'E:\专业课\电磁波与电磁场\实验一\实验4_电基本振子仿真\fig4_1_2', '-dpng', '-r600');
