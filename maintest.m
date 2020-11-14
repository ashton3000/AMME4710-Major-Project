clear;
clc;

%im = rgb2gray(imread('boardpieces.jpeg'));


cam = webcam;
cam.Resolution = '1280x1024';
cam.Sharpness = 1;
cam.Brightness = 60;
cam.Contrast = 5;

im = snapshot(cam);

%im = imread('iphone_pic_fullboard.jpg');

%side_length = 276;

%load('centre_points_board_pieces_rot_90');


% im = imread('boardpieces.jpeg');
% 
% im = imrotate(im, 270);


%im  = imread('boardpieces.jpeg');
[side_length, centrepoints] = getInitialData(im);

% 
% im = imgaussfilt(im, 4);
% 
% se  = strel('disk',10,0);
% im = imclose(im, se);

%im = rgb2gray(getCropped(centrepoints(35,:), side_length, im));

location_matrix = setupLocationMatrix(side_length, centrepoints, im);

full_game_matrix = initGameMatrix();

index = 1;

game_finished = 0;
move_number = 1;
im = snapshot(cam);
prev_im = rgb2gray(im);
while game_finished == 0
        [game_finished, full_game_matrix, new_im, move_number] = checkMove2(full_game_matrix, location_matrix, cam, move_number, side_length, prev_im);
        
        for i = 1:5
            pause(1);
            disp(6-i);
        end
        
        prev_im = new_im;
        
    
    
end




% for i = 1:8
%     for j = 1:8
% %         if full_game_matrix(i,j,1) > 0
% %                 empty(index) = checkEmpty([location_matrix(i,j,1),location_matrix(i,j,2)], side_length, im);
% %                 index = index + 1;
% %         end
%         %empty(i,j) = checkEmpty([location_matrix(i,j,1),location_matrix(i,j,2)], side_length, im);
%         %index = index + 1;
%     end
% end
% 

% game_finished = 0;
% move_number = 1;
% while game_finished == 0
%         [game_finished, full_game_matrix] = checkMove(full_game_matrix, location_matrix, cam, move_number, side_length);
%         
%         for i = 1:5
%             pause(1);
%             disp(6-i);
%         end
%          
%     
%     
%     
% end





% imshow(im);
% 
% for i = 1:8
%     for j = 1:8
%         hold on;
%         scatter(location_matrix(i,j,1), location_matrix(i,j,2));
%         pause(0.5);
%     end
% end

% for i = 1:36
%     
%         hold on;
%         scatter(centrepoints(i,1), centrepoints(i,2));
%         pause(0.5);
% 
% end
% 
% for i = 1:8
%     for j = 1:8
%         test(i,j) = checkSquare2([location_matrix(i,j,1), location_matrix(i,j,2)], side_length, im);
%     end
% end

