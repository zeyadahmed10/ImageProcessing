close all;
clear all;
clc;
I=imread('Case2/2.3.jpg');
figure, imshow(I);
I=imresize(I,[400,600]);
filt = imgaussfilt3(I, 2);
%p=impixel(filt);
[H,W,CH]=size(I);
mask=zeros(400,600);
figure,imshow(I);


for i=1:H
    for j=1:W
        if 30>=filt(i,j,1)-filt(i,j,2)&&filt(i,j,1)-filt(i,j,2)>10
            mask(i,j)=1;
        end
        if 20>=filt(i,j,1)-filt(i,j,2)&&filt(i,j,1)-filt(i,j,2)>5
            mask(i,j)=1;
        end
    end
end
% for i=1:H-10 
%     for j=1:W-10
%         if mask(i,j)==1
%             mask(i+10,j+10)=1;
%         end
%     end
% end
bigJ=zeros(size(filt));
filt=im2double(filt);
I=im2double(I);
figure,imshow(mask);
% se=strel('square',50);
% mask=imclose(mask,se);
% se2=strel('square',3);
% mask=imerode(mask,se2);
% figure,imshow(mask);
% for i=1:H
%     for j=1:W
%         if mask(i,j)==1
%             if i+10>400 || j+10>600
%                 continue;
%             else
%                 mask(i+10,j+10)=1;
%             end
%         end
%     end
% end
final=I.*mask;
mask2=imfill(mask,'holes');
final2=I.*mask2;
figure,imshow(final2);
% for i=1:360
%     for j=1:560
%         if final(i,j,:)==0 
%             if final(i+10,j+10,:)~=0
%                 final(i,j,:)=I(i,j,:);
%             end
%         end
%     end
% end
figure,imshow(final);
% it1=1;
% it2=1;
% idx=[]
% while it1<400
%     while it2<600
%         if mask(it1,it2)==1
%             idx=[idx it1 it2];
%             if it1+40>400
%                 it1=400;
%             elseif it2+60>600
%                     it2=600;
%             else
%                 it1=it1+40;
%                 it2=it2+60;
%             end
%         end
%         it2=it2+1;
%     end
%     it2=1;
%     it1=it1+1;
% end
% index=1;
% while index<=7
%     J=regiongrowing(I,idx(index),idx(index+1));
%     bigJ=bigJ+J;
%     index=index+2;
% end
% figure,imshow(I+bigJ);