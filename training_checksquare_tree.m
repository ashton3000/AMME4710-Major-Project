
clear;
clc;

side_length = 105;

load('centre_points_webcam_1');
centre_point = centrepoints(1,:);

load('imtest2');


%j = 0;
for i = 1:12
   if i > 6
       j = 24+i;
       
   else
       j = i;
       
   end
   
   imcropped = getCropped(centrepoints(j,:), side_length, im);
   figure;
   imshow(imcropped);
   im_matrix(:,:,3*(i-1)+1:3*i) = imcropped;
   imcropped = double(imcropped);
  
   [im_maskedBW, im_maskedRGB] = createMask2(imcropped);
   data_features(i,1) = mean(im_maskedRGB(:,:,3), 'all');
   
%    imcropped = rgb2hsv(imcropped);
   
   [im_maskedBW, im_maskedRGB] = createMask3(imcropped);
   data_features(i,2) = mean(im_maskedRGB(:,:,2), 'all');
   
   [im_maskedBW, im_maskedRGB] = createMask4(imcropped);
   data_features(i,3) = mean(im_maskedRGB(:,:,3), 'all');
   
   [im_maskedBW, im_maskedRGB] = createMask5(imcropped);
   data_features(i,4) = mean(im_maskedRGB(:,:,1), 'all');
   
    
end

feature_labels = [0,0,0,0,0,0,1,1,1,1,1,1]';

data_tree = fitctree(data_features, feature_labels, 'OptimizeHyperparameters', 'all');

