%% 1. 读图
I = imread('D:\Program Files\Polyspace\R2021a\zjc\lena.bmp');

%% 2. 构造投影变换（projective）
% 输入四边形：左上角→右上角→右下角→左下角（顺时针）
input_points  = [0 0; 1 0; 1 1; 0 1];   % 单位正方形
output_points = [0 0; 1 0; 0.8 1; 0.2 1]; % 上端向内“收缩”的梯形

tform = maketform('projective', input_points, output_points);  % 参数名加引号

%% 3. 计算输出空间范围
all_points = [output_points; output_points(1,:)];  % 封闭多边形
min_x = min(all_points(:,1));
max_x = max(all_points(:,1));
min_y = min(all_points(:,2));
max_y = max(all_points(:,2));

udata = [min_x max_x];
vdata = [min_y max_y];

%% 4. 投影变换 + 双三次插值
[B,xdata,ydata] = imtransform(I,tform,'bicubic', ...
                              'udata',udata, ...
                              'vdata',vdata, ...
                              'size',size(I), ...
                              'fill',128);

%% 5. 显示结果
figure;
subplot(1,2,1); imshow(I); axis on; title('原图');
subplot(1,2,2); imshow(B,'XData',xdata,'YData',ydata); axis on; title('投影变换');