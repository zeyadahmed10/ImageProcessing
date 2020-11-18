function [ output ] = Laplacian(unFilteredImage)
%UNTITLED7 Summary of this function goes here
%   Detailed explanation goes here

B=padarray(unFilteredImage,[1 1]);
mask = [0 -1 0; -1 5 -1; 0 -1 0]; 
output=zeros(size(unFilteredImage));

for i=2 :size(unFilteredImage,1)
    for j=2:size(unFilteredImage,2)
        output(i-1,j-1)=sum(sum(mask.*B(i-1:i+1,j-1:j+1)));
    end
end
end

