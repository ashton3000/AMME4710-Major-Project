% Author: Ashan Abey
% Date: 10/9/2020
% Tutorial 3 Activity 4
clear;
clc;
clf;
clf reset;

im = rgb2gray(imread('Test_chess_board_carpet.jpeg'));
% imshow(im);

%h = fspecial('gaussian',5);
im = imgaussfilt(im, 4);

se  = strel('disk',10,0);
im = imclose(im, se);
% figure;
% imshow(im);
% %rgb2gray();
% hy = fspecial('sobel');
% hx = hy';
% grad_x = imfilter(double(im), hx, 'replicate');
% grad_y = imfilter(double(im), hy, 'replicate');
% grad_mag = sqrt(grad_x.^2 + grad_y.^2);
% grad_dir = atan2(grad_y,grad_x);
% 
% subplot(5,1,2);
% imshow(grad_mag,[]);
% 
% 
% 
% BW = imbinarize(mat2gray(grad_mag));
% grad_dir_show = grad_dir;
% grad_dir_show(repmat(~BW,[1 1 1])) = 0;
% % subplot(5,1,3);
% % imagesc(grad_dir_show,[-pi,pi]);
% 
% BWe = edge(im,'sobel');
% subplot(5,1,4);
% imshow(BWe);

canny_thresh = [0.55 0.6];
canny_sigma = 2;
BWcanny = edge(im,'canny', canny_thresh, canny_sigma);
%BWcanny = edge(im, 'canny');
%subplot(4,1,2);
% figure;
imshow(BWcanny);

se  = strel('disk',3,0);
imbwdilate = imdilate(BWcanny, se);
se  = strel('disk',10,0);
imerode1 = imerode(imbwdilate, se);
%subplot(4,1,3);
%imshow(imerode1);



se  = strel('disk',12,0);
im = imdilate(BWcanny, se);
% subplot(4,1,1);
% imshow(im);
se  = strel('disk',14,0);
im = imerode(im, se);
% subplot(4,1,2);
% imshow(im);



se  = strel('disk',12,0);
im = imerode(im, se);
% subplot(4,1,3)
% imshow(im);


% subplot(4,1,4);
% imshow(im);

STATS = regionprops(im, 'Area', 'Centroid');
centroids = cat(1,STATS.Centroid);

[H, theta, rho] = hough(BWcanny);

% figure
% imshow(imadjust(rescale(H)),[],...
%        'XData',theta,...
%        'YData',rho,...
%        'InitialMagnification','fit');
% xlabel('\theta (degrees)');
% ylabel('\rho');
% axis on;
% axis normal; 
% hold on;
% colormap(gca,hot);

P = houghpeaks(H,50);

x = theta(P(:,2));
y = rho(P(:,1));
% plot(x,y,'s','color','black');

lines = houghlines(BWcanny,theta,rho,P,'MinLength',1, 'FillGap', 100);


figure, imshow(BWcanny), hold on
max_len = 0;
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');

   % Plot beginnings and ends of lines
   plot(xy(1,1),xy(1,2),'x','LineWidth',2,'Color','yellow');
   plot(xy(2,1),xy(2,2),'x','LineWidth',2,'Color','red');

   % Determine the endpoints of the longest line segment
   len = norm(lines(k).point1 - lines(k).point2);
   if ( len > max_len)
      max_len = len;
      xy_long = xy;
   end
end
% highlight the longest line segment
%plot(xy_long(:,1),xy_long(:,2),'LineWidth',2,'Color','red');

% figure;
% imshow(im);
% hold on;
% plot(centroids(:,1), centroids(:,2), '*');

% figure;
% imagesc(grad_dir_show,[-pi,pi]);