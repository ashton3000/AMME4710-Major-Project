
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
           hold on;
           rectangle('Position', [0.1*w,0.1*w,0.05*w,0.05*w], 'EdgeColor', 'b', 'LineWidth', 3);
%            hold on;
%            rectangle('Position', [0.85*w,0.1*w,0.05*w,0.05*w], 'EdgeColor', 'b', 'LineWidth', 3);
%            hold on;
%            rectangle('Position', [0.1*w,0.1*w,0.05*w,0.05*w], 'EdgeColor', 'b', 'LineWidth', 3);
%            hold on;
%            rectangle('Position', [0.1*w,0.1*w,0.05*w,0.05*w], 'EdgeColor', 'b', 'LineWidth', 3);
           im_matrix(:,:,(i-1)*8*3 + (j-1)*3 +1:(i-1)*8*3 + (j-1)*3 +3) = imcropped;
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
            data_features((i-1)*8 + j,1) = abs(mean(imcropped(:, ((end/2)-10):((end/2)+10), 2), 'all')/(mean(imcropped(:, 1:10, 2), 'all')+ mean(imcropped(:, (end-10):end, 2), 'all')));
            imcropped = rgb2hsv(imcropped);
            data_features((i-1)*8 + j,2) = abs(mean(imcropped(:, ((end/2)-10):((end/2)+10), 2), 'all')/(mean(imcropped(:, 1:10, 2), 'all')+ mean(imcropped(:, (end-10):end, 2), 'all')));
            %data_features((i-1)*8 + j,3) = abs(mean(imcropped(:, ((end/2)-10):((end/2)+10), 3), 'all')/(mean(imcropped(:, 1:10, 3), 'all')+ mean(imcropped(:, (end-10):end, 3), 'all')));
            %data_features((i-1)*8 + j,4) = abs(mean(imcropped(:, ((end/2)-10):((end/2)+10), 1), 'all')/(mean(imcropped(:, 1:10, 1), 'all')+ mean(imcropped(:, (end-10):end, 1), 'all')));
            
            sq1 = mean(imcropped(0.1*w:0.15*w, 0.1*w:0.15*w, 2), 'all');
            sq2 = mean(imcropped(0.85*w:0.9*end, 0.1*w:0.15*w, 2), 'all');
            sq3 = mean(imcropped(0.1*w:0.15*w, 0.85*w:0.9*end, 2), 'all');
            sq4 = mean(imcropped(0.85*w:0.9*end, 0.85*w:0.9*end, 2), 'all');
            sq5 = mean(imcropped(0.45*w:0.55*w, 0.1*w:0.15*w, 2), 'all');
            sq6 = mean(imcropped(0.85*w:0.9*end, 0.45*w:0.55*w, 2), 'all');
            sq7 = mean(imcropped(0.1*w:0.15*w, 0.45*w:0.55*w, 2), 'all');
            sq8 = mean(imcropped(0.45*w:0.55*w, 0.85*w:0.9*end, 2), 'all');
            a = mean(imcropped(0.25*h:0.75*h, 0.25*w:0.75*w, 2), 'all');
            b = mean(rmoutliers([sq1, sq2, sq3, sq4, sq5, sq6, sq7, sq8]));
            data_features((i-1)*8 + j,3) = abs(a-b);
            
            
            
            
            
            sq1 = mean(imcropped(0.1*w:0.15*w, 0.1*w:0.15*w, 1), 'all');
            sq2 = mean(imcropped(0.85*w:0.9*end, 0.1*w:0.15*w, 1), 'all');
            sq3 = mean(imcropped(0.1*w:0.15*w, 0.85*w:0.9*end, 1), 'all');
            sq4 = mean(imcropped(0.85*w:0.9*end, 0.85*w:0.9*end, 1), 'all');
            sq5 = mean(imcropped(0.45*w:0.55*w, 0.1*w:0.15*w, 1), 'all');
            sq6 = mean(imcropped(0.85*w:0.9*end, 0.45*w:0.55*w, 1), 'all');
            sq7 = mean(imcropped(0.1*w:0.15*w, 0.45*w:0.55*w, 1), 'all');
            sq8 = mean(imcropped(0.45*w:0.55*w, 0.85*w:0.9*end, 1), 'all');
%             data_features((i-1)*8 + j,4) = mean(imcropped(0.25*h:0.75*h, 0.25*w:0.75*w, 1), 'all');
%             data_features((i-1)*8 + j,5) = mean(rmoutliers([sq1, sq2, sq3, sq4, sq5, sq6, sq7, sq8]));
            a = mean(imcropped(0.25*h:0.75*h, 0.25*w:0.75*w, 1), 'all');
            b = mean(rmoutliers([sq1, sq2, sq3, sq4, sq5, sq6, sq7, sq8]));
            data_features((i-1)*8 + j,4) = abs(a-b);
            
            data_features((i-1)*8 + j,5) = (std(imcropped(0.2*w:0.8*w, 0.2*w:0.8*w, 1),0, 'all'));
            
            
            
%             data_features((i-1)*8 + j,6) = abs(a-b);
            
            
    end
end

feature_labels = zeros(64,1);
feature_labels(1:16) = 1;
feature_labels(49:64) = 1;

data_tree = fitctree(data_features, feature_labels, 'OptimizeHyperparameters', 'auto');

