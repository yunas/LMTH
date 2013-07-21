function [MatrixLD] = BlockMTH_CalculateLeftDiagonalFeature(Texton, Ori, Row, Col, D, CSA,CSB)

MatrixLD = double(zeros(CSA+CSB,1));


for i = 1+D: Row
   for j =1: Col - D 
       
       
       RowVal1 = round (Ori(i,  j));
        RowVal2 = round (Ori(i - D, j + D));
     
       if (RowVal1 == RowVal2) 
          if(Texton(i, j) == 0)
           MatrixLD(1) = MatrixLD(1) + 1;
          else
           MatrixLD(Texton(i, j)) = MatrixLD(Texton(i, j)) + 1;
          end
          
       end
       if (Texton(i - D, j + D) == Texton(i, j)) 
           MatrixLD(CSA + RowVal1) = MatrixLD(CSA + RowVal1) + 1;
       end
   end
end


% for i = D: Width
%    for j = 1: j <= Height - D 
%        if (Ori(i - D +1, j + D+1) == Ori(i, j)) 
%            MatrixLD(Texton(i, j)+1) = MatrixLD(Texton(i, j)+1) + 1;
%        end
%        if (Texton(i - D+1, j + D+1) == Texton(i, j)) 
%            MatrixLD(CSA + Ori(i, j)) = MatrixLD(CSA + Ori(i, j)) + 1;
%        end
%    end
% end