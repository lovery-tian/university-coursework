close all;
clear;
clc;
I=imread('D:\Program Files\Polyspace\R2021a\zjc\football.jpg');
[X1,map1]=rgb2ind(I,64);
[X2,map2]=rgb2ind(I,0.2);
map3=colorcube(128);
X3=rgb2ind(I,map3);
figure,
subplot(131),imshow(X1,map1);
subplot(132),imshow(X2,map2);
subplot(133),imshow(X3,map3);