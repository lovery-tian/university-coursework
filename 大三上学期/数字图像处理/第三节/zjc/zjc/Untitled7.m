clc
clear all
I = imread('D:\Program Files\Polyspace\R2021a\Exercise\e5.bmp');
input_points  = [0 0; 1 0; 1 1; 0 1];        % 猜测：单位正方形
output_points = [0 0; 1 0; 0.8 1; 0.2 1];    % 猜测：梯形
tform = maketform('projective', input_points, output_points);
[B,xdata,ydata] = imtransform(I,tform,'bicubic', ...
                              'udata',[0 1],'vdata',[0 1], ...
                              'size',size(I),'fill',128);
figure; imshow(B,'XData',xdata,'YData',ydata); title('透视变换');