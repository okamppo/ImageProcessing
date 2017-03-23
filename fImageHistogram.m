function [ imHistogram ] = fImageHistogram( inImage , histTitle)
%Santiago Ocampo Rúa: Function to show the histogram of an 8-bit image
%   This function needs an gray scale image and a histogram title.
%   Function made in classroom (Hermes Fandiño - Artifitial Vision)

%Create an Array vector to count all pixels frequency
imHistogram = zeros(1,256); % vector donde se acumula las frecuencias de pixeles
 
%8-bit image loop
for i = 0:255
    %Find all the values in inImage where condition is true
    a = find(inImage == i);
    %Set frequency to vector position
    imHistogram(1,i+1) = length(a);
end
%Show image histogram as result 
figure,bar(imHistogram),title(histTitle);
end
