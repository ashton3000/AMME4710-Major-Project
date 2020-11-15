%% PlacePiece
% Author - Tanishq Jain
% Uses the piece id and background color to determine the image tranform
% to be used so as to merge with background square

% Argument -bg_color = background tile color 0:black,1:white
% square_state = 
% 0 - Empty
% 1 - pawn
% 2 - rook
% 3 - knight
% 4 - bishop
% 5 - queen
% 6 - king
% +ve - white
% -ve - black

% Returns - piece_set_index = 1:4 int spiecifying what image set to use
% 1:white_piece_set
% 2:black_piece_set
% 3:inv_white_piece_set
% 4:inv_black_piece_set

function piece_set_index = PlacePiece(square_state,bg_color)
    % White square piece
    if bg_color
    %     white piece
        if square_state > 0 
            piece_set_index = 1 ;

    %      black pawn
        elseif square_state == -1  
            piece_set_index = 4 ;

    %      black pieces
        elseif square_state < -1
            piece_set_index = 2 ;
        end

    % Black square piece
    else
    %     white piece
        if square_state > 1 
            piece_set_index = 4 ;

    %      white pawn
        elseif square_state == 1  
            piece_set_index = 2 ;

    %      black pieces
        elseif square_state < 0
            piece_set_index = 3 ;
        end
    end
end