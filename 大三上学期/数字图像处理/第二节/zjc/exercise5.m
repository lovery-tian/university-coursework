close all;
clear;
clc;
I=imread('D:\Program Files\Polyspace\R2021a\zjc\child.tif');
BW1=im2bw(I,0.4);
BW2=im2bw(I,0.6);
figure,
subplot(131),imshow(I);
subplot(132),imshow(BW1);
subplot(133),imshow(BW2);