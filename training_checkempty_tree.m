
clear;
clc;

side_length = 115;

load('adjusted_webcam_fullboard_location_matrix_2');
%centre_point = centrepoints(1,:);

load('adjusted_webcam_fullboard_2');


%j = 0;
for i = 1:8
    for j = 1:8
   
   
           imcropped = getCropped([location_matrix(i,j,1), location_matrix(i,j,2)], side_length, im);
           figure;
           imshow(imcropped);
           
           h = size(imcropped,1);
           w = size(imcropped,2);
           %hold on;
           %rectangle('Position', [0,25,size(imcropped,2),56], 'EdgeColor', 'b', 'LineWidth', 3);
           %im_matrix(:,:,3*(i-1)+1:3*i) = imcropped;
%            imcropped = double(imcropped);

        %    [im_maskedBW, im_maskedRGB] = createMask2(imcropped);
        %    data_features(i,1) = mean(im_maskedRGB(:,:,3), 'all');
        %    
        % %    imcropped = rgb2hsv(imcropped);
        %    
        %    [im_maskedBW, im_maskedRGB] = createMask3(imcropped);
        %    data_features(i,2) = mean(im_maskedRGB(:,:,2), 'all');
        %    
        %    [im_maskedBW, im_maskedRGB] = createMask4(imcropped);
        %    data_features(i,3) = mean(im_maskedRGB(:,:,3), 'all');
        %    
        %    [im_maskedBW, im_maskedRGB] = createMask5(imcropped);
        %    data_features(i,4) = mean(im_maskedRGB(:,:,1), 'all');

            %data_features(i,1) = mean(imcropped(:, 25:81, 3), 'all');


        %     imcroppedgray = rgb2gray(uint8(imcropped));
        %     canny_thresh = [0.4 0.5];
        %     canny_sigma = 2;
        %     imcroppedgray = imgaussfilt(imcroppedgray, 2);
        %     imshow(imcroppedgray);
        %     BWcanny = edge(imcroppedgray, 'canny', canny_thresh, canny_sigma);
        %     figure;
        %     imshow(BWcanny);
        %     data_features(i,2) = sum(BWcanny(25:81, 25:81), 'all');
            data_features((i-1)*8 + j,1) = abs(mean(imcropped(:, ((end/2)-5):((end/2)+5), 2), 'all')/(mean(imcropped(:, 1:10, 2), 'all')+ mean(imcropped(:, (end-10):end, 2), 'all')));
            imcropped = rgb2hsv(imcropped);
            data_features((i-1)*8 + j,2) = abs(mean(imcropped(:, ((end/2)-5):((end/2)+5), 2), 'all')/(mean(imcropped(:, 1:10, 2), 'all')+ mean(imcropped(:, (end-10):end, 2), 'all')));
            data_features((i-1)*8 + j,3) = abs(mean(imcropped(:, ((end/2)-5):((end/2)+5), 3), 'all')/(mean(imcropped(:, 1:10, 3), 'all')+ mean(imcropped(:, (end-10):end, 3), 'all')));

    end
end

feature_labels = zeros(64,1);
feature_labels(1:16) = 1;
feature_labels(49:64) = 1;

data_tree = fitctree(data_features, feature_labels, 'OptimizeHyperparameters', 'auto');

