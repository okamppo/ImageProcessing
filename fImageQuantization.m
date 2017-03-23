function [ imQuantize ] = fImageQuantization( inImage, factor )
%Santiago Ocampo Rúa: Function to Quantize an image
%   This function needs an gray scale image and a power number of 2.

%Get the remainder after division by 2
remainder = mod(factor,2);

%Check if the input factor is a power number of 2
if remainder == 0
    %Check if the input factor is lower than 257
    if factor < 257    
        %Create a value check points to set the pixels values
        initPoint = 0;
        newFactor = 256/factor;
        checkPoint = newFactor;
        %Copy input image to imQuantize matrix
        imQuantize = 0.*inImage;
        %Factor number loop
        for i=0:factor-1
            %Quantize image
            imQuantize(inImage >= initPoint & inImage <= checkPoint-1) = i;
            %Increases values check points
            initPoint = initPoint+newFactor;
            checkPoint = checkPoint+newFactor;        
        end
        %Show quantized image as result
        figure,colormap('gray'),imagesc(imQuantize),title('Quantized Image');
    else
        %Show error
        error('The maximum factor allowed is 256');
    end
else
    %Show error
    error('Error. The factor must be a power number of 2');
end
end

