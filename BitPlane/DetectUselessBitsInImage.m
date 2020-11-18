function [output] = DetectUselessBitsInImage(I)
Img=imread(I);
Img=rgb2gray(Img);
IId=double(Img);
p0=mod(IId,2);
p1=mod(floor(IId/2),2);
p2=mod(floor(IId/4),2);
p3=mod(floor(IId/8),2);
p4=mod(floor(IId/16),2);
p5=mod(floor(IId/32),2);
p6=mod(floor(IId/64),2);
p7=mod(floor(IId/128),2);
bits_plane{1} = p0;
bits_plane{2} = p1;
bits_plane{3} = p2;
bits_plane{4} = p3;
bits_plane{5} = p4;
bits_plane{6} = p5;
bits_plane{7} = p6;
bits_plane{8} = p7;
it = uint16(1);
[m, n] = size(p0);
  for k = 1:8
    cnt = double(0);
    for i = 1:m
        for j = 1:n
            if bits_plane{k}(i, j) == 1
               cnt = cnt + 1;
            end
        end
    end
    if cnt / (m * n) < 0.1
       output(it) = k;
	   it = it + 1;
    end
  end
end