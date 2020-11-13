% Author - Tanishq Jain
% Replays the game play in a GUI format 
% Board_matrix stors top left x,y point of square and state
% Occupancy Legend
% 0 - Empty
% 1 - pawn
% 2 - rook
% 3 - knight
% 4 - bishop
% 5 - queen
% 6 - king
% +ve - white
% -ve - black

clc ; clear all; close all ;
axis off ; set(gca,'Color','none')
%% Board setup
board = imread("board2.png") ;

[corner_pt, board_size] = detectCheckerboardPoints(board) ;
board_matrix = zeros(8,8,3) ;

% Corner points
y_pts = [corner_pt(1:7:49,2)];
y_pts = [y_pts;y_pts(end)+y_pts(2)-y_pts(1)] ;
x_pts = [corner_pt(1:7,1)] ; 
x_pts = [2*x_pts(1)-x_pts(2) ; x_pts] ;

square_size = [ceil(x_pts(2) - x_pts(1))]  ;
cols = 'a':'h' ;

for row = 1:8
    for col = 1:8
%         Square top left x-cordinate
        board_matrix(row,col,1) = x_pts(col) ;
%         Square top left y-cordinate
        board_matrix(row,col,2) = y_pts(row) ;            
    end
end

X = (reshape(board_matrix(:,:,1),1,64)) ;
Y = (reshape(board_matrix(:,:,2),1,64)) ;
% 
board_im = imshow(board); hold on
scatter(X,Y); hold on

%% Pieces
black_set = zeros(150,150,6) ;
white_set = zeros(150,150,6) ;

for piece = 1:6
    piece
    dir = "Images" ;
    black_filename = sprintf("-%d.png",piece) ;
    white_filename = sprintf("%d.png",piece)  ;
    
    white_piece = im2gray(imread(fullfile(dir,white_filename))) ;
    black_piece = im2gray(imread(fullfile(dir,black_filename))) ;
    
    white_piece = imresize(white_piece,[square_size,square_size]) ;
    black_piece = imresize(black_piece,[square_size,square_size]) ;
    
    black_set(:,:,piece) = black_piece ;
    white_set(:,:,piece) = white_piece ;
end

queen_pos_x = [board_matrix(1,5,1),board_matrix(1,6,1)] ;
queen_pos_y = [board_matrix(1,5,2),board_matrix(1,6,2)] ;

imshow(queen,'XData',queen_pos_x,'YData',queen_pos_y) ;

%% white pieces
