%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   Developed By:           Muhammad Younas QAZI                         %
%                           MS(CS),                                      %
%                           FAST NU-Lahore                               % 
%                           
%                                                                        %
%   Thanks to: Mathworks.com and various  authors for their              %
%   various examples and tutorials regarding computer vision &           %
%   imageProcessing on internet                                          %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


 

function ImgYContainer=YTiler(NHBlocks,NVBlocks,typeOfImages)

clc;
close all;

NHBlocks = 3;
NVBlocks = 3;
typeOfImages = '*.JPG'
% YTiler(4,4,'DSC00013.JPG');
LogoSDir=pwd;
vImgNames = dir(fullfile(LogoSDir,typeOfImages));
fileCount = length(vImgNames);

NumOfHorizontalBlocks=NHBlocks
NumOfVerticalBlocks=NVBlocks


ImageContainer=struct('imageName',{},'imageData',{} )

imgReadLimit=fileCount  ;
imgReadLimit= 1;
for fileIt = 1:imgReadLimit  %fileCount  
                  fName= '622.jpg';
%                   vImgNames(fileIt).name;
                  [Img ImgMap]=imread(fName);
                  figure,imshow(Img,ImgMap);        
                  
                  
                  
                  
                  X=floor(   size(Img,2)/NumOfHorizontalBlocks );
                  Y=floor(   size(Img,1)/NumOfVerticalBlocks   );
 
                  HorizontalBlockSize=X;
                  VerticalBlockSize=Y;
                  HiX=1;
                  VjY=1;
                  SubImageNumbers=0;
                  iMgNo=1;
                  figure,
                  
                      for Vj=1:NumOfVerticalBlocks
                        for Hi=1:NumOfHorizontalBlocks
                          SubImageNumbers=SubImageNumbers+Hi;
                          xlimit=(HiX+HorizontalBlockSize)-1;
                          ylimit=(VjY+VerticalBlockSize)-1 ;
                          
%                           R =Img(HiX:xlimit,VjY:ylimit ,1);
%                           G =Img(HiX:xlimit,VjY:ylimit ,2);
%                           B =Img(HiX:xlimit,VjY:ylimit ,3);
                          
                          R =Img(VjY:ylimit,HiX:xlimit,1);
                          G =Img(VjY:ylimit,HiX:xlimit,2);
                          B =Img(VjY:ylimit,HiX:xlimit,3);
                          
                          NewSubImg(:,:,1) = R;
                          NewSubImg(:,:,2) = G;
                          NewSubImg(:,:,3) = B;
                          
                         
                          subplot(NumOfVerticalBlocks,NumOfHorizontalBlocks,iMgNo);

                          imshow(NewSubImg,ImgMap);
                          VjY=VjY+VerticalBlockSize;
                          ImageContainer(fileIt).imageName=fName;
                          ImageContainer(fileIt).imageData(iMgNo).iNo=NewSubImg;

                        iMgNo=iMgNo+1;
                      end
                      HiX=HiX+HorizontalBlockSize;
                      VjY=1;
                  end

end;

% keyboard

% size(ImageContainer(1).imageData(1).iNo);
iMgNoLimit=length(ImageContainer(1).imageData);
for fileIt = 1:imgReadLimit %fileCount  
                        for iMgNo=1:iMgNoLimit  
                        subplot(NumOfHorizontalBlocks,NumOfVerticalBlocks,iMgNo);
                        imshow(ImageContainer(fileIt).imageData(iMgNo).iNo,ImgMap);
                        end

end


ImgYContainer=ImageContainer;
