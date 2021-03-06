
clear;
clc;

side_length = 115;

load('adjusted_webcam_fullboard_location_matrix_1');
%centre_point = centrepoints(1,:);

load('adjusted_webcam_fullboard_1');

index = 1;

    for i = 1:8
        for j = 1:8

            if i == 1 || i == 2 || i == 7 || i == 8
               imcropped = getCropped([location_matrix(i,j,1), location_matrix(i,j,2)], side_length, im);
               figure;
               imshow(imcropped);
               hold on;
               h = size(imcropped,1);
               w = size(imcropped,2);
               rectangle('Position', [0.25*h,0.25*w,0.5*h,0.5*h], 'EdgeColor', 'b', 'LineWidth', 3);
               %im_matrix(:,:,3*(i-1)+1:3*i) = imcropped;
               %imcropped = double(imcropped);

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
            
                data_features(index,1) = mean(imcropped(0.25*h:0.75*h, 0.25*w:0.75*w, 3), 'all');
                imcropped = rgb2hsv(imcropped);
                data_features(index,2) = mean(imcropped(0.25*h:0.75*h, 0.25*w:0.75*w, 2), 'all');
                data_features(index,3) = mean(imcropped(0.25*h:0.75*h, 0.25*w:0.75*w, 3), 'all');
                data_features(index,4) = mean(imcropped(0.25*h:0.75*h, 0.25*w:0.75*w, 1), 'all');
                imcropped = hsv2rgb(imcropped);
                imcropped = rgb2gray(imcropped);
                data_features(index,5) = mean(imcropped(0.25*h:0.75*h, 0.25*w:0.75*w), 'all');
                index = index + 1;
            end
                

        end


    end
    
    
   


feature_labels = zeros(32,1);
feature_labels(1:16) = 1;

%data_tree = fitctree(data_features, feature_labels, 'OptimizeHyperparameters', 'auto');

