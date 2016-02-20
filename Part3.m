%% 3. Sobel Edge Detection
% A. Custom Edge Detection

I = imread('IMAGES/livingroom.tif');
image = im2double(I);

%add salt&pepper noise
simage = imnoise(image,'salt & pepper');
%add gaussian noise
gimage = imnoise(image,'gaussian',0,0.01);


%sobel filters
sx = [-1 0 1;-2 0 2; -1 0 1];
sy = [1 2 1;0 0 0; -1 -2 -1];

fimageH = filter2(sx,image);
fimageV = filter2(sy,image);
fimage = abs(fimageH) + abs(fimageV);
fsimageH = filter2(sx,simage);
fsimageV = filter2(sy,simage);
fsimage = abs(fsimageH) + abs(fsimageV);
fgimageH = filter2(sx,gimage);
fgimageV = filter2(sy,gimage);
fgimage = abs(fgimageH) + abs(fgimageV);

figure;
subplot(2,2,1);
imshow(image,'InitialMagnification','fit');
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,2);
imshow(fimage,'InitialMagnification','fit');
title( sprintf('Original Image with Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,3);
imshow(abs(fimageH),'InitialMagnification','fit');
title( sprintf('Original Image with Horizontal Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,4);
imshow(abs(fimageV),'InitialMagnification','fit');
title( sprintf('Original Image with Vertical Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part3a-image1'),'-dpng');

figure;
subplot(2,2,1);
imshow(simage,'InitialMagnification','fit');
title( sprintf('Salt & Pepper Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,2);
imshow(fsimage,'InitialMagnification','fit');
title( sprintf('Salt & Pepper Image with Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,3);
imshow(abs(fsimageH),'InitialMagnification','fit');
title( sprintf('Salt & Pepper Image with Horizontal Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,4);
imshow(abs(fsimageV),'InitialMagnification','fit');
title( sprintf('Salt & Pepper Image with Vertical Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part3a-image2'),'-dpng');

figure;
subplot(2,2,1);
imshow(gimage,'InitialMagnification','fit');
title( sprintf('Gaussian Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,2);
imshow(fgimage,'InitialMagnification','fit');
title( sprintf('Gaussian Image with Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,3);
imshow(abs(fgimageH),'InitialMagnification','fit');
title( sprintf('Gaussian Image with Horizontal Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,4);
imshow(abs(fgimageV),'InitialMagnification','fit');
title( sprintf('Gaussian Image with Vertical Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part3a-image3'),'-dpng');

%% B. Built-in Edge Detection
I = imread('IMAGES/livingroom.tif');
image = im2double(I);

%add salt&pepper noise
simage = imnoise(image,'salt & pepper');
%add gaussian noise
gimage = imnoise(image,'gaussian',0,0.01);

fimage = edge(image,'sobel');
fimageH = edge(image,'sobel',[],'horizontal');
fimageV = edge(image,'sobel',[],'vertical');

fsimage = edge(simage,'sobel');
fsimageH = edge(simage,'sobel',[],'horizontal');
fsimageV = edge(simage,'sobel',[],'vertical');

fgimage = edge(gimage,'sobel');
fgimageH = edge(gimage,'sobel',[],'horizontal');
fgimageV = edge(gimage,'sobel',[],'vertical');

figure;
subplot(2,2,1);
imshow(image,'InitialMagnification','fit');
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,2);
imshow(fimage,'InitialMagnification','fit');
title( sprintf('Original Image with Built-in Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,3);
imshow(abs(fimageH),'InitialMagnification','fit');
title( sprintf('Original Image with Built-in Horizontal Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,4);
imshow(abs(fimageV),'InitialMagnification','fit');
title( sprintf('Original Image with Built-in Vertical Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part3b-image1'),'-dpng');

figure;
subplot(2,2,1);
imshow(simage,'InitialMagnification','fit');
title( sprintf('Salt & Pepper Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,2);
imshow(fsimage,'InitialMagnification','fit');
title( sprintf('Salt & Pepper Image with Built-in Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,3);
imshow(abs(fsimageH),'InitialMagnification','fit');
title( sprintf('Salt & Pepper Image with Built-in Horizontal Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,4);
imshow(abs(fsimageV),'InitialMagnification','fit');
title( sprintf('Salt & Pepper Image with Built-in Vertical Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part3b-image2'),'-dpng');

figure;
subplot(2,2,1);
imshow(gimage,'InitialMagnification','fit');
title( sprintf('Gaussian Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,2);
imshow(fgimage,'InitialMagnification','fit');
title( sprintf('Gaussian Image with Built-in Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,3);
imshow(abs(fgimageH),'InitialMagnification','fit');
title( sprintf('Gaussian Image with Built-in Horizontal Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,4);
imshow(abs(fgimageV),'InitialMagnification','fit');
title( sprintf('Gaussian Image with Built-in Vertical Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part3b-image3'),'-dpng');

%% Reduce effects of noise
N = 5;
sigma = 0.5;
I = imread('IMAGES/livingroom.tif');
image = im2double(I);

%add salt&pepper noise
simage = imnoise(image,'salt & pepper');
%add gaussian noise
gimage = imnoise(image,'gaussian',0,0.01);

HLP = fspecial('gaussian',N,sigma);
filtsimage = filter2(HLP,simage);
filtsimage = medfilt2(filtsimage,[5,5]);
filtgimage = filter2(HLP,gimage);
filtgimage = medfilt2(filtgimage,[5,5]);


%sobel filters
sx = [-1 0 1;-2 0 2; -1 0 1];
sy = [1 2 1;0 0 0; -1 -2 -1];

fimageH = filter2(sx,image);
fimageV = filter2(sy,image);
fimage = abs(fimageH) + abs(fimageV);
fsimageH = filter2(sx,filtsimage);
fsimageV = filter2(sy,filtsimage);
fsimage = abs(fsimageH) + abs(fsimageV);
fgimageH = filter2(sx,filtgimage);
fgimageV = filter2(sy,filtgimage);
fgimage = abs(fgimageH) + abs(fgimageV);

figure;
subplot(2,2,1);
imshow(image,'InitialMagnification','fit');
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,2);
imshow(fimage,'InitialMagnification','fit');
title( sprintf('Original Image with Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,3);
imshow(abs(fimageH),'InitialMagnification','fit');
title( sprintf('Original Image with Horizontal Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,4);
imshow(abs(fimageV),'InitialMagnification','fit');
title( sprintf('Original Image with Vertical Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part3d-image1'),'-dpng');

figure;
subplot(2,2,1);
imshow(filtsimage,'InitialMagnification','fit');
title( sprintf('Filtered Salt & Pepper Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,2);
imshow(fsimage,'InitialMagnification','fit');
title( sprintf('Filtered Salt & Pepper Image with Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,3);
imshow(abs(fsimageH),'InitialMagnification','fit');
title( sprintf('Filtered Salt & Pepper Image with Horizontal Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,4);
imshow(abs(fsimageV),'InitialMagnification','fit');
title( sprintf('Filtered Salt & Pepper Image with Vertical Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part3d-image2'),'-dpng');

figure;
subplot(2,2,1);
imshow(filtgimage,'InitialMagnification','fit');
title( sprintf('Filtered Gaussian Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,2);
imshow(fgimage,'InitialMagnification','fit');
title( sprintf('Filtered Gaussian Image with Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,3);
imshow(abs(fgimageH),'InitialMagnification','fit');
title( sprintf('Filtered Gaussian Image with Horizontal Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,4);
imshow(abs(fgimageV),'InitialMagnification','fit');
title( sprintf('Filtered Gaussian Image with Vertical Edge Detection'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part3d-image3'),'-dpng');