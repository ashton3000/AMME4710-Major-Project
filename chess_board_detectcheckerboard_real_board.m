% Author: Ashan Abey
% Date: 10/9/2020
% Tutorial 3 Activity 4
clear;
clc;
clf;
clf reset;

im = rgb2gray(imread('IMG_0425.jpg'));

%im = imrotate(im, 30);

im = imgaussfilt(im, 4);

se  = strel('disk',10,0);
im = imclose(im, se);
imshow(im);




[points1, boardSize] = detectCheckerboardPoints(im, 'MinCornerMetric', 0.05);

hold on;

scatter(points1(:,1), points1(:,2));

D = pdist(points1);

edge = min(D);
[bottomleftx, index] = min(points1(:,1));
bottomlefty = points1(index, 2);
hold on;

%plot(bottomleftx, bottomlefty, '*');
for i = 1:length(points1)
    hold on;
    plot(points1(i,1), points1(i,2), '*');
    pause(0.5);
end