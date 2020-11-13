clc


%% Activity 1
global chess_img
chess_img = imread('chess.png') ;
chess_img_info = imfinfo('chess.png');

pixels_per_col = chess_img_info.Width / 8 ;
pixels_per_row = chess_img_info.Height / 8 ;

row = input("Enter row number \n") ;
col = input("\nEnter col number\n") ; 
BoardPosition(row,col);

%% Function declaration
% Activity 1
function BoardPosition(row,col)
global chess_img 
image = chess_img(1+row*(90):(row+1)*90,1+col*(90):(col+1)*90);
figure()
imshow(image);
% Binarized and check for 0 to 1

empty = 0 ;
white = 0 ;
black = 0 ;

for i =1:length(image)
    for j = 1:length(image)
        if image(i,j) == 255
            white = white + 1 ;
        elseif image(i,j) == 0
            black = black + 1 ;
        elseif image(i,j) == 181
            empty = empty + 1 ;
        end
    end
end

if empty > white && empty > black
    disp('Empty Square') ;
elseif white > empty && white > black 
    disp('White piece') ;
elseif black > white && black > empty
    disp('Black piece') ;
end
end

