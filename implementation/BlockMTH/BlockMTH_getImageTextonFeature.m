function [MTH] = BlockMTH_getImageTextonFeature(RGB1)
% RGB = double(imread(imageName));
    RGB = RGB1;
    CSA = 64;
    CSB = 18;

% imwrite(createImageMatrix,'image1.bmp','bmp')
% curBitmap = imread('image1.bmp');
%RGB = imread('paperImage.png');

[Rows,Columns,ttt] = size(RGB);

[theta]             = BlockMTH_OrientationDetection(RGB, Rows, Columns);
[ImageX, oldOri]    = BlockMTH_QuantizeTextureOrientation(RGB, theta ,Rows, Columns,CSB);

Ori = BlockMTH_FilterOrientation(oldOri, Rows, Columns);


%--------------Texton Detection----------------------
% newWork = IM2COL(ImageX,[Width Height],'sliding');
Texton = BlockMTH_DetectTextons(ImageX,Rows, Columns);

%     plotRows = 2;
%     plotCols = 3;

%    subplot(plotRows,plotCols,1); 
%    imshow(uint8(RGB),[]); 
%    title('Query Image RGB');
%    
%    subplot(plotRows,plotCols,3); 
%    imshow(oldOri,[]); 
%    title('oldOri');
% 
%    subplot(plotRows,plotCols,4); 
%    imshow(ImageX,[]); 
%    title('ImageX');
%    subplot(plotRows,plotCols,5); 
%    imshow(Texton,[]); 
%    title('Texton');
   
   
   
 
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

MatrixH     = BlockMTH_CalculateHorizontalFeature(Texton, Ori, Rows, Columns, D, CSA,CSB);
MatrixV     = BlockMTH_CalculateVerticalFeature  (Texton, Ori, Rows, Columns, D, CSA,CSB);
MatrixRD    = BlockMTH_CalculateRightDiagonalFeature  (Texton, Ori, Rows, Columns, D, CSA,CSB);
MatrixLD    = BlockMTH_CalculateLeftDiagonalFeature(Texton, Ori, Rows, Columns, D, CSA,CSB);
                  
   %-------------------Features vectors--------------------------------------------------

MTH = zeros(CSA+CSB,1);

for i=1: CSA+CSB
    
    MTH(i)=(MatrixH(i)+MatrixV(i)+MatrixRD(i)+MatrixLD(i))/4.0;
%     str = sprintf('(H: %.3f , V:%.3f, RD: %.3f, LD: %.3f) and MTH = %.3f ',MatrixH(i),MatrixV(i),MatrixRD(i),MatrixLD(i), MTH(i));
%     str
end
                 
% MTH
