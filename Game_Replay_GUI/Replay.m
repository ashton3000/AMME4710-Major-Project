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

%% Global variables

global board tile_size board_matrix x_pts y_pts
global X Y square_size
% global white_set black_set

%% Board setup
board = imread("Board.jpg") ;

[corner_pt, board_size] = detectCheckerboardPoints(board) ;
board_matrix = zeros(8,8) ;
x_pts = zeros(1,8) ;
y_pts = zeros(1,8) ;

cols = 'a':'h' ;

% Top left corner points
pts_7grid = reshape(corner_pt,[7,7,2]);

x_pts(2:end) = [pts_7grid(1,:,1)] ; 
x_pts(1) = [2*x_pts(2)-x_pts(3)] ;

y_pts(2:end) = [pts_7grid(:,1,2)];
y_pts(1) = [2*y_pts(2)-y_pts(3)] ;

y_pts = flip(y_pts) ;

tile_size = ceil(x_pts(2) - x_pts(1)) ;

board_im = imshow(board); hold on
scatter(x_pts,y_pts); hold on

%% Pieces

% Scalling to fit pieces with margins on all side
scale = 0.85;
square_size = ceil(scale*tile_size)  ;

X = x_pts + (0.5*(tile_size-square_size)) ;
Y = y_pts + (0.5*(tile_size-square_size)) ;

% Reading images and resizing as per scale and creating sets
for piece = 1:6
    dir = "Pieces" ;
    black_filename = sprintf("-%d.png",piece) ;
    white_filename = sprintf("%d.png",piece)  ;
    
    white_piece = im2gray(imread(fullfile(dir,white_filename))) ;
    black_piece = im2gray(imread(fullfile(dir,black_filename))) ;
    
    white_piece = imresize(white_piece,[square_size,square_size]) ;
    black_piece = imresize(black_piece,[square_size,square_size]) ;
    
    black_set(:,:,piece) = black_piece ;
    white_set(:,:,piece) = white_piece ;
end

% Assuming top edge is white (can be changed using flip)
board_matrix(1,:) = [ 2:6 4:-1:2] ;
board_matrix(2,:) = 1 ;

board_matrix(end,:) = [-2:-1:-6 -4:-2] ;
board_matrix(end-1,:) = -1 ;
    
%% Check square color

for row_b = 1:8
    for col_b = 1:8
        if board_matrix(row_b,col_b) ~= 0 
            [x_pos,y_pos,bg_color] = BoardCoordinates(row_b,col_b) ;
            disp(bg_color) ;
            disp(board_matrix(row_b,col_b));
        end
    end
end
            


% imshow((uint8(255) - white_set(:,:,4)),'XData',x_pos,'YData',y_pos) ;


function [x_pos,y_pos,bg_color] = BoardCoordinates(row,col)
% Returns x and y positions for piece image to be placed at
    global X Y square_size
    x_pos = [X(col),X(col) + square_size] ;
    y_pos = [Y(row),Y(row) + square_size] ;
    bg_color = CheckSquareColor(row,col) ;
end

function tile_color = CheckSquareColor(row,col)
%     Checks if square is black or white
    global board tile_size
    global x_pts y_pts
%     Crop the square in question
    tile = imcrop(board,[x_pts(col) y_pts(row) tile_size tile_size]) ;
%     Binarize cropped image
    tile = imbinarize(tile) ;
%     Find mode of matrix to identify square color
    [tile_color,~] = mode(mode(tile(:,:))) ;
end