 function [MTHs, files] = CreateTextonDB(DirName)
 savefile = 'Test1000_DB.mat';
 D = dir(DirName);
 
 count = 0;
 
 for (i=3:length(D)) 
 if ((strcmpi(D(i).name(end-3:end), '.jpg')==1) || (strcmpi(D(i).name(end-3:end), '.jpeg')==1 ) || (strcmpi(D(i).name(end-3:end), '.png')==1)) 
 count = count + 1; 
 [MTHs{count}] = getImageTextonFeature([DirName '/' D(i).name]); 
 files{count} = [DirName '/' D(i).name]; 
 fprintf('%.4d File %40s computed...\n',count,files{count}) 
 end 
 end

 save (savefile, 'files', 'MTHs')