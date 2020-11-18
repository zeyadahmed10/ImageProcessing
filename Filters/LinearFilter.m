function [ output] = LinearFilter( path,Filter,PostProc )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%I=imread(path);
%Idouble=double(I);
newStr=split(Filter,'_');
I=imread(path);
%I=rgb2gray(I);
Idouble=double(I);
if strcmp(newStr(1),'Sobel')
    if strcmp(newStr(2),'H')
        output=Sobel(Idouble,'H');
    elseif strcmp(newStr(2),'V')
        output=Sobel(Idouble,'V');
    end
elseif strcmp(newStr(1),'Laplacian')
    output=Laplacian(Idouble);
elseif strcmp(newStr(1),'MeanMask')
    output=MeanMask(Idouble,newStr(2),newStr(3));
elseif strcmp(newStr(1),'Gaussian1')
    output=Gaussian1(Idouble,newStr(2),newStr(3));
elseif strcmp(newStr(1),'Gaussian2')
    output=Gaussian2(Idouble,newStr(2));
end
if strcmp(PostProc,'absolute')
   output=abs(output);
   for i=1:size(output,1)
       for j=1:size(output,2)
           if output(i,j)>255
               output(i,j)=255;
           end
       end
   end
elseif strcmp(PostProc,'cutoff')
    for i=1:size(output,1)
       for j=1:size(output,2)
           if output(i,j)>255
               output(i,j)=255;
           end
       end
    end
end
output=uint8(output);
end

