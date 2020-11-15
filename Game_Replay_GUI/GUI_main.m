%% GUI 
% Author - Tanishq Jain

addpath('Game_Replay_GUI/Functions') ;
load Game_Replay_GUI/GUI_images.mat ;

global board_matrix img_matrix

board_matrix = zeros(8) ;
img_matrix = cell(8);

StartBoard(0) ;

MovePiece([2,1],[7,1],1);
MovePiece([7,1],[8,2],1);