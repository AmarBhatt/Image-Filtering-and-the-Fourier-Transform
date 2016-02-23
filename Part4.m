%% The 2-D Fourier Transform of  Sinusoid
% Part A.

clear all;close all;
imarr = zeros(100,100);

x = linspace(-pi,pi,100);
spafreq = 8;
sinusoid = sin(spafreq*x);

for i = 1:100
    imarr(i,:) = sinusoid;
end

figure;
fourier = fft2(imarr);
subplot(311)
plot(x,sinusoid);
title( sprintf('1D Sinusoid (Spatial Frequency = 8)'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(312);
imshow(imarr);
title( sprintf('2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(313);
imshow(abs(fourier));
title( sprintf('Fourier Transform of 2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part4a-image1'),'-dpng');

figure;
fourier = fft2(imarr);
fourierS = fftshift(fourier);
subplot(311)
imshow(abs(fourier));
title( sprintf('Fourier Transform of 2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(312);
imshow(abs(fourierS));
title( sprintf('Shifted Fourier Transform of 2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(313);
imshow(log(abs(fourierS)));
title( sprintf('Shifted Fourier Transform with Log of 2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part4a-image2'),'-dpng');

%% Part B
clear all;close all;
imarr1 = zeros(100,100);
imarr2 = zeros(100,100);
x = linspace(-pi,pi,100);
spafreq1 = 5.83;
spafreq2 = 12.41;
sinusoid1 = sin(spafreq1*x+2);
sinusoid2 = sin(spafreq2*x+7);
for i = 1:100
    imarr1(i,:) = sinusoid1;
    imarr2(i,:) = sinusoid2;
end

figure;
fourier1 = fft2(imarr1);
fourier2 = fft2(imarr2);
subplot(311)
plot(x,sinusoid1);
title( sprintf('1D Sinusoid (Spatial Frequency = 5.83 shifted by 2)'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(312);
imshow(imarr1);
title( sprintf('2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(313);
imshow(abs(fourier1));
title( sprintf('Fourier Transform of 2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part4b-image1'),'-dpng');



figure;
fourier1 = fft2(imarr1);
fourierS1 = fftshift(fourier1);
subplot(311)
imshow(abs(fourier1));
title( sprintf('Fourier Transform of 2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(312);
imshow(abs(fourierS1));
title( sprintf('Shifted Fourier Transform of 2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(313);
imshow(log(abs(fourierS1)),[]);
title( sprintf('Shifted Fourier Transform with Log of 2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part4b-image2'),'-dpng');

figure;
subplot(311)
plot(x,sinusoid2);
title( sprintf('1D Sinusoid (Spatial Frequency = 12.41 shifted by 7)'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(312);
imshow(imarr2);
title( sprintf('2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(313);
imshow(abs(fourier2));
title( sprintf('Fourier Transform of 2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part4b-image3'),'-dpng');


figure;
fourier2 = fft2(imarr2);
fourierS2 = fftshift(fourier2);
subplot(311)
imshow(abs(fourier2));
title( sprintf('Fourier Transform of 2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(312);
imshow(abs(fourierS2));
title( sprintf('Shifted Fourier Transform of 2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
subplot(313);
imshow(log(abs(fourierS2)),[]);
title( sprintf('Shifted Fourier Transform with Log of 2D Sinusoid'), 'fontsize',18);
    set(gca, 'fontsize', 18, 'linewidth', 2);
print(sprintf('RESULTS/part4b-image4'),'-dpng');

