%% MovePiece
% Author - Tanishq Jain
% Moves piece as they're moved in video

% Needs global img_matrix and must be run after StartBoard

% Argument - from = [original_row,original_col]
%            to = [to_row,to_col]
%            piece_id is the id for the piece as shown in PlacePiece

function MovePiece(from,to,piece_id)
    global img_matrix board_matrix
    load Game_Replay_GUI/GUI_images.mat ;
    
    if board_matrix(to(1),to(2)) ~= 0
        delete(img_matrix{to(1),to(2)}) ;
    
    % Remove piece from original tile
    delete(img_matrix{from(1),from(2)}) ;

    % get information about new tile
    [x_pos,y_pos,bg_color] = BoardCoordinates(to(1),to(2)) ;
    
    % get piece_set_id
    piece_set_index = PlacePiece(piece_id,bg_color) ;
    
    % retrive image matrix
    piece = piece_set{piece_set_index} ;
    im = piece(:,:,abs(piece_id)) ;
    
    % place piece at x_pos and y_pos
    img_matrix{to(1),to(2)} = imshow(im,'XData',x_pos,'YData',y_pos);
    hold on;
end