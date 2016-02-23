%% 2. Filtering a Noisy Image
% Part A
I = imread('IMAGES/livingroom.tif');
image = im2double(I);

variance = var(image(:));

%add salt&pepper noise
simage = imnoise(image,'salt & pepper',0.25);
%add gaussian noise
gvar = 0.15;
gimage = imnoise(image,'gaussian',0,gvar);

ssig = mean(simage(:));
snoise = std(simage(:));
image_difference = image - simage;
svar = var(image_difference(:));
%srat = 10*log10(ssig/snoise);
srat = 10*log10(variance/svar);

gsig = mean(gimage(:));
gnoise = std(gimage(:));
%grat = 10*log10(gsig/gnoise);
grat = 10*log10(variance/gvar);

%rattest = 10*log10(mean(image(:))/std(image(:)));

figure;
subplot(1,3,1);
imshow(image,'InitialMagnification','fit');
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(1,3,2);
imshow(simage,'InitialMagnification','fit');
xlabel(sprintf('SNR = %.3f',srat));
title( sprintf('Salt & Pepper Noisy Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(1,3,3);
imshow(gimage,'InitialMagnification','fit');
xlabel(sprintf('SNR = %.3f',grat));
title( sprintf('Gaussian Noisy Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part2a-image'),'-dpng');

%% Part B
N = 5;
sigma = 0.5;

HLP = fspecial('gaussian',N,sigma);
flsimage = filter2(HLP,simage);
fmsimage = medfilt2(simage,[5,5]);
flgimage = filter2(HLP,gimage);
fmgimage = medfilt2(gimage,[5,5]);
fbsimage = medfilt2(flsimage,[5,5]);
fbgimage = medfilt2(flgimage,[5,5]);
% % ssig = mean(fsimage(:));
% % snoise = std(fsimage(:));
% % gsig = mean(fgimage(:));
% % gnoise = std(fgimage(:));
% 
% image_difference = image - flsimage;
% slvar = var(image_difference(:));
% slrat = 10*log10(variance/slvar);
% glrat = 10*log10(variance/gvar);
% 
% image_difference = image - fmsimage;
% smvar = var(image_difference(:));
% smrat = 10*log10(variance/smvar);
% gmrat = 10*log10(variance/gvar);
% 
% image_difference = image - fbsimage;
% sbvar = var(image_difference(:));
% sbrat = 10*log10(variance/sbvar);
% gbrat = 10*log10(variance/gvar);


% sratfilt = 10*log10(ssig/snoise);
% gratfilt = 10*log10(gsig/gnoise);
% rattest = 10*log10(mean(image(:))/std(image(:)));

figure;
subplot(2,2,1);
imshow(image,'InitialMagnification','fit');
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,2);
imshow(flsimage,'InitialMagnification','fit');
title( sprintf('Low Pass Filtered Salt & Pepper Noisy Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,3);
imshow(fmsimage,'InitialMagnification','fit');
title( sprintf('Median Filtered Salt & Pepper Noisy Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,4);
imshow(fbsimage,'InitialMagnification','fit');
title( sprintf('Low Pass/Median Filtered Salt & Pepper Noisy Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part2b-image1'),'-dpng');

figure;
subplot(2,2,1);
imshow(image,'InitialMagnification','fit');
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,2);
imshow(flgimage,'InitialMagnification','fit');
title( sprintf('Low Pass Filtered Gaussian Noisy Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,3);
imshow(fmgimage,'InitialMagnification','fit');
title( sprintf('Median Filtered Gaussian Noisy Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(2,2,4);
imshow(fbgimage,'InitialMagnification','fit');
title( sprintf('Low Pass/Median Filtered Gaussian Noisy Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part2b-image2'),'-dpng');