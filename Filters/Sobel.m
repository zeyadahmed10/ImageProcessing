function [output] = Sobel(unFilteredImage,oneChar)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
B=padarray(unFilteredImage,[1 1]);
My = [-1 0 1; -2 0 2; -1 0 1]; 
Mx = [-1 -2 -1; 0 0 0; 1 2 1];
output=zeros(size(unFilteredImage));
if oneChar=='H'
    for i=2 :size(unFilteredImage,1)
        for j=2:size(unFilteredImage,2)
            output(i-1,j-1)=sum(sum(Mx.*B(i-1:i+1,j-1:j+1)));
        end
    end 
elseif oneChar=='V'
    for i=2 :size(unFilteredImage,1)
        for j=2:size(unFilteredImage,2)
            output(i-1,j-1)=sum(sum(My.*B(i-1:i+1,j-1:j+1)));
        end
    end 
end
end

