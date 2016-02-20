%% 2. Filtering a Noisy Image
% Part A
I = imread('IMAGES/livingroom.tif');
image = im2double(I);

%add salt&pepper noise
simage = imnoise(image,'salt & pepper');
%add gaussian noise
gimage = imnoise(image,'gaussian',0,0.01);

ssig = mean(simage(:));
snoise = std(simage(:));
srat = 10*log10(ssig/snoise);

gsig = mean(gimage(:));
gnoise = std(gimage(:));
grat = 10*log10(gsig/gnoise);

rattest = 10*log10(mean(image(:))/std(image(:)));

figure;
subplot(3,1,1);
imshow(image,'InitialMagnification','fit');
title( sprintf('Original Image, SNR = %f',rattest), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(3,1,2);
imshow(simage,'InitialMagnification','fit');
title( sprintf('Salt & Pepper Noisy Image, SNR = %f',srat), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(3,1,3);
imshow(gimage,'InitialMagnification','fit');
title( sprintf('Gaussian Noisy Image, SNR = %f',grat), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part2a-image'),'-dpng');

%% Part B
N = 5;
sigma = 0.5;

HLP = fspecial('gaussian',N,sigma);
fsimage = filter2(HLP,simage);
fsimage = medfilt2(fsimage,[5,5]);
fgimage = filter2(HLP,gimage);
fgimage = medfilt2(fgimage,[5,5]);
ssig = mean(fsimage(:));
snoise = std(fsimage(:));
gsig = mean(fgimage(:));
gnoise = std(fgimage(:));

sratfilt = 10*log10(ssig/snoise);
gratfilt = 10*log10(gsig/gnoise);
rattest = 10*log10(mean(image(:))/std(image(:)));

figure;
subplot(3,1,1);
imshow(image,'InitialMagnification','fit');
title( sprintf('Original Image, SNR = %f',rattest), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(3,1,2);
imshow(fsimage,'InitialMagnification','fit');
title( sprintf('Filtered Salt & Pepper Noisy Image, SNR = %f',sratfilt), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(3,1,3);
imshow(fgimage,'InitialMagnification','fit');
title( sprintf('Filtered Gaussian Noisy Image, SNR = %f',gratfilt), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part2b-image'),'-dpng');