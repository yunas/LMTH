 function [BlockMTHs, files] = BlockMTH_Canny_18_CreateBlockedTextonDB(DirName)

 savefileName = 'MTH_Block_Canny_18_Test1000_DB.mat';
            
 D = dir(DirName);
 
    count = 0;
    BlockMTHss = cell(1,length(D)-3);
 
 for i=3:length(D) 
     if ((strcmpi(D(i).name(end-3:end), '.jpg')==1) || (strcmpi(D(i).name(end-3:end), '.jpeg')==1 ) || (strcmpi(D(i).name(end-3:end), '.png')==1)) 

         imgName = [DirName '/' D(i).name];
         count = count + 1; 
         Img = imread(imgName);
         ImgYContainer =  BlockMTH_YQTiler(3,3,Img);
         BlockMTHs = uint8(zeros(82,9)); 
            for imgNo = 1 : length(ImgYContainer)
                RGB = ImgYContainer{imgNo};
                MTH = BlockMTH_Canny_18_getImageTextonFeature (RGB);
                BlockMTHs(:,imgNo) = MTH;  
           end

         [BlockMTH_canny18{count}] = BlockMTHs; 
         [files{count}] = D(i).name; 
         fprintf('%.4d File %40s computed...\n',count,files{count}) 
         
     end 
 end

 
 save (savefileName, 'files', 'BlockMTH_canny18')