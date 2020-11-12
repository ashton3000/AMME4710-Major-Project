function empty = checkEmpty(centre_point, side_length, im)
        
        load('piece_tree_webcam_adjusted');
        imcropped = getCropped(centre_point, side_length, im);
%         figure;
%         imshow(imcropped);
%         imcropped = double(imcropped);
        data_features(1,1) = abs(mean(imcropped(:, ((end/2)-5):((end/2)+5), 2), 'all')/(mean(imcropped(:, 1:10, 2), 'all')+ mean(imcropped(:, (end-10):end, 2), 'all')));
        imcropped = rgb2hsv(imcropped);
        data_features(1,2) = abs(mean(imcropped(:, ((end/2)-5):((end/2)+5), 2), 'all')/(mean(imcropped(:, 1:10, 2), 'all')+ mean(imcropped(:, (end-10):end, 2), 'all')));
        data_features(1,3) = abs(mean(imcropped(:, ((end/2)-5):((end/2)+5), 3), 'all')/(mean(imcropped(:, 1:10, 3), 'all')+ mean(imcropped(:, (end-10):end, 3), 'all')));


        empty = predict(data_tree, data_features);


end
