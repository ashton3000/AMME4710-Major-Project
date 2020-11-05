% Author: Ashan Abey
% Date: 10/9/2020
% Tutorial 3 Activity 4
clear;
clc;
clf;
clf reset;

im = rgb2gray(imread('image3.jpeg'));
imshow(im);

im = imgaussfilt(im, 4);

se  = strel('disk',10,0);
im = imclose(im, se);





points1 = detectHarrisFeatures(im, 'MinQuality', 0.1);

hold on;

scatter(points1.Location(:, 1), points1.Location(:,2));