%% BoardCoordinates
% Author - Tamishq Jain
% Returns the x and y positions of the square to be filled after adding 
% a margin to keep the grid lines visible

% Argument - row,col = row/col number of square
% Returns - x_pos,y_pos = bounding points of image
%           bg_color = bool (0:black , 1:white)

function [x_pos,y_pos,bg_color] = BoardCoordinates(row,col)
% Returns x and y positions for piece image to be placed at

    load Game_Replay_GUI/GUI_images.mat
    load Game_Replay_GUI/GUI_var.mat
    
    x_pos = [X(col),X(col) + square_size] ;
    y_pos = [Y(row),Y(row) + square_size] ;
    
%     Crop the square in question
    tile = imcrop(board,[x_pts(col) y_pts(row) tile_size tile_size]) ;
%     Binarize cropped image
    tile = imbinarize(tile) ;
%     Find mode of matrix to identify square color
    [bg_color,~] = mode(mode(tile(:,:))) ;
end
