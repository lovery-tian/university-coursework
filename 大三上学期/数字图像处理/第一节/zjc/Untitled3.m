close all;
clear;
clc;

W = 16;
I = imread('D:\Program Files\Polyspace\R2021a\zjc\lena.bmp');
I = im2bw(I, 0.5);

S = size(I);
J = I(S(1)/2-W/2 : S(1)/2+W/2-1, ...
      S(2)/2-W/2 : S(2)/2+W/2-1);

% 把两幅图放在同一个 figure 的左右子图
figure;
subplot(1,2,1); imshow(I); title('整幅二值图');
subplot(1,2,2); imshow(J); title('中心裁剪区域');