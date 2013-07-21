function Canny_18_SearchImage(imageName)
 clc;
 close all;
 
%  image1x256.png

%  imageName = 'image1x256.png';
% imageName = 'imran khan  (5).jpg';
%  imageName = 'car1.png';

if (isempty(imageName))
    imageName = 'car1.png';
end

%    imageName = '528.jpg';
%    imageName = '601.jpg'; 
% imageName = '603.jpg';
% imageName = '715.jpg';
% imageName = '242.jpg';

% imageName = '242.jpg';
 
    load ('MTH_Canny_18_Test1000_DB.mat');
%     Img = imread(imageName);
%     MTH = getImageTextonFeatureUsingCanny (Img);
    Canny_18_MTH_FVS_Query = Canny_18_getImageTextonFeature (imageName);

%     Canny_18_MTH_FVS_All = cell2mat(Canny_18_MTH_FVS);
%     DTQs = zeros(82, length(Canny_18_MTH_FVS));  
%     distanceMetric = zeros(82,1);
    
    Qi = repmat(Canny_18_MTH_FVS_Query,[1 length(Canny_18_MTH_FVS)]);
    Ti = cell2mat(Canny_18_MTH_FVS);
    
    [val idx]    =  sort(sum(abs(Ti-Qi)./(1+Ti+Qi)));
    
    
    NoOfRows = 2;
    NoOfCols = 5;
    
    subplot(NoOfRows,NoOfCols,1); 
    imshow(imread(imageName)); 
    title('Query Image');

    
    for i = 1:9

         path = (cell2mat(files(idx(i))));
         RGB = imread(path);
    % %     str = sprintf('Similiar Image# %d: with difference = %.3f',i,(cell2mat(files(val(i)))));
         str = sprintf('Similiar Image# %d:',i);
         subplot(NoOfRows,NoOfCols,i+1);
         imgData = imread(path);
         imshow(RGB);  title(str);
    end    
 
    
    RecallHist = double(100); 

      imagePath = '/Users/air/Desktop/studyStuff/Thesis2/implementation/images/image.orig/';
    
      qiPath = strrep(imageName, imagePath, '');
      qiPath = strrep(imageName, '.jpg','');
      imgNum = round(str2double(qiPath));
      lowerLimit = floor(imgNum/100) *100;
      upperLimit = lowerLimit  + 99;
      
counter = 0;
      

  for i = 1: 10
    
      path = (cell2mat(files(idx(i))));
%       /Users/air/Desktop/studyStuff/Thesis2/ProposedCode/image.orig/0.jpg
      path = strrep(path, '/Users/air/Desktop/studyStuff/Thesis2/implementation/images/image.orig/', '');
      path = strrep(path, '.jpg','');
      imgNum = round(str2double(path));
      
      if (isnumeric(imgNum))
          if (imgNum >= lowerLimit && imgNum <= upperLimit)
              counter = counter + 1;
          end
      end
%       imgNum = floor(imgNum/100) + 1;
%       RecallHist (imgNum) = RecallHist (imgNum) + 1;
 end
 
  fprintf('Search Completed\n');
  counter
  
end

 