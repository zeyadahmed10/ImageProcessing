function [ output] = Gaussian2(unFilteredImage,Sig )
%UNTITLED10 Summary of this function goes here
%   Detailed explanation goes here

Sig=str2double(Sig);
Size=3.7*Sig-0.5;
Size=(2*Size)-1;
it=(Size-1)/2;
doubleSigSquare = 2*Sig*Sig;
Mask=zeros(Size);
B=padarray(unFilteredImage,[it,it]);
msum = 0;
maskCenter=(Size-1)/2;
maskCenter=maskCenter+1;
for i=1:Size
    for j=1:Size
        %x = floor((Size-3) / 2);
        %y = floor((Size-3) / 2);
        %Mask(i, j) = (1/(doubleSigSquare*pi)) * exp(-(x*x + y*y) / doubleSigSquare);
        sq_dist=(i-maskCenter)^2+(j-maskCenter)^2;
        Mask(i,j)=(1/(doubleSigSquare*pi))*exp(-1*(sq_dist)/(doubleSigSquare));
        msum = msum + Mask(i, j);
    end
end
Mask = Mask/msum;
for i=1+it :size(unFilteredImage,1)
    for j=1+it:size(unFilteredImage,2)
        output(i-it,j-it)=(sum(sum(Mask.*B(i-it:i+it,j-it:j+it))));
    end
end
end

