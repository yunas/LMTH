function [MatrixV] = CalculateVerticalFeature(Texton, Ori, Row, Col, D, CSA, CSB)

MatrixV = double(zeros(CSA+CSB,1));
for i = 1: Row - D
 for j = 1: Col
     
     RowVal1 = round (Ori(i,  j));
     RowVal2 = round (Ori(i+D,j));
     
       if (RowVal1 == RowVal2) 
           if(Texton(i, j) == 0)
             MatrixV(1) = MatrixV(1) + 1;
           else
             MatrixV(Texton(i, j)) = MatrixV(Texton(i, j)) + 1;
           end
       end
       
       if (Texton(i+D, j) == Texton(i, j))
           MatrixV(CSA + RowVal1) = MatrixV(CSA + RowVal1) + 1;
       end

 end
end