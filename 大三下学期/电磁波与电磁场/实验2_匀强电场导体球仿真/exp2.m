%% 匀强电场中接地导体球 - 学术级仿真
clear; clc; close all;

a = 1;      % 导体球半径
E0 = 1;     % 均匀电场强度

% 高精度极坐标网格
r = linspace(a, 3*a, 300);
theta = linspace(0, 2*pi, 500);
[R, Theta] = meshgrid(r, theta);

% 电位
V = -E0 * R .* cos(Theta) .* (1 - a^3./R.^3);

% 电场分量
Er = E0 * cos(Theta) .* (1 + 2*a^3./R.^3);
Etheta = -E0 * sin(Theta) .* (1 - a^3./R.^3);

% 转换为直角坐标
Ex = Er.*cos(Theta) - Etheta.*sin(Theta);
Ey = Er.*sin(Theta) + Etheta.*cos(Theta);
X = R.*cos(Theta);
Y = R.*sin(Theta);

% 图1：电场线和等位线
fig1 = figure('Position', [100 100 800 700], 'Color', 'w', 'Visible', 'off');

contourf(X, Y, V, 40, 'LineStyle', 'none');
colormap(jet);
cb = colorbar('FontSize', 11, 'FontName', 'Times New Roman');
cb.Label.String = '电位 V';
cb.Label.FontSize = 13;
cb.Label.FontName = 'SimSun';
hold on;

contour(X, Y, V, 25, 'w-', 'LineWidth', 0.6);

% 电场线
skip = 10;
quiver(X(1:skip:end,1:skip:end), Y(1:skip:end,1:skip:end), ...
       Ex(1:skip:end,1:skip:end), Ey(1:skip:end,1:skip:end), 1.2, 'k', 'LineWidth', 0.8);

% 导体球
tc = linspace(0, 2*pi, 100);
fill(a*cos(tc), a*sin(tc), [0.9 0.9 0.9], 'EdgeColor', 'k', 'LineWidth', 2);
text(0, 0, '接地', 'FontSize', 14, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'FontName', 'SimSun');

axis equal;
axis([-3*a 3*a -3*a 3*a]);
xlabel('x', 'FontSize', 13, 'FontName', 'Times New Roman');
ylabel('y', 'FontSize', 13, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 11, 'LineWidth', 1.5, 'Box', 'on', 'FontName', 'Times New Roman');
title('匀强电场中接地导体球的电场线和等位线分布 + 曾俊超', ...
    'FontSize', 18, 'FontName', 'KaiTi', 'Color', 'k', 'FontWeight', 'bold');
hold off;

print(fig1, 'E:\专业课\电磁波与电磁场\实验一\实验2_匀强电场导体球仿真\fig2_1', '-dpng', '-r600');

% 图2：电位三维曲面
fig2 = figure('Position', [100 100 800 600], 'Color', 'w', 'Visible', 'off');

surf(X, Y, V, 'EdgeColor', 'none', 'FaceAlpha', 0.9);
colormap(jet);
cb = colorbar('FontSize', 11, 'FontName', 'Times New Roman');
cb.Label.String = '电位 V';
cb.Label.FontSize = 13;
cb.Label.FontName = 'SimSun';
xlabel('x', 'FontSize', 13, 'FontName', 'Times New Roman');
ylabel('y', 'FontSize', 13, 'FontName', 'Times New Roman');
zlabel('V', 'FontSize', 13, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 11, 'LineWidth', 1.5, 'FontName', 'Times New Roman');
title('匀强电场中接地导体球的电位三维分布 + 曾俊超', ...
    'FontSize', 18, 'FontName', 'KaiTi', 'Color', 'k', 'FontWeight', 'bold');
view(45, 30);
lighting gouraud;
camlight('headlight');

print(fig2, 'E:\专业课\电磁波与电磁场\实验一\实验2_匀强电场导体球仿真\fig2_2', '-dpng', '-r600');
