function empty = checkEmpty(centre_point, side_length, im)
        
        load('piece_tree_webcam_adjusted_3');
        imcropped = getCropped(centre_point, side_length, im);
        h = size(imcropped,1);
        w = size(imcropped,2);
%         figure;
%         imshow(imcropped);
%         imcropped = double(imcropped);
        data_features(1,1) = abs(mean(imcropped(:, ((end/2)-5):((end/2)+5), 2), 'all')/(mean(imcropped(:, 1:10, 2), 'all')+ mean(imcropped(:, (end-10):end, 2), 'all')));
        imcropped = rgb2hsv(imcropped);
        data_features(1,2) = abs(mean(imcropped(:, ((end/2)-5):((end/2)+5), 2), 'all')/(mean(imcropped(:, 1:10, 2), 'all')+ mean(imcropped(:, (end-10):end, 2), 'all')));
        %data_features(1,3) = abs(mean(imcropped(:, ((end/2)-5):((end/2)+5), 3), 'all')/(mean(imcropped(:, 1:10, 3), 'all')+ mean(imcropped(:, (end-10):end, 3), 'all')));
        
        
        
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
        data_features(1,3) = abs(a-b);
        
        
        
        sq1 = mean(imcropped(0.1*w:0.15*w, 0.1*w:0.15*w, 1), 'all');
        sq2 = mean(imcropped(0.85*w:0.9*end, 0.1*w:0.15*w, 1), 'all');
        sq3 = mean(imcropped(0.1*w:0.15*w, 0.85*w:0.9*end, 1), 'all');
        sq4 = mean(imcropped(0.85*w:0.9*end, 0.85*w:0.9*end, 1), 'all');
        sq5 = mean(imcropped(0.45*w:0.55*w, 0.1*w:0.15*w, 1), 'all');
        sq6 = mean(imcropped(0.85*w:0.9*end, 0.45*w:0.55*w, 1), 'all');
        sq7 = mean(imcropped(0.1*w:0.15*w, 0.45*w:0.55*w, 1), 'all');
        sq8 = mean(imcropped(0.45*w:0.55*w, 0.85*w:0.9*end, 1), 'all');
        
        a = mean(imcropped(0.25*h:0.75*h, 0.25*w:0.75*w, 1), 'all');
        b = mean(rmoutliers([sq1, sq2, sq3, sq4, sq5, sq6, sq7, sq8]));
        data_features(1,4) = abs(a-b);
        
        data_features(1,5) = (std(imcropped(0.2*w:0.8*w, 0.2*w:0.8*w, 1),0, 'all'));
        empty = predict(data_tree, data_features);
        

end
