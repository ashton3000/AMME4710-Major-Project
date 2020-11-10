clear;
clc;

%im = rgb2gray(imread('boardpieces.jpeg'));


cam = webcam;
cam.Resolution = '1280x1024';
im = snapshot(cam);



%side_length = 276;

%load('centre_points_board_pieces_rot_90');


% im = imread('boardpieces.jpeg');
% 
% im = imrotate(im, 270);



[side_length, centrepoints] = getInitialData(im);


% im = imgaussfilt(im, 4);
% 
% se  = strel('disk',10,0);
% im = imclose(im, se);
%imshow(im);

location_matrix = setupLocationMatrix(side_length, centrepoints, im);

full_game_matrix = initGameMatrix();

game_finished = 0;

% while(game_finished == 0)
%         
%     
%     
%     
%     
% end




% for i = 1:6
%     
%     centre_point = centrepoints(i,:);
%     colour(i) = checkSquare(centre_point, side_length, im);
%     
% end

imshow(im);

% for i = 1:8
%     for j = 1:8
%         hold on;
%         scatter(location_matrix(i,j,1), location_matrix(i,j,2));
%         pause(0.5);
%     end
% end

for i = 1:36
    
        hold on;
        scatter(centrepoints(i,1), centrepoints(i,2));
        pause(0.5);

end

