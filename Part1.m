%% 1. Filtering in the Space Domain
% Image Filtering using MatLab commands
close all; clear all;
sigma = 5.0;
N = 5;

figure;
I = imread('IMAGES/cameraman.tif');
image = im2uint8(I);
subplot(2,1,1);
imshow(image,'InitialMagnification','fit');
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
%truesize
H = fspecial('gaussian',N,sigma);
Y = filter2(H,image);
Y = mat2gray(Y);
%Y = im2uint8(Y);
subplot(2,1,2);
imshow(Y,'InitialMagnification','fit');
title( sprintf('Gaussian Filtered Image (1 time)'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
%truesize
print('RESULTS/part1a-image1','-dpng');
figure;
freqz2(H,[10 10]);
title( sprintf('Low Pass Frequency Response'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print('RESULTS/part1a-freqresp','-dpng');

for x = 2:5
     H = fspecial('gaussian',N,sigma);
     Y = filter2(H,Y);
end
figure;
I = imread('IMAGES/cameraman.tif');
image = im2uint8(I);
subplot(2,1,1);
imshow(image,'InitialMagnification','fit');
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
%truesize

subplot(2,1,2);
imshow(Y,'InitialMagnification','fit');
title( sprintf('Gaussian Filtered Image (5 times)'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
%truesize
print('RESULTS/part1a-image5','-dpng');

 
for x = 5:10
    H = fspecial('gaussian',N,sigma);
    Y = filter2(H,Y);
end
figure;
I = imread('IMAGES/cameraman.tif');
image = im2uint8(I);
subplot(2,1,1);
imshow(image,'InitialMagnification','fit');
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
%truesize

subplot(2,1,2);
imshow(Y,'InitialMagnification','fit');
title( sprintf('Gaussian Filtered Image (10 times)'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
%truesize
print('RESULTS/part1a-image10','-dpng');

for x = 10:20
    H = fspecial('gaussian',N,sigma);
    Y = filter2(H,Y);
end
figure;
I = imread('IMAGES/cameraman.tif');
image = im2uint8(I);
subplot(2,1,1);
imshow(image,'InitialMagnification','fit');
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
%truesize

subplot(2,1,2);
imshow(Y,'InitialMagnification','fit');
title( sprintf('Gaussian Filtered Image (20 times)'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
%truesize
print('RESULTS/part1a-image20','-dpng');


for x = 20:100
    H = fspecial('gaussian',N,sigma);
    Y = filter2(H,Y);
end
figure;
I = imread('IMAGES/cameraman.tif');
image = im2uint8(I);
subplot(2,1,1);
imshow(image,'InitialMagnification','fit');
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
%truesize

subplot(2,1,2);
imshow(Y,'InitialMagnification','fit');
title( sprintf('Gaussian Filtered Image (100 times)'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
%truesize
print('RESULTS/part1a-image100','-dpng');

%% Image Filtering by Writing your own Code (High Pass)
close all; clear all;
N = 5;
sigma = 5.0;
I = imread('IMAGES/cameraman.tif');
image = im2uint8(I);
fimage = im2double(I)*255;

H = fspecial('gaussian',N,sigma);
Hn = fspecial('gaussian',N,sigma/20);
HP = H-Hn;

%Flip filter for convolution
HP = flipud(HP);
HP = fliplr(HP);

figure;
freqz2(HP,[10 10]);

figure;
subplot(2,1,1);
imshow(image,'InitialMagnification','fit');
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);

%HP(find(HP<0)) = 0;

dim = size(I);
origin = [3,3];

%pad image with repitition
pad = zeros(size(fimage)+4);
%pad = im2uint8(pad);
sp = size(pad);
pad(3:sp(1)-2,3:sp(2)-2) = pad(3:sp(1)-2,3:sp(2)-2)+ fimage;


for r =  1:dim(1)
    for c = 1:dim(2)
        fimage(r,c) = sum(sum(pad(r:r+4,c:c+4).*HP));
    end
end
%fimage = im2uint8(fimage);
fimage = mat2gray(fimage);
subplot(2,1,2);
imshow(fimage,'InitialMagnification','fit');
title( sprintf('High Pass Filtered Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print('RESULTS/part1b-image','-dpng');
    
%% Timing Results

close all; clear all;
N = 5;
sigma = 5.0;
I = imread('IMAGES/cameraman.tif');
H = fspecial('gaussian',N,sigma);
resize = [1,0.5,2];

for i = 1:length(resize)
    Ir = imresize(I,resize(i));
    dim = size(Ir);
    [Yb,Yc,bt,ct] = TimedFiltering(Ir,H);
    figure;
    subplot(2,1,1);
    %show image for testing
    Yb = mat2gray(Yb);
    imshow(Yb,'InitialMagnification','fit');
    title( sprintf('Built-in Filtering Function (%dx%d),%f seconds',dim(1),dim(2),bt), 'fontsize',18);
        set(gca, 'fontsize', 18, 'linewidth', 2);
    subplot(2,1,2);
    %show image for testing
    Yc = mat2gray(Yc);
    imshow(Yc,'InitialMagnification','fit');
    title( sprintf('Custom Filtering Function (%dx%d), %f seconds',dim(1),dim(2),ct), 'fontsize',18);
        set(gca, 'fontsize', 18, 'linewidth', 2);
    print(sprintf('RESULTS/part1c-image%d',dim(1)),'-dpng');
end