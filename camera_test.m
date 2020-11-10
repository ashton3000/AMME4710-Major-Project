clear;
clc;

cam = webcam;

im = snapshot(cam);

[side_length, centrepoints] = getInitialData(im);

imshow(im);
hold on;

for i = 1:36
    
        hold on;
        scatter(centrepoints(i,1), centrepoints(i,2));
        pause(0.5);

end