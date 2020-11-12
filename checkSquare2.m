function colour = checkSquare2(centre_point, side_length, im)
        
        load('colour_tree_webcam_adjusted');
        imcropped = getCropped(centre_point, side_length, im);
        h = size(imcropped,1);
        w = size(imcropped,2);
        data_features(1,1) = mean(imcropped(0.25*h:0.75*h, 0.25*w:0.75*w, 3), 'all');
        imcropped = rgb2hsv(imcropped);
        data_features(1,2) = mean(imcropped(0.25*h:0.75*h, 0.25*w:0.75*w, 2), 'all');
        data_features(1,3) = mean(imcropped(0.25*h:0.75*h, 0.25*w:0.75*w, 3), 'all');
        data_features(1,4) = mean(imcropped(0.25*h:0.75*h, 0.25*w:0.75*w, 1), 'all');
        imcropped = hsv2rgb(imcropped);
        imcropped = rgb2gray(imcropped);
        data_features(1,5) = mean(imcropped(0.25*h:0.75*h, 0.25*w:0.75*w), 'all');
        colour = predict(data_tree, data_features);


end
