%Default Init commands
clc
close all
clear

%Read input image
inImage = imread('cameraman.jpg');
% inImage = imread('frontTattoo.jpg');

%Show original image
figure,colormap('gray'),imagesc(inImage),title('Original Image');

%Define a scale
scale = 7;

%Invoke custom image scaling function
imScaling = fImageScaling(inImage,scale);