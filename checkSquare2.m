function colour = checkSquare2(centre_point, side_length, im)
        load('colour_tree');
        imcropped = getCropped(centre_point, side_length, im);
        [im_maskedBW, im_maskedRGB] = createMask(imcropped);
        data_features(1,1) = mean(im_maskedRGB(:,:,3), 'all');

        imcropped = rgb2hsv(imcropped);
        data_features(1,2) = mean(imcropped(:,:,2), 'all');
        data_features(1,3) = mean(imcropped(:,:,3), 'all');

        colour = predict(data_tree, data_features);


end
