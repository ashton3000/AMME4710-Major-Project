% Author: Ashan Abey
% Date: 10/9/2020
% Tutorial 3 Activity 4
clear;
clc;
clf;
clf reset;

im = rgb2gray(imread('image3.jpeg'));


im = imgaussfilt(im, 4);

se  = strel('disk',10,0);
im = imclose(im, se);
imshow(im);




[points1, boardSize] = detectCheckerboardPoints(im, 'MinCornerMetric', 0.05);

hold on;

scatter(points1(:,1), points1(:,2));