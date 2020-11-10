
function colour = checkSquare(centre_point, side_length, im)

            row_value_low = centre_point(2) - side_length/2;
            row_value_high = row_value_low + side_length;
            col_value_low = centre_point(1) - side_length/2;
            col_value_high = col_value_low + side_length;
            %imcropped = im(centre_point(1) - (side_length/2):centre_point(1) + (side_length/2), centre_point(2) -(side_length/2):centre_point(2) + (side_length/2));
            imcropped = im(row_value_low:row_value_high, col_value_low:col_value_high, :);
            figure;
            imshow(imcropped);
            figure; 
            
            imdouble = double(imcropped);
            
            imfilt1 = colfilt(imdouble(:,:,1), [6,6], 'sliding', @mean);
            imfilt2 = colfilt(imdouble(:,:,2), [6,6], 'sliding', @mean);
            imfilt3 = colfilt(imdouble(:,:,3), [6,6], 'sliding', @mean);
            
            imfilt(:,:,1) =  imfilt1; 
            imfilt(:,:,2) = imfilt2;
            imfilt(:,:,3) = imfilt3;
            imshow(uint8(imfilt));
            
            counts = imhist(rgb2gray(uint8(imfilt)), 24);
            T = otsuthresh(counts);
            BW = imbinarize(rgb2gray(uint8(imfilt)), T);
            figure;
            imshow(BW);

            colour = 1;

end
