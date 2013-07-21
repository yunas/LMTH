function [MatrixH] = CalculateHorizontalFeature(Texton, Ori, Row, Col, D, CSA, CSB)

MatrixH = double(zeros(CSA+CSB,1));
for i = 1: Row 
 for j = 1: Col - D
     
     
     RowVal1 = round (Ori(i, j));
     RowVal2 = round (Ori(i, j + D));
     
       if (RowVal1 == RowVal2) 
           if(Texton(i, j) == 0)
             MatrixH(1) = MatrixH(1) + 1;
           else
             MatrixH(Texton(i, j)) = MatrixH(Texton(i, j)) + 1;
           end
       end
       
       
       if (Texton(i, j + D) == Texton(i, j))
           MatrixH(CSA + RowVal1) = MatrixH(CSA + RowVal1) + 1;
       end
       
 end
end
      