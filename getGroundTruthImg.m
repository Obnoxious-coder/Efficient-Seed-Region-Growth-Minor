function [groundTruth]=getGroundTruthImg(centx,centy,r)
circleCenterX = centx; 
circleCenterY =  1024-centy;  
circleRadius = r;    

% Initialize an image to a logical image of the circle. 
circleImage = false(1024, 1024); 
[x, y] = meshgrid(1:1024, 1:1024); 
circleImage((x - circleCenterX).^2 + (y - circleCenterY).^2 <= circleRadius.^2) = true; 
groundTruth=circleImage;
subplot(2,5,9);imshow(circleImage)
end