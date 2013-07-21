function [MTH] = getImageTextonFeature(imageName)
 RGB = double(imread(imageName));
%  RGB = double(Img);
 CSA = 64;
 CSB = 18;

% imwrite(createImageMatrix,'image1.bmp','bmp')
% curBitmap = imread('image1.bmp');
%RGB = imread('paperImage.png');

[Rows,Columns,ttt] = size(RGB);

[theta]         = OrientationDetection(RGB, Rows, Columns);
[ImageX, oldOri]   = QuantizeTextureOrientation(RGB, theta ,Rows, Columns,CSB);

Ori = FilterOrientation(oldOri, Rows, Columns);


%--------------Texton Detection----------------------
% newWork = IM2COL(ImageX,[Width Height],'sliding');
Texton = DetectTextons(ImageX,Rows, Columns);

    plotRows = 2;
    plotCols = 3;

   subplot(plotRows,plotCols,1); 
   imshow(uint8(RGB),[]); 
   title('Query Image RGB');

   subplot(plotRows,plotCols,2); 
   imshow(theta,[]); 
   title('Theta');
   
   subplot(plotRows,plotCols,3); 
   imshow(oldOri,[]); 
   title('oldOri');

   subplot(plotRows,plotCols,4); 
   imshow(ImageX,[]); 
   title('ImageX');
   subplot(plotRows,plotCols,5); 
   imshow(Texton,[]); 
   title('Texton');
   
   
   
 
%  imshow(); 
%  figure;
%  imshow(theta,[]);
%  figure;
%  imshow(Ori,[]);
%  figure;
%  imshow(Texton,[]);
          
     %-----------------------------------Multi-Texton Histogram-----------------------------------------
%     Ori;
%    Texton;

                
D =     1; % distance parameter      

MatrixH     = CalculateHorizontalFeature(Texton, Ori, Rows, Columns, D, CSA,CSB);
MatrixV     = CalculateVerticalFeature  (Texton, Ori, Rows, Columns, D, CSA,CSB);
MatrixRD    = CalculateRightDiagonalFeature  (Texton, Ori, Rows, Columns, D, CSA,CSB);
MatrixLD    = CalculateLeftDiagonalFeature(Texton, Ori, Rows, Columns, D, CSA,CSB);
                  
   %-------------------Features vectors--------------------------------------------------

MTH = zeros(CSA+CSB,1);

for i=1: CSA+CSB
    
    MTH(i)=(MatrixH(i)+MatrixV(i)+MatrixRD(i)+MatrixLD(i))/4.0;
%     str = sprintf('(H: %.3f , V:%.3f, RD: %.3f, LD: %.3f) and MTH = %.3f ',MatrixH(i),MatrixV(i),MatrixRD(i),MatrixLD(i), MTH(i));
%     str
end
                 
% MTH
