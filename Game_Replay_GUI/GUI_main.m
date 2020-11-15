%% GUI 
% Author - Tanishq Jain

addpath('Game_Replay_GUI/Functions') ;
load Game_Replay_GUI/GUI_images.mat ;

global board_matrix img_matrix

board_matrix = zeros(8) ;
img_matrix = cell(8);

StartBoard(0) ;

MovePiece([2,1],[4,1],1);