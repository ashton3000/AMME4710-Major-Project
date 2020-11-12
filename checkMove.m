function [game_finished, full_game_matrix] = checkMove(full_game_matrix, location_matrix, cam, move_number, side_length)
        
        im = snapshot(cam);
        %im = imread('iphone_pic_onemove.jpg');
        for i = 1:8
            for j = 1:8
                if full_game_matrix(i,j,move_number) > 0
                    empty = checkEmpty([location_matrix(i,j,1),location_matrix(i,j,2)], side_length, im);
                    
                    
                    if empty == 0
                        for k = 1:8
                            for l = 1:8
                                if full_game_matrix(i,j,move_number) == 0
                                    empty = checkEmpty([location_matrix(i,j,1),location_matrix(i,j,2)], side_length, im);
                                    if empty == 1
                                        full_game_matrix(:,:,move_number + 1) = full_game_matrix(:,:,move_number);
                                        full_game_matrix(k,l,move_number + 1) = full_game_matrix(i,j,move_number);
                                        full_game_matrix(i,j,move_number + 1) = 0;
                                    end
                                end
                                
                            end
                        end
                    end
                end
            end
        end
        game_finished = 1;
                    




end