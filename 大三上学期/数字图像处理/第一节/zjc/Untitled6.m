close all;
clear;
clc;
I = imread('D:\Program Files\Polyspace\R2021a\zjc\football.jpg');
[a b c]=size(I);
R=I;
R(:, :, 1) = I(:, :, 1);   
R(:, :, 2) = zeros(a,b);   
R(:, :, 3) = zeros(a,b);   
% R=unit8(R);
figure; imshow(R);
%%%%%%%%%%%%%%
R(:, :, 1) = zeros(a,b);   
R(:, :, 2) = I(:, :, 1);   
R(:, :, 3) = zeros(a,b);   
figure; imshow(R);
%%%%%%%%%%%%%%
R(:, :, 1) = zeros(a,b);   
R(:, :, 2) = zeros(a,b); 
R(:, :, 3) = I(:, :, 1);    
figure; imshow(R);