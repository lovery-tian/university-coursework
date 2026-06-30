I=imread('D:\Program Files\Polyspace\R2021a\zjc\lena.bmp')
a=50;b=50;
J1=move(I,a,b);
a=-50;b=50;
J2=move(I,a,b);
figure,
subplot(131),imshow(I);axis on;
subplot(132),imshow(J1);axis on;
subplot(133),imshow(J2);axis on;

