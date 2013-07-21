function BlockMTH_Canny_18_SearchImage(imageName)


 clc;
 close all;
 
 load ('MTH_Block_Canny_18_Test1000_DB.mat');
%  load ('MTH_Block_Test1000_DB.mat');
 
 if (isempty(imageName))
    imageName = 'car1.png';
 end
 
    Img = imread(imageName);
    
   ImgYContainer =  BlockMTH_YQTiler(3,3,Img);
   BlockMTHs = double(zeros(82,9)); 
    for imgNo = 1 : length(ImgYContainer)
        RGB = ImgYContainer{imgNo};
        MTH = BlockMTH_Canny_18_getImageTextonFeature (RGB);
        BlockMTHs(:,imgNo) = MTH;  
    end
    
    
    
% =============================================================================================================================
% =============================================== Proposed Distance Calculations ==============================================
% =============================================================================================================================


%     TotalFiles      = length(BlockMTHss);
%     TemplateImages  = double(zeros(82*1,TotalFiles));
%     
%     colNo = 1;
% 
%         for i = 1 : TotalFiles
%             W = BlockMTHss{i};
%             B = W(:,colNo);
%             TemplateImages (:,i) = B;
%         end
% 
%         QBlockMTH = BlockMTHs(:,colNo);
% 
%         % Eculudien Distance
%         BlockMTH_Query = repmat(QBlockMTH ,[1 TotalFiles]);
%        [val idx]=sort(sqrt(sum((BlockMTH_Query-TemplateImages).^2)));
% 
% 
%        TotalFiles = TotalFiles - 100;
%        
%         for colNo = 2:9
%           
%             W = 0;
%             B = 0;
%             TemplateImages = 0;
%             TemplateImages  = double(zeros(82*1,TotalFiles));
%           for i = 1 : (TotalFiles - (100*colNo))
%             index = idx(i);
%             W = BlockMTHss{index};
%             B = W(:,colNo );
%             TemplateImages (:,index) = B;
%           end
% 
%             QBlockMTH = BlockMTHs(:,colNo);
% 
%         %   Eculudien Distance
%             BlockMTH_Query = repmat(QBlockMTH ,[1 TotalFiles]);
%             [val idx]=sort(sqrt(sum((BlockMTH_Query-TemplateImages).^2)));
% 
%         end
    
      
         
    



    
    
% % =============================================================================================================================
% % =============================================== EUCLEDIAN DISTANCE ==========================================================
% % =============================================================================================================================
% 
%     PRE PROCESS DATA => 2D to 1D
    TotalFiles = length(BlockMTH_canny18);
    TemplateImages = double(zeros(82*9,TotalFiles));
    
    
    for i = 1 : TotalFiles
        W = BlockMTH_canny18{i};
        B = reshape(W,[],1);
        TemplateImages (:,i) = B;
    end

    
    
    
    QBlockMTH = reshape(BlockMTHs,[],1);
    
%   Eculudien Distance
    BlockMTH_Query = repmat(QBlockMTH ,[1 TotalFiles]);
    [val idx]=sort(sqrt(sum((BlockMTH_Query-TemplateImages).^2)));
%     [val idx]=sort(sqrt(sum((TemplateImages - BlockMTH_Query).^2)));
%     Qi = BlockMTH_Query ;
%     Ti = TemplateImages ;
%     [val idx]    =  sort(sum(abs(Ti-Qi)./(1+Ti+Qi)));

  







% =============================================================================================================================
% =============================================== Show Results ================================================================
% =============================================================================================================================





  NoOfRows = 3;
  NoOfCols = 4;
  TotalResults = (NoOfRows * NoOfCols) -1;
  
  subplot(NoOfRows,NoOfCols,1); 
  imshow(imread(imageName)); 
  title('Query Image');
  
  for i = 1 : TotalResults
    
    path = (cell2mat(files(idx(i))));
    RGB = imread(path);
