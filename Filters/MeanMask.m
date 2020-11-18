function [ output] = MeanMask( unFilteredImage,W,H )
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
W=str2double(W);
H=str2double(H);
mask=ones(H,W);
vsum=W*H;
it1=(H-1)/2;
it2=(W-1)/2;
B=padarray(unFilteredImage,[it1,it2]);
output=zeros(size(unFilteredImage));
mask=(1/vsum)*mask;
for i=1+it1 :size(unFilteredImage,1)
    for j=1+it2:size(unFilteredImage,2)
        output(i-it1,j-it2)=sum(sum(mask.*B(i-it1:i+it1,j-it2:j+it2)));
    end
end
end

