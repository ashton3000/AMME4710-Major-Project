function [game_finished, full_game_matrix, new_im, move_number] = checkMove2(full_game_matrix, location_matrix, cam, move_number, side_length, prev_im)
        
        global board_matrix img_matrix
        
        new_im = rgb2gray(snapshot(cam));
        cover_matrix = zeros(size(new_im, 1), size(new_im, 2));
        for i = 1:size(new_im,1)
            for j = 1:size(new_im,2)
                if new_im(i,j) > prev_im(i,j) + 2 || new_im(i,j) < prev_im(i,j) - 2
                    cover_matrix(i,j) = 1;
                    
                end
            end
        end
        
%         figure;
%         subplot(3,2,1);
%         imshow(prev_im);
%         subplot(3,2,2);
%         imshow(new_im);
%         
%         
%         subplot(3,2,3);
%         imshow(cover_matrix);
        se  = strel('disk',6,0);
        cover_matrix = imopen(cover_matrix, se);
        
        
        
        
%         subplot(3,2,4);
%         imshow(cover_matrix); 
        
        se  = strel('disk',6,0);
        cover_matrix = imdilate(cover_matrix, se);
        
%         subplot(3,2,5);
%         imshow(cover_matrix); 
        
        CC = bwconncomp(cover_matrix, 8);
        properties = regionprops(CC, 'Centroid', 'Area');
        
        
        objects = CC.NumObjects;
        areas = [properties.Area];
%         if max(areas) > 50000
%             new_im = prev_im;
%             game_finished = 0;
%             return;
%         end
        centroids = cat(1,properties.Centroid);
        min_dist = side_length;
        index = 1;
        poi = [0,0,0];
        for i = 1:objects
            if areas(i) > (1/3)*(side_length)^2%4000
                for k = 1:8
                    for l = 1:8
                        dist = pdist([location_matrix(k,l,1), location_matrix(k,l,2); centroids(i,:)]);
                        if dist < min_dist
                            
                             if areas(i) > 50000
                                new_im = prev_im;
                                game_finished = 0;
                                return;
                             end
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
        
        for i = 1:size(poi,1)
            for j = 1:size(poi,1)
                if poi(i,1) == poi(j,1) && poi(i,2) == poi(j,2) && i~=j
                    poi(i,3) = 1;
                end
            end
        end
        
        for i = size(poi,1):-1:1
            if poi(i,3) == 1
                poi(i,:) = [];
            end
        end
        
        
%         figure;
%         
%         imshow(new_im);
        
        if poi(1) ~= 0
%             for i = 1:size(poi,1)
%                 scatter(location_matrix(poi(i, 1), poi(i,2), 1), location_matrix(poi(i, 1), poi(i,2), 2));
%             end
            full_game_matrix(:,:,move_number + 1) = full_game_matrix(:,:,move_number);
            move_number = move_number + 1;
            %game_finished = 1;
            
        else
            game_finished = 0;
        end
        
        if poi(1) ~= 0
            switch size(poi, 1)
                case 1
                    piece1 = full_game_matrix(poi(1,1), poi(1,2), move_number-1);
                    if piece1 == 16 
                        game_finished = 1;
                    elseif piece1 == 36
                        game_finished = 2;

                    else
                        game_finished = 0;
                    end


                case 2
                    piece1 = full_game_matrix(poi(1,1), poi(1,2), move_number-1);
                    piece2 = full_game_matrix(poi(2,1), poi(2,2), move_number-1);

                    if piece1 > 0 && piece2 == 0
                        full_game_matrix(poi(2,1), poi(2,2), move_number) = piece1;
                        full_game_matrix(poi(1,1), poi(1,2), move_number) = 0;
                        MovePiece([8-poi(1,1), poi(1,2)], [8-poi(2,1), poi(2,2)], piece1);

                    elseif piece2 > 0 && piece1 == 0
                        full_game_matrix(poi(2,1), poi(2,2), move_number) = 0;
                        full_game_matrix(poi(1,1), poi(1,2), move_number) = piece2;
                        %MovePiece([9-poi(2,1), poi(2,2)], [9-poi(1,1), poi(1,2)], piece2);
                        MovePiece([9-2,7],[9-7,7],7);
                        %MovePiece([9-2,6],[9-4,6],6);

                    else
                        switch mod(move_number,2)
                            case 0
                                if piece1 < 20 && piece1 > 0
                                    full_game_matrix(poi(2,1), poi(2,2), move_number) = piece1;
                                    full_game_matrix(poi(1,1), poi(1,2), move_number) = 0;

                                elseif piece2 < 20 && piece2 > 0
                                    full_game_matrix(poi(2,1), poi(2,2), move_number) = 0;
                                    full_game_matrix(poi(1,1), poi(1,2), move_number) = piece2;
                                end

                            case 1
                                if piece1 > 20 && piece1 < 40
                                    full_game_matrix(poi(2,1), poi(2,2), move_number) = piece1;
                                    full_game_matrix(poi(1,1), poi(1,2), move_number) = 0;

                                elseif piece2 > 20 && piece2 < 40
                                    full_game_matrix(poi(2,1), poi(2,2), move_number) = 0;
                                    full_game_matrix(poi(1,1), poi(1,2), move_number) = piece2;
                                end


                        end


                    end



                    %if checkSquare2([location_matrix(poi(1,1), poi(1,2),1), location_matrix(poi(1,1), poi(1,2),2)], side_length, prev_im) == checkSquare2([location_matrix(poi(1,1), poi(1,2),1), location_matrix(poi(1,1), poi(1,2),2)], side_length, new_im)


                game_finished = 0;

            end
            disp(full_game_matrix(:,:,move_number));
        else
            game_finished = 0;
            
            
        end
        
        
        
        
        
        
                    




end