close all;
clear;
clc;
I=imread('D:\Program Files\Polyspace\R2021a\zjc\child.tif');
[X1,map1]=gray2ind(I,8);

figure,
subplot(131),imshow(I);
subplot(132),imshow(X1,map1);