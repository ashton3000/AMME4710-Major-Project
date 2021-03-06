% Author: Ashan Abey
% Date: 10/9/2020
% Tutorial 3 Activity 3
clear;
clc;

imchess = imread('Test_chess_board_carpet.jpeg');
figure;

subplot(2,2,1);
imshow(imchess);
imchess_double = double(imchess);
imfilt1 = colfilt(imchess_double(:,:,1), [24,24], 'sliding', @std);
imfilt2 = colfilt(imchess_double(:,:,2), [24,24], 'sliding', @std);
imfilt3 = colfilt(imchess_double(:,:,3), [24,24], 'sliding', @std);
subplot(2,2,2);
% imfilt = stdfilt(imdog, ones(1));


imfilt(:,:,1) =  imfilt1; 
imfilt(:,:,2) = imfilt2;
imfilt(:,:,3) = imfilt3;

imshow(uint8(imfilt));

counts = imhist(rgb2gray(uint8(imfilt)), 16);
T = otsuthresh(counts);
BW = imbinarize(rgb2gray(uint8(imfilt)), T);
subplot(2,2,3);
imshow(BW);
