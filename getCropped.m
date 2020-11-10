            
function imcropped = getCropped(centre_point, side_length, im)
            row_value_low = centre_point(2) - side_length/2;
            row_value_high = row_value_low + side_length;
            col_value_low = centre_point(1) - side_length/2;
            col_value_high = col_value_low + side_length;
            %imcropped = im(centre_point(1) - (side_length/2):centre_point(1) + (side_length/2), centre_point(2) -(side_length/2):centre_point(2) + (side_length/2));
            imcropped = im(row_value_low:row_value_high, col_value_low:col_value_high, :);
            
end