%     str = sprintf('Similiar Image# %d: with difference = %.3f',i,(cell2mat(files(val(i)))));
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
  
  
 fprintf('LMTH_SEARCHIMAGE FOR: %s\n',imageName);
 fprintf('AccuracyCounter :%d \n',AccuracyCounter);
 fprintf('RecallCounter :%d \n',RecallCounter);
  
  
  
  

% =============================================================================================================================
% =============================================== EDIT DISTANCE (LCS) =========================================================
% =============================================================================================================================

%     PRE PROCESS DATA => 2D to 1D
%     QBlockMTH = mat2str(reshape(BlockMTHs,[],1));
%     TotalFiles = length(BlockMTHss);
%     Similarity = double(TotalFiles);
%     
%     for i = 1 : TotalFiles
%         W = BlockMTHss{i};
%         B = reshape(W,[],1);
%         Similarity (i) = EditDist(mat2str(B),QBlockMTH);
%     end
%     
%     
%     
%     [val idx]=sort(Similarity);
%     
%   subplot(2,3,1); 
%   imshow(imread(imageName)); 
%   title('Query Image');
%   
%   for i = 1 : 5
%     
%     path = (cell2mat(files(idx(i))));
%     RGB = imread(path);
% %     str = sprintf('Similiar Image# %d: with difference = %.3f',i,(cell2mat(files(val(i)))));
%     str = sprintf('Similiar Image# %d:',i);
%     subplot(2,3,i+1);
%     imgData = imread(path);
%     imshow(RGB);  title(str);
%   end    
   



% =============================================================================================================================
% =============================================== SUMMED TECHNIQUE ============================================================
% =============================================================================================================================


% range = 0.0:0.1:1.0;
% rangeNew = 0.0:0.05:1.0;
% 
% range = 0.0:0.1:1.0;
% rangeNew = 0.0:0.05:1.0;
% 
% 
% [x,y]   = meshgrid(1:9);
% [x2,y2] = meshgrid(1:82);
% 
% % Hist = INTERP2(x,y,BlockMTHs,x2,y2);
% Hist = INTERP2(BlockMTHs);
% Nfiles = length(BlockMTHss);
% 
% t = 0.010; %not less than that threshold
% t2 = 0.8; %not greater than that threshold
% 
% 
% Similarity = double(Nfiles);
% 
% for i=1:Nfiles
%     
%     
%     % computing eucledean distance for all histogram bins:
% %     HistT = INTERP3(x,y,BlockMTHss{i},x2,y2);
%      HistT = INTERP2(double(BlockMTHss{i}));
%     
% %     DIFF = abs(Hist-HistT) ./ BlockMTHs;
%     DIFF = abs(BlockMTHs-double(BlockMTHss{i}));
%     [m n] = size(DIFF);
%     Summed = sum(sum(DIFF))/(m*n);
%   
% %      abc = length(DIFF) * mean(DIFF2) / (L2^2);
%     Similarity(i) = Summed;
% %     plotThres = 0.5 * 10 / length(DIFF);
% %     if (Similarity(i) < plotThres)
% %     end
% end
% 
% 
% % find the nResult "closest" images:
% [Sorted, ISorted] = sort(Similarity);
% 
% % numberOfImages = 3;
% % NRows = ceil((nResults+1) / numberOfImages);
% 
% % plot query image:
% 
% NRows = 2;
% numberOfImages = 3;
% nResults = 5;
% 
% subplot(NRows,numberOfImages,1); 
% imshow(Img); 
% title('Query Image');
% 
% % ... plot similar images:
%  for (i=1:nResults)
%      RGB = imread(files{ISorted(i)});
%  	str = sprintf('Similiar Image# %d: with difference = %.3f %s',i,Sorted(i),files{ISorted(i)});
%      subplot(NRows,numberOfImages,i+1);
%      imshow(RGB);  title(str);
%  end


% =============================================================================================================================
% =============================================================================================================================
% =============================================================================================================================
% =============================================================================================================================


    fprintf('Search Completed\n');
    


end



















