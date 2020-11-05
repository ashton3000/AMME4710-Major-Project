% Author: Ashan Abey
% Date: 10/9/2020
% Tutorial 3 Activity 4
clear;
clc;
clf;
clf reset;

im = rgb2gray(imread('Test_chess_board_carpet.jpeg'));
imshow(im);

% %h = fspecial('gaussian',5);
% im = imgaussfilt(im, 4);
% 
% se  = strel('disk',10,0);
% im = imclose(im, se);
% figure;
% imshow(im);


canny_thresh = [0.55 0.6];
canny_sigma = 2;
%BWcanny = edge(im,'canny', canny_thresh, canny_sigma);
BWcanny = edge(im, 'canny');
figure;
subplot(4,1,1);
imshow(im);
subplot(4,1,2);
imshow(BWcanny);

se  = strel('disk',3,0);
imbwdilate = imdilate(BWcanny, se);
se  = strel('disk',10,0);
imerode1 = imerode(imbwdilate, se);
subplot(4,1,3);
imshow(imerode1);



se  = strel('disk',12,0);
im = imdilate(BWcanny, se);
figure;
subplot(4,1,1);
imshow(im);
se  = strel('disk',14,0);
im = imerode(im, se);
subplot(4,1,2);
imshow(im);


% random change
se  = strel('disk',8,0);
im = imerode(im, se);
subplot(4,1,3)
imshow(im);

% second random change
subplot(4,1,4);
imshow(im);

STATS = regionprops(im, 'Area', 'Centroid');
centroids = cat(1,STATS.Centroid);



figure;
imshow(im);
hold on;
plot(centroids(:,1), centroids(:,2), '*');

