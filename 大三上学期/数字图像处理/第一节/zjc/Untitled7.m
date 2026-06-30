close all;
clear;
clc;

I = imread('D:\Program Files\Polyspace\R2021a\zjc\football.jpg');
[a,b,~] = size(I);

% 红通道
R = I;
R(:,:,2:3) = 0;

% 绿通道
G = I;
G(:,:,1) = 0;
G(:,:,3) = 0;

% 蓝通道
B = I;
B(:,:,1:2) = 0;

% 三图合并到同一窗口
figure;
subplot(1,3,1); imshow(R); title('Red 通道');
subplot(1,3,2); imshow(G); title('Green 通道');
subplot(1,3,3); imshow(B); title('Blue 通道');