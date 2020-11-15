%% GUI 
% Author - Tanishq Jain

addpath('Game_Replay_GUI/Functions') ;
load Game_Replay_GUI/GUI_images.mat ;

global board_matrix img_matrix

board_matrix = zeros(8) ;
img_matrix = cell(8);

StartBoard(1) ;

MovePiece([9-2,2],[9-6,3],1);
%MovePiece([9,1],[9-8,2],1);