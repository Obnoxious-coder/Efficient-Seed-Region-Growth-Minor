function [centroids]=getSeedPoints(differenceMatrix,PreprocessedImage,gtr,row,col)
sumall=sum(differenceMatrix,"all");
N = nnz(differenceMatrix);
threshold=sumall/N;
invNoiseless=255-PreprocessedImage;
invNoiseless=adapthisteq(invNoiseless);
subplot(2,5,6);imshow(invNoiseless)
binar=invNoiseless<threshold;
subplot(2,5,7);imshow(binar)
%result=ESR(binar,518,191);
%subplot(2,5,10);imshow(binar)
SE1=strel("disk",4,4);
SE2=strel("disk",2,0);
SE3=strel("rectangle",[3,4])

binarDilated=imdilate(binar,SE2);
binarbw2=bwareafilt(binarDilated,1);
gtrDilated=imdilate(gtr,SE3);
B1=bwpropfilt(binarbw2,'FilledArea',1,'largest' );
B2=bwpropfilt(binarbw2,'FilledArea',1,'smallest' );
s = regionprops(binarbw2,'centroid');
subplot(2,5,8);imshow(binar&gtr)
%groundTruth=getGroundTruthImg(492,473,131)
%figure;montage({invNoiseless,binar,binar&gtr},'Size',[1,3]);
%figure;montage({invNoiseless,binar,binarbw2,groundTruth},'Size',[1,4]);
centroids = cat(1,s.Centroid);
end