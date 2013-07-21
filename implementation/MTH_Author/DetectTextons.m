function [Texton] = DetectTextons(ImageX,Rows, Columns)
%--------------Texton Detection----------------------

Texton = double(ones(Rows, Columns));

for i=1:Rows/2
  for j=1:Columns/2

   if (ImageX(2*i-1,2*j-1)== ImageX(2*i,2*j)) 
                
         Texton(2*i-1,2*j-1) = ImageX(2*i-1, 2*j-1);
         Texton(2*i,2*j)     = ImageX(2*i, 2*j-1);
         Texton(2*i-1, 2*j)  = ImageX(2*i-1,2*j);
         Texton(2*i, 2*j)    = ImageX(2*i, 2*j);
   end
     %------------------------------------
   if (ImageX(2*i-1,2*j)==ImageX(2*i,2*j-1)) 
        
         Texton(2*i-1,2*j-1) = ImageX(2*i-1, 2*j-1);
         Texton(2*i, 2*j-1)  = ImageX(2*i, 2* j-1);
         Texton(2*i-1,2*j)   = ImageX(2*i-1, 2*j);
         Texton(2*i, 2*j)    = ImageX(2*i, 2*j);
   end
    %---------------------------------------
   if (ImageX(2*i-1,2*j-1)==ImageX(2*i,2*j-1)) 
       
         Texton(2*i-1,2*j-1) = ImageX(2*i-1, 2*j-1);
         Texton(2*i, 2*j-1)  = ImageX(2*i, 2*j-1);
         Texton(2*i-1, 2*j)  = ImageX(2*i-1, 2*j);
         Texton(2*i, 2*j)    = ImageX(2*i, 2*j);
   end
    %-----------------------------------------
   if (ImageX(2*i-1,2*j-1)==ImageX(2*i-1,2*j)) 

         Texton(2*i-1, 2*j-1) = ImageX(2*i-1, 2*j-1);
         Texton(2*i, 2*j-1)   = ImageX(2*i, 2*j-1);
         Texton(2*i-1, 2*j)   = ImageX(2*i-1, 2*j);
         Texton(2*i, 2*j)     = ImageX(2*i, 2*j);
   end
    %-----------------------------------------
  
  end
end
        
        