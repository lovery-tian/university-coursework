I=imread('D:\Program Files\Polyspace\R2021a\zjc\football.jpg')
J1=imrotate(I,30);
J2=imrotate(I,-30);
figure,
subplot(131),imshow(I);axis on;
subplot(132),imshow(J1);axis on;
subplot(133),imshow(J2);axis on;

