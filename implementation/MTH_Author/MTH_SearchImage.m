function MTH_SearchImage(imageName)
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
 
    load ('MTH_Test1000_DB.mat');
%     Img = imread(imageName);
    MTH = getImageTextonFeature (imageName);

    MTHss = cell2mat(MTHs);
    DTQs = zeros(82, length(MTHs));  
    distanceMetric = zeros(82,1);
    
    Qi = repmat(MTH,[1 length(MTHs)]);
    Ti = cell2mat(MTHs);
    
    [val idx]    =  sort(sum(abs(Ti-Qi)./(1+Ti+Qi)));
   
  NoOfRows = 2;
  NoOfCols = 6;
  TotalResults = (NoOfRows * NoOfCols) -1;
  
  subplot(NoOfRows,NoOfCols,1); 
  imshow(imread(imageName)); 
  title('Query Image');


    
    for i = 1:TotalResults

         path = (cell2mat(files(idx(i))));
         RGB = imread(path);
    % %     str = sprintf('Similiar Image# %d: with difference = %.3f',i,(cell2mat(files(val(i)))));
            str = sprintf('Similiar Image# %d:',i);
            subplot(NoOfRows,NoOfCols,i+1); 
         imgData = imread(path);
         imshow(RGB);  title(str);
    end     
    
    
    
    
    
% =============================================================================================================================
% =============================================== RECALL & PERCISION ==========================================================
% =============================================================================================================================
  

RecallCounter = 0;
AccuracyCounter = 0;
                                  
      qiPath = strrep(imageName, '/Users/air/Desktop/studyStuff/Thesis2/implementation/images/image.orig/', '');
      qiPath = strrep(qiPath, '.jpg','');
      imgNum = round(str2double(qiPath));
      lowerLimit = floor(imgNum/100) *100;
      upperLimit = lowerLimit  + 99;
      
  for i = 1: 100
    
      path = (cell2mat(files(idx(i))));
%       /Users/air/Desktop/studyStuff/Thesis2/ProposedCode/image.orig/0.jpg
      path = strrep(path, '/Users/air/Desktop/studyStuff/Thesis2/implementation/images/image.orig/', '');
      path = strrep(path, '.jpg','');
      imgNum = round(str2double(path));
      
      
      
      if (isnumeric(imgNum))
          if (imgNum >= lowerLimit && imgNum <= upperLimit)
              RecallCounter = RecallCounter + 1;
              if (i <= 12)
                AccuracyCounter = AccuracyCounter + 1;
              end
          end
          
              
      end
%       imgNum = floor(imgNum/100) + 1;
%       RecallHist (imgNum) = RecallHist (imgNum) + 1;
 end
    
 fprintf('MTH_SEARCHIMAGE FOR: %s\n',imageName);
 fprintf('AccuracyCounter :%d \n',AccuracyCounter);
 fprintf('RecallCounter :%d \n',RecallCounter);
 fprintf('Search Completed\n');

 
  
%    figure ('Original Image');
%  imshow(uint8(RGB),[]); 
%  figure ('theta');
%  imshow(theta,[]);
%  figure ('Ori');
%  imshow(Ori,[]);
%  figure ('Texton');
%  imshow(Texton,[]);
%  figure ('ImageX');
%  imshow(ImageX,[]);
 
 

%   % computing eucledean distance for all Texton
%  Nfiles = length(MTH);
% range = 0.0:0.1:1.0;
% rangeNew = 0.0:0.05:1.0;
% [x,y,z]    = meshgrid(range);
% [x2,y2,z2] = meshgrid(rangeNew);
%  t = 0.010; %not less than that threshold
%  t2 = 0.8; %not greater than that threshold
%  
%  
%  for i=1:Nfiles
%      
%      
%      % computing eucledean distance for all histogram bins:
%      MTHD = INTERP3(x,y,z,MTH{i},x2,y2,z2);
%      DIFF = abs(MTH-MTHD) ./ MTH;
%      
%      DIFF = DIFF(MTH>t);
%      
%      DIFF2 = DIFF(DIFF<t2);
%      L2 = length(DIFF2);
%      
%      Similarity(i) = length(DIFF) * mean(DIFF2) / (L2^2);
%      
%      plotThres = 0.5 * 10 / length(DIFF);
%      if (Similarity(i) < plotThres)
%      end
%  end
 
 
%  
%  [Sorted, ISorted] = sort(Similarity);
%  
%  
%  numberOfImages = 3;
%  
%  NRows = ceil((nResults+1) / numberOfImages);
%  
%  % plot query image:
%  subplot(NRows,numberOfImages,1); 
%  imshow(imread(imageName)); 
%  title('Query Image');
%  
%  % ... plot similar images:
%   for (i=1:nResults)
%       RGB = imread(files{ISorted(i)});
%   	str = sprintf('Similiar Image# %d: with difference = %.3f',i,100*Sorted(i));
%       subplot(NRows,numberOfImages,i+1);
%       imshow(RGB);  title(str);
%   end
%  
%  fprintf('Search Completed\n');
 





end
















