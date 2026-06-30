close all;
clear;
clc;
I=imread('D:\Program Files\Polyspace\R2021a\zjc\football.jpg');
[x,y,z]=sphere;
figure,
subplot(121),warp(I);
subplot(122),warp(x,y,z,I);
grid;
