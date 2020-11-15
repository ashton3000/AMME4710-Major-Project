%% StartBoard
% Author - Tanishq Jain
% Sets up the intial game 

% Needs global board_matrix img_matrix
% board_matrix = zeros(8)
% img_matrix = cell{8}

% Argument - flip = bool 

function StartBoard(flip)
%  Load .mat files
    load Game_Replay_GUI/GUI_images.mat
    load Game_Replay_GUI/GUI_var.mat

board_im = imshow(board); hold on

global board_matrix img_matrix

if flip == 0
    % Assuming top edge is white
    board_matrix(1,:) = [ 2:6 4:-1:2] ;
    board_matrix(2,:) = 1 ;

    board_matrix(end,:) = [-2:-1:-6 -4:-2] ;
    board_matrix(end-1,:) = -1 ;
else
    % Assuming top edge is black
    board_matrix(end,:) = [ 2:6 4:-1:2] ;
    board_matrix(end-1,:) = 1 ;

    board_matrix(1,:) = [-2:-1:-6 -4:-2] ;
    board_matrix(2,:) = -1 ;
end

for row_b = 1:8
    for col_b = 1:8
        square_state = board_matrix(row_b,col_b) ;
        if square_state ~= 0
            [x_pos,y_pos,bg_color] = BoardCoordinates(row_b,col_b) ;
            piece_set_index = PlacePiece(square_state,bg_color) ;
            piece = piece_set{piece_set_index} ;
            im = piece(:,:,abs(square_state)) ;
            img_matrix{row_b,col_b} = imshow(im,'XData',x_pos,'YData',y_pos);
            hold on ;
        end
    end
end

end