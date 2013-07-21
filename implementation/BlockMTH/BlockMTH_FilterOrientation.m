function [Ori] = BlockMTH_FilterOrientation(Ori,Rows, Columns)
%--------------filteredOri Detection----------------------

filteredOri = double(ones(Rows, Columns));

for i=1:Rows/2
  for j=1:Columns/2

   if (Ori(2*i-1,2*j-1)== Ori(2*i,2*j)) 
                
         filteredOri(2*i-1,2*j-1) = Ori(2*i-1, 2*j-1);
         filteredOri(2*i,2*j)     = Ori(2*i, 2*j-1);
         filteredOri(2*i-1, 2*j)  = Ori(2*i-1,2*j);
         filteredOri(2*i, 2*j)    = Ori(2*i, 2*j);
   end
     %------------------------------------
   if (Ori(2*i-1,2*j)==Ori(2*i,2*j-1)) 
        
         filteredOri(2*i-1,2*j-1) = Ori(2*i-1, 2*j-1);
         filteredOri(2*i, 2*j-1)  = Ori(2*i, 2* j-1);
         filteredOri(2*i-1,2*j)   = Ori(2*i-1, 2*j);
         filteredOri(2*i, 2*j)    = Ori(2*i, 2*j);
   end
    %---------------------------------------
   if (Ori(2*i-1,2*j-1)==Ori(2*i,2*j-1)) 
       
         filteredOri(2*i-1,2*j-1) = Ori(2*i-1, 2*j-1);
         filteredOri(2*i, 2*j-1)  = Ori(2*i, 2*j-1);
         filteredOri(2*i-1, 2*j)  = Ori(2*i-1, 2*j);
         filteredOri(2*i, 2*j)    = Ori(2*i, 2*j);
   end
    %-----------------------------------------
   if (Ori(2*i-1,2*j-1)==Ori(2*i-1,2*j)) 

         filteredOri(2*i-1, 2*j-1) = Ori(2*i-1, 2*j-1);
         filteredOri(2*i, 2*j-1)   = Ori(2*i, 2*j-1);
         filteredOri(2*i-1, 2*j)   = Ori(2*i-1, 2*j);
         filteredOri(2*i, 2*j)     = Ori(2*i, 2*j);
   end
    %-----------------------------------------

  end
end
        
        