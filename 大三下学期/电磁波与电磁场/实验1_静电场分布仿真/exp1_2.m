%% 无限长均匀带电直线的电场和电位分布 - 学术级仿真
clear; clc; close all;

% 高精度网格
[X, Y] = meshgrid(linspace(-4, 4, 500), linspace(-4, 4, 500));

% 电位计算 V = -ln(r)
R = sqrt(X.^2 + Y.^2);
R(R < 0.1) = 0.1;
V = -log(R);

% 电场计算
[Ex, Ey] = gradient(-V, 0.016, 0.016);

% 绘图
fig = figure('Position', [100 100 800 700], 'Color', 'w', 'Visible', 'off');

% 填充等位线
contourf(X, Y, V, 40, 'LineStyle', 'none');
colormap(jet);
cb = colorbar('FontSize', 11, 'FontName', 'Times New Roman');
cb.Label.String = '电位 V';
cb.Label.FontSize = 13;
cb.Label.FontName = 'SimSun';
hold on;

% 白色等位线
contour(X, Y, V, 20, 'w-', 'LineWidth', 0.6);

% 电场线（流线）
theta = linspace(0, 2*pi, 24);
start_x = 0.3*cos(theta);
start_y = 0.3*sin(theta);
streamline(X, Y, Ex, Ey, start_x, start_y);

% 标记带电直线
plot(0, 0, 'ko', 'MarkerSize', 22, 'MarkerFaceColor', 'k', 'LineWidth', 2);
text(0.4, 0.4, '带电直线', 'FontSize', 14, 'FontWeight', 'bold', 'FontName', 'SimSun');

% 美化
axis equal;
axis([-4 4 -4 4]);
xlabel('x', 'FontSize', 13, 'FontName', 'Times New Roman');
ylabel('y', 'FontSize', 13, 'FontName', 'Times New Roman');
set(gca, 'FontSize', 11, 'LineWidth', 1.5, 'Box', 'on', 'FontName', 'Times New Roman');

% 添加标题：黑色楷体，清晰可见
title('无限长均匀带电直线的电场线和等位线分布 + 曾俊超', ...
    'FontSize', 18, 'FontName', 'KaiTi', 'Color', 'k', 'FontWeight', 'bold');

hold off;

% 保存高分辨率图片
print(fig, 'E:\专业课\电磁波与电磁场\实验一\实验1_静电场分布仿真\fig1_2', '-dpng', '-r600');
