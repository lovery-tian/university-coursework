I=imread('D:\Program Files\Polyspace\R2021a\zjc\child.tif')
tform=maketform('affine',[1 0 0; 0.5 1 0 ; 0 0 1]);
J=imtransform(I,tform);
figure,
subplot(121),imshow(I);axis on;
subplot(122),imshow(J);axis on;


