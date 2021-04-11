function [differenceMatrix]=getDifferenceMatrix(PreprocessedImage,row,col)
tempImg=uint32(zeros(row,col));
for i=1:row
    for j=1:col
        q=uint32(0);
        if(i-1>=1 && j-1>=1)
            q=q+uint32(abs(PreprocessedImage(i-1,j-1)-PreprocessedImage(i,j)));
        end;
        if(i+1<=row && j-1>=1)
            q=q+uint32(abs(PreprocessedImage(i+1,j-1)-PreprocessedImage(i,j)));
        end;
        if(i-1>=1 && j+1<=col)
            q=q+uint32(abs(PreprocessedImage(i-1,j+1)-PreprocessedImage(i,j)));
        end;
        if(i+1<=row && j+1<=col)
            q=q+uint32(abs(PreprocessedImage(i+1,j+1)-PreprocessedImage(i,j)));
        end;
        if(i-1>=1)
            q=q+uint32(abs(PreprocessedImage(i-1,j)-PreprocessedImage(i,j)));
        end;
        if(j-1>=1)
            q=q+uint32(abs(PreprocessedImage(i,j-1)-PreprocessedImage(i,j)));
        end;
        if(i+1<=row)
            q=q+uint32(abs(PreprocessedImage(i+1,j)-PreprocessedImage(i,j)));
        end;
        if(j+1<=col)
            q=q+uint32(abs(PreprocessedImage(i,j+1)-PreprocessedImage(i,j)));
        end;
        tempImg(i,j)=q;
        
    end;
    
end;
differenceMatrix=tempImg;
end
