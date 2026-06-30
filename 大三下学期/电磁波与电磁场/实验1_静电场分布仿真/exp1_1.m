%% 两个等量异号电荷的电场和电位分布 - 学术级仿真
clear; clc; close all;

% 高精度网格
x = linspace(-2, 2, 500);
y = linspace(-2, 2, 500);
[X, Y] = meshgrid(x, y);

% 正电荷在(1,0)，负电荷在(-1,0)
r1 = sqrt((X-1).^2 + Y.^2);  % 到正电荷距离
r2 = sqrt((X+1).^2 + Y.^2);  % 到负电荷距离
r1(r1<0.05) = 0.05;  % 避免奇点
r2(r2<0.05) = 0.05;

% 电位计算
V = 1./r1 - 1./r2;

% 电场计算
[Ex, Ey] = gradient(-V, x(2)-x(1), y(2)-y(1));

% 绘图
fig = figure('Position', [100 100 800 700], 'Color', 'w', 'Visible', 'off');

% 填充等位线（彩色背景）
contourf(X, Y, V, 50, 'LineStyle', 'none');
colormap(jet);
cb = colorbar('FontSize', 11, 'FontName', 'Times New Roman');
cb.Label.String = '电位 V';
cb.Label.FontSize = 13;
cb.Label.FontName = 'SimSun';
hold on;

% 白色等位线
contour(X, Y, V, 25, 'w-', 'LineWidth', 0.6);

% 电场线（流线图）- 从正电荷出发
theta_start = linspace(0, 2*pi, 36);
start_x = 1 + 0.1*cos(theta_start);
start_y = 0.1*sin(theta_start);
streamline(X, Y, Ex, Ey, start_x, start_y);

% 电场线（流线图）- 从远处指向负电荷
theta_start2 = linspace(0, 2*pi, 36);
start_x2 = -1 + 0.5*cos(theta_start2);
start_y2 = 0.5*sin(theta_start2);
streamline(X, Y, -Ex, -Ey, start_x2, start_y2);

% 标记电荷
plot(1, 0, 'ro', 'MarkerSize', 18, 'MarkerFaceColor', 'r', 'LineWidth', 2);
plot(-1, 0, 'bo', 'MarkerSize', 18, 'MarkerFaceColor', 'b', 'LineWidth', 2);
text(1, 0.2, '+q', 'FontSize', 16, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'FontName', 'Times New Roman');
text(-1, 0.2, '-q', 'FontSize', 16, 'FontWeight', 'bold', 'HorizontalAlignment', 'center', 'FontName', 'Times New Roman');

% 美化
axis equal;
axis([-2 2 -2 2]);
xlabel('x', 'FontSize', 13, 'FontName', 'Times New Roman');
ylabel('y', 'FontSize', 13, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 11, 'LineWidth', 1.5, 'Box', 'on', 'FontName', 'Times New Roman');

% 添加标题：黑色楷体，清晰可见
title('两个等量异号电荷的电场线和等位线分布 + 曾俊超', ...
    'FontSize', 18, 'FontName', 'KaiTi', 'Color', 'k', 'FontWeight', 'bold');

hold off;

% 保存高分辨率图片
print(fig, 'E:\专业课\电磁波与电磁场\实验一\实验1_静电场分布仿真\fig1_1', '-dpng', '-r600');
