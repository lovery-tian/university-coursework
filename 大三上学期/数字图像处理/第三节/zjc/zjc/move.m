function output = move(input,tx,ty)

T = [1 0 0; 0 1 0;tx ty 1 ];
tform = affine2d(T);

output = imwarp(input,tform,'OutputView',imref2d(size(input)))

end

