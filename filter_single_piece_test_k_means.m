clear;
clc;
K = 3;
load('im_matrix_webcam');
im = im_matrix(:,:,4:6);
imshow(im);
%im = rgb2lab(im);
[m,n,d] = size(im);
points = double(reshape(im, m*n, 3))/255;
for i = 1:n
    for j = 1:m
        points(m*(i-1)+j, 4) = j;
        points(m*(i-1)+j, 5) = i;
    end
end
points(:, 4) = (points(:,4)/640)*2;
points(:, 5) = (points(:,5)/428)*2;
%points = double(reshape(im,size(im,1)*size(im,2),3))/255;
[cluster_idx, cluster_center] = kmeans(points, K);

figure;
pixel_labels = reshape(cluster_idx, size(im,1), size(im,2));
imagesc(pixel_labels);


c = zeros(n*m,3);
for i = 1:length(cluster_idx)
c(i,:) = hsv2rgb([cluster_idx(i)/K,1,1]);
end

figure;
[m,n,d] = size(im);
scatter3(points(:,1),points(:,2),points(:,3),ones(n*m,1),c);


