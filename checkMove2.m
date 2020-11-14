function [game_finished, full_game_matrix, new_im, move_number] = checkMove2(full_game_matrix, location_matrix, cam, move_number, side_length, prev_im)
        
        new_im = rgb2gray(snapshot(cam));
        cover_matrix = zeros(size(new_im, 1), size(new_im, 2));
        for i = 1:size(new_im,1)
            for j = 1:size(new_im,2)
                if new_im(i,j) > prev_im(i,j) + 2 || new_im(i,j) < prev_im(i,j) - 2
                    cover_matrix(i,j) = 1;
                    
                end
            end
        end
        
        figure;
        subplot(3,2,1);
        imshow(prev_im);
        subplot(3,2,2);
        imshow(new_im);
        
        
        subplot(3,2,3);
        imshow(cover_matrix);
        se  = strel('disk',4,0);
        cover_matrix = imopen(cover_matrix, se);
        
        
        
        
        subplot(3,2,4);
        imshow(cover_matrix); 
        
        se  = strel('disk',6,0);
        cover_matrix = imdilate(cover_matrix, se);
        
        subplot(3,2,5);
        imshow(cover_matrix); 
        
        CC = bwconncomp(cover_matrix, 8);
        properties = regionprops(CC, 'Centroid', 'Area');
        
        
        objects = CC.NumObjects;
        areas = [properties.Area];
        centroids = cat(1,properties.Centroid);
        min_dist = side_length;
        index = 1;
        poi = [0,0];
        for i = 1:objects
            if areas(i) > 2000
                for k = 1:8
                    for l = 1:8
                        dist = pdist([location_matrix(k,l,1), location_matrix(k,l,2); centroids(i,:)]);
                        if dist < min_dist
                             min_dist = dist;
                             poi(index,1) = k;
                             poi(index,2) = l;
                             
                        end
                        
                    end
                end
                if min_dist < side_length
                        index = index + 1;
                end
                min_dist = side_length;
            end
        end
        
        figure;
        
        imshow(new_im);
        hold on;
        if poi(1) ~= 0
            for i = 1:size(poi,1)
                scatter(location_matrix(poi(i, 1), poi(i,2), 1), location_matrix(poi(i, 1), poi(i,2), 2));
            end
            full_game_matrix(:,:,move_number + 1) = full_game_matrix(:,:,move_number);
            move_number = move_number + 1;
            %game_finished = 1;
            
        else
            game_finished = 0;
        end
        
        switch size(poi, 1)
            case 2
                piece1 = full_game_matrix(poi(1,1), poi(1,2), move_number-1);
                piece2 = full_game_matrix(poi(2,1), poi(2,2), move_number-1);
                
                if piece1 > 0 && piece2 == 0
                    full_game_matrix(poi(2,1), poi(2,2), move_number) = piece1;
                    full_game_matrix(poi(1,1), poi(1,2), move_number) = 0;
                    
                elseif piece2 > 0 && piece1 == 0
                    full_game_matrix(poi(2,1), poi(2,2), move_number) = 0;
                    full_game_matrix(poi(1,1), poi(1,2), move_number) = piece2;    
                end
                
                
                
                %if checkSquare2([location_matrix(poi(1,1), poi(1,2),1), location_matrix(poi(1,1), poi(1,2),2)], side_length, prev_im) == checkSquare2([location_matrix(poi(1,1), poi(1,2),1), location_matrix(poi(1,1), poi(1,2),2)], side_length, new_im)
                    
                    
                
                
        end
        
        
        
        game_finished = 0;
        
        
        
                    




end