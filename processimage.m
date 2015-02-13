function im = processimage(filename,xsize);

%Read
im = imread(filename);


%Reshape and equalize
im = im2double(im(:,:,1));
im = histeq(im);
im = im - mean(im(:));
im = imresize(im,[xsize xsize]);
im = reshape(im,xsize*xsize,1);