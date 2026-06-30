I=imread('D:\Program Files\Polyspace\R2021a\zjc\child.tif')
J1=imresize(I,0.1);
J2=imresize(I,10);
figure,
subplot(131),imshow(I);axis on;
subplot(132),imshow(J1);axis on;
subplot(133),imshow(J2);axis on;

