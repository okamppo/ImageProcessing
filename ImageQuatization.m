%Default Init commands
clc
close all
clear

%Read input image
inImage = imread('cameraman.jpg');
% inImage = imread('frontTattoo.jpg');

%Convert original image to a gray image for only have 256 possible values
imgGray = rgb2gray(inImage);

%Show original image (gray scale)
figure,colormap('gray'),imagesc(imgGray),title('Gray Image');

%Show initial image histogram
initHist = fImageHistogram(imgGray,'Initial Image Histogram');

%Define a factor
factor = 6;

%Invoke custom image Quantization function
imQuantize = fImageQuantization(imgGray,factor);

%Show quantized image histogram
quantHist = fImageHistogram(imQuantize,'Quantized Image Histogram');