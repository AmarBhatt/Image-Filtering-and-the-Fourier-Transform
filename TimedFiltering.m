function [ Yb,Yc,bt,ct ] = TimedFiltering( I,H )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here

image = im2uint8(I);
fimage = im2double(I)*255;

%filter using built in function
tic;
Yb = filter2(H,image);
bt = toc;

%filter using my function
tic;
dim = size(I);
origin = [3,3];

%pad image with repitition
pad = zeros(size(fimage)+4);

sp = size(pad);
pad(3:sp(1)-2,3:sp(2)-2) = pad(3:sp(1)-2,3:sp(2)-2)+ fimage;

for r =  1:dim(1)
    for c = 1:dim(2)
        fimage(r,c) = sum(sum(pad(r:r+4,c:c+4).*H));
    end
end
ct = toc;
Yc = fimage;


end

