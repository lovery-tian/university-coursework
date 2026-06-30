close all;
clear;
clc;
I=imread('D:\Program Files\Polyspace\R2021a\zjc\lena.bmp');

subplot(221),imshow(I);
subplot(222),image(I);
subplot(223),image([50,200],[50,300],I);
subplot(224),imagesc(I,[60,150]);