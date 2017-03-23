function [ imScaling ] = fImageScaling( inImage, scale )
%Santiago Ocampo Rúa: Function to Scaling an image
%   This function needs an image and a odd number.

%Get dimensions sizes from input image (width, heigth and length)
[h, w, l] = size(inImage);

%Sets rows and cols sizes from output image
rScale = h*scale;
cScale = w*scale;

%Create result image with default values and final dimensions
imScaling = uint8(zeros(rScale,cScale));

%Get the remainder after division by 2
remainder = mod(scale,2);

%Check if the input factor is a power number of 2
if remainder ~= 0
    %Check if scale is positive
    if scale > 0
        %Define and set intial values
        initMid = round(scale/2);
        rowPos = initMid;
        colPos = initMid;
        %Rows number loop
        for i=1:h
            %Columns number loop
            for j=1:w
                %Set new dimension limit
                limit = floor(scale/2);
                %Length number loop
                for k=1:l
                    %Set current pixel value
                    imScaling(rowPos-limit:rowPos+limit,colPos-limit:colPos+limit,k) = inImage(i,j,k);
                end
                %Increase col position
                colPos = colPos + scale;
            end
            %Increase row position
            rowPos = rowPos + scale;
            %Reset col position
            colPos = initMid;
        end
        %Show scaling image as result
        figure,colormap('gray'),imagesc(imScaling),title('Scaling Image');
    else
        %Show error
        error('Error. The scale must be a positive number');
    end
else
    %Show error
    error('Error. The scale must be an odd number');    
end
end

