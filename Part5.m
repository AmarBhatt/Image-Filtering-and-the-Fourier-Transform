%% The 2-D Fourier Transform of a Real Image
% Part A.
clear all;close all;

I = imread('IMAGES/cameraman.tif'); % Load grayscale image
F = fft2(I);
FS = fftshift(F); % Shifted transform

figure;
subplot(221);
imshow(I);
title( sprintf('Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(222);
imshow(abs(F),[0 255]);
title( sprintf('2D DFT of Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(223);
imshow(abs(FS),[0 255]);
title( sprintf('2D Shifted DFT of Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(224);
imshow(log(abs(FS)),[]); % Show log magnitude
title( sprintf('2D Shifted DFT with Log of Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part5a-image1'),'-dpng');
%% Part B.

IF = ifft2(FS);
ID = 255*im2double(I);
mse = (1/(length(I)*length(I')))*sum(sum((abs(IF)-ID).^2));

figure;
subplot(211);
imshow(ID,[]);
title( sprintf('Original Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(212);
imshow(abs(IF),[]); % Show log magnitude
xlabel(sprintf('MSE = %0.3e',mse));
title( sprintf('Inverse Fourier Transform Image'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part5b-image1'),'-dpng');
%% Part C.
center = 256;
[rr cc] = meshgrid(1:512);

mask4 = sqrt((rr-center).^2+(cc-center).^2)<=512/4;
FS4 = mask4.*FS;
IF4 = ifft2(FS4);
ID = 255*im2double(I);
mse4 = (1/(length(I)*length(I')))*sum(sum((abs(IF4)-ID).^2));
figure
subplot(121);
imshow(abs(IF4),[]); % Show log magnitude
xlabel(sprintf('MSE = %0.3e',mse4));
title( sprintf('IDFT: Radius = N/4'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(122);
imshow(log(abs(FS4)),[]); % Show log magnitude
title( sprintf('DFT'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part5c-image1'),'-dpng');
figure;
mask8 = sqrt((rr-center).^2+(cc-center).^2)<=512/8;
FS8 = mask8.*FS;
IF8 = ifft2(FS8);
ID = 255*im2double(I);
mse8 = (1/(length(I)*length(I')))*sum(sum((abs(IF8)-ID).^2));
subplot(121);
imshow(abs(IF8),[]); % Show log magnitude
xlabel(sprintf('MSE = %0.3e',mse8));
title( sprintf('IDFT: Radius = N/8'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(122);
imshow(log(abs(FS8)),[]); % Show log magnitude
title( sprintf('DFT'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);    
print(sprintf('RESULTS/part5c-image2'),'-dpng');
figure;
mask16 = sqrt((rr-center).^2+(cc-center).^2)<=512/16;
FS16 = mask16.*FS;
IF16 = ifft2(FS16);
ID = 255*im2double(I);
mse16 = (1/(length(I)*length(I')))*sum(sum((abs(IF16)-ID).^2));
subplot(121);
imshow(abs(IF16),[]); % Show log magnitude
xlabel(sprintf('MSE = %0.3e',mse16));
title( sprintf('IDFT: Radius = N/16'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(122);
imshow(log(abs(FS16)),[]); % Show log magnitude
title( sprintf('DFT'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);    

print(sprintf('RESULTS/part5c-image3'),'-dpng');
figure;
mask32 = sqrt((rr-center).^2+(cc-center).^2)<=512/32;
FS32 = mask32.*FS;
IF32 = ifft2(FS32);
ID = 255*im2double(I);
mse32 = (1/(length(I)*length(I')))*sum(sum((abs(IF32)-ID).^2));
subplot(121);
imshow(abs(IF32),[]); % Show log magnitude
xlabel(sprintf('MSE = %0.3e',mse32));
title( sprintf('IDFT: Radius = N/32'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(122);
imshow(log(abs(FS32)),[]); % Show log magnitude
title( sprintf('DFT'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part5c-image4'),'-dpng');    

x = [1, 4, 8, 16, 32];
y = [mse,mse4,mse8,mse16,mse32];
figure;
plot(x,y);
hold on;
hold on;
plot(1,mse,'ro')
str1 = sprintf('(1,%0.2e)',mse);
text(1,mse,str1)
plot(4,mse4,'ro')
str1 = sprintf('(4,%0.2e)',mse4);
text(4,mse4,str1)
plot(8,mse8,'ro')
str1 = sprintf('(8,%0.2e)',mse8);
text(8,mse8,str1)
plot(16,mse16,'ro')
str1 = sprintf('(16,%0.2e)',mse16);
text(16,mse16,str1)
plot(32,mse32,'ro')
str1 = sprintf('(32,%0.2e)',mse32);
text(32,mse32,str1)
xlabel('Radius Scale (PIXELS/RADIUS\_SCALE)');
ylabel('MSE');
title( sprintf('MSE versus Radius Scale'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part5c-image5'),'-dpng');