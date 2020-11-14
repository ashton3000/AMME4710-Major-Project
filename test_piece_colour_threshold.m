clear;
clc;

load('im_matrix_webcam_adjusted');

for i = 1:64
    im = im_matrix(:,:,3*(i-1)+1:3*(i-1)+3);
    figure;
    subplot(1,3,1);
    imshow(im);
    [BW, maskedRGBImage] = createMaskWhitePiece(im);
    subplot(1,3,2);
    imshow(BW);
    
    se  = strel('disk',8,0);
    im = imopen(BW, se);
    subplot(1,3,3);
    imshow(im);
%     
%     subplot(1,4,4);
%     imshow(maskedRGBImage);
    
    
end

% for i = 1:64
%     im = im_matrix(:,:,3*(i-1)+1:3*(i-1)+3);
%     figure;
%     subplot(1,3,1);
%     imshow(im);
%     [BW, maskedRGBImage] = createMaskBlackPiece(im);
%     subplot(1,3,2);
%     imshow(BW);
%     
%     se  = strel('disk',8,0);
%     im = imopen(BW, se);
%     subplot(1,3,3);
%     imshow(im);
% %     
% %     subplot(1,4,4);
% %     imshow(maskedRGBImage);
%     
%     
% end
