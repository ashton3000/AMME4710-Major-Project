clear; 
clc;

cam = webcam;
cam.Resolution = '1280x1024';
cam.Sharpness = 1;
cam.Brightness = 60;
cam.Contrast = 5;

im = snapshot(cam);

[side_length, centrepoints] = getInitialData(im);

for i = 1:36
    colour(i) = checkSquare2(centrepoints(i,:), side_length, im);
    
    
end

imshow(im);
hold on;
for i = 1:36
    
        hold on;
        scatter(centrepoints(i,1), centrepoints(i,2));
        pause(0.5);

end