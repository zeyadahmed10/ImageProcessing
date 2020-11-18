function [output] = EdgeMagnit(path)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
I=imread(path);
Idouble=double(I);

first=Sobel(Idouble,'H');
second=Sobel(Idouble,'V');
output=zeros(size(first));
for i=1 :size(second,1)
    for j=1:size(second,2)
        output(i,j)=sqrt(first(i,j).^2+second(i,j).^2);
    end
end
output=uint8(output);
end

