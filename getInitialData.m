% Author: Ashan Abey
% Date: 10/9/2020
% Tutorial 3 Activity 4
function [side_length, centrepoints] = getInitialData(im)
    im = rgb2gray(im);

    %im = imgaussfilt(im, 2);

%     se  = strel('disk',10,0);
%     im = imclose(im, se);
    




    [points1, boardSize] = detectCheckerboardPoints(im, 'MinCornerMetric', 0.3);
%     metric = 0.05;
% while boardSize(1) ~= 8
%     [points1, boardSize] = detectCheckerboardPoints(im, 'MinCornerMetric', metric);
%     metric = metric + 0.05;
% end

   
    [bottomleftx, index] = min(points1(:,1));
    bottomlefty = points1(index, 2);
   


    for i = 1:6
        centrepoints(i,1) = mean([points1(i, 1), points1(i+1,1), points1(i+7, 1), points1(i+8, 1)]);
        centrepoints(i,2) = mean([points1(i, 2), points1(i+1, 2), points1(i+7, 2), points1(i+8, 2)]);

        centrepoints(i + 6,1) = mean([points1(i+14, 1), points1(i+15,1), points1(i+7, 1), points1(i+8, 1)]);
        centrepoints(i + 6,2) = mean([points1(i+14, 2), points1(i+15, 2), points1(i+7, 2), points1(i+8, 2)]);

        centrepoints(i + 12,1) = mean([points1(i+14, 1), points1(i+15,1), points1(i+21, 1), points1(i+22, 1)]);
        centrepoints(i + 12,2) = mean([points1(i+14, 2), points1(i+15, 2), points1(i+21, 2), points1(i+22, 2)]);

        centrepoints(i + 18,1) = mean([points1(i+28, 1), points1(i+29,1), points1(i+21, 1), points1(i+22, 1)]);
        centrepoints(i + 18,2) = mean([points1(i+28, 2), points1(i+29, 2), points1(i+21, 2), points1(i+22, 2)]);

        centrepoints(i + 24,1) = mean([points1(i+28, 1), points1(i+29,1), points1(i+35, 1), points1(i+36, 1)]);
        centrepoints(i + 24,2) = mean([points1(i+28, 2), points1(i+29, 2), points1(i+35, 2), points1(i+36, 2)]);

        centrepoints(i + 30,1) = mean([points1(i+42, 1), points1(i+43,1), points1(i+35, 1), points1(i+36, 1)]);
        centrepoints(i + 30,2) = mean([points1(i+42, 2), points1(i+43, 2), points1(i+35, 2), points1(i+36, 2)]);
    end

    
    D1 = pdist(centrepoints(1:2, :));
    D2 = pdist([centrepoints(1,:); centrepoints(7, :)]);
    side_length = (D1+D2)/2;
    
end
