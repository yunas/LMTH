function [MatrixRD] = BlockMTH_CalculateRightDiagonalFeature(Texton, Ori, Row, Col, D, CSA,CSB)

MatrixRD = double(zeros(CSA+CSB,1));

for i = 1: Row - D 
 for j = 1: Col - D  
     
        RowVal1 = round (Ori(i,  j));
        RowVal2 = round (Ori(i + D, j + D));
     
       if (RowVal1 == RowVal2) 
           if(Texton(i, j) == 0)
                MatrixRD(1) = MatrixRD(1) + 1;
           else
                MatrixRD(Texton(i, j)) = MatrixRD(Texton(i, j)) + 1;
           end
       end

      if (Texton(i + D, j + D) == Texton(i, j)) 
          MatrixRD(CSA + RowVal1) = MatrixRD(CSA + RowVal1) + 1;
      end
 end
end