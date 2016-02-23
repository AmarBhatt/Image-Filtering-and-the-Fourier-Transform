%% 6. The Magnitude and Phase of the 2-D DFT
% Part A.
clear all; close all;
I1 = 255*im2double(imread('IMAGES/cameraman.tif')); % Load grayscale image
I2 = 255*im2double(imread('IMAGES/livingroom.tif'));


F1 = fftshift(fft2(I1));
F2 = fftshift(fft2(I2));
figure;
subplot(131)
imshow(I1,[]);
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(132)
imshow(log(abs(F1)),[]);
title( sprintf('DFT Magnitude'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(133)
imshow(angle(F1),[]); 
title( sprintf('DFT Phase'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part6a-image1'),'-dpng');
figure;
subplot(131)
imshow(I2,[]);
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(132)
imshow(log(abs(F2)),[]);
title( sprintf('DFT Magnitude'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(133)
imshow(angle(F2),[]); 
title( sprintf('DFT Phase'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part6a-image2'),'-dpng');
%% Part B

IF1 = ifft2(abs(F2).*exp(i*angle(F1)));
IF2 = ifft2(abs(F1).*exp(i*angle(F2)));

mse1 = (1/(length(I1)*length(I1')))*sum(sum((abs(IF1)-I1).^2));
mse2 = (1/(length(I2)*length(I2')))*sum(sum((abs(IF2)-I2).^2));
figure;
subplot(221);
imshow(I1,[]);
title( sprintf('Original Images'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(222);
imshow(abs(IF1),[]); % Show log magnitude
xlabel(sprintf('MSE = %0.3e',mse1));
title( sprintf('Switched Phase Images'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(223);
imshow(I2,[]);
subplot(224);
imshow(abs(IF2),[]); % Show log magnitude
xlabel(sprintf('MSE = %0.3e',mse2));
print(sprintf('RESULTS/part6b-image1'),'-dpng');