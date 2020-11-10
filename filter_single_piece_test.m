clear;

clc;

figure;
load('im_matrix_webcam');
imchess = im_matrix(:,:,4:6);
imshow(imchess);
imchess_double = double(imchess);
imfilt1 = colfilt(imchess_double(:,:,1), [8,8], 'sliding', @mean);
imfilt2 = colfilt(imchess_double(:,:,2), [8,8], 'sliding', @mean);
imfilt3 = colfilt(imchess_double(:,:,3), [8,8], 'sliding', @mean);

imfilt(:,:,1) =  imfilt1; 
imfilt(:,:,2) = imfilt2;
imfilt(:,:,3) = imfilt3;

figure;
imshow(uint8(imfilt));

counts = imhist(rgb2gray(uint8(imfilt)), 64);
T = otsuthresh(counts);
BW = imbinarize(rgb2gray(uint8(imfilt)), T);

figure;
imshow(BW);
