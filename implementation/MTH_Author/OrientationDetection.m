function [theta] = OrientationDetection(RGB, Rows, Columns)
% ============================ PROPOSED SOBEL OPERATOR ============================
%============================ Texture orientation detection--------------------
theta = double(zeros(Rows,Columns));
for i=2:Columns -1
    for j=2:Rows-1
      
          rx = abs((RGB(j+1 , i-1, 1) + 2 * RGB(j+1, i, 1) + RGB(j+1, i+1, 1)) - (RGB(j-1, i - 1, 1) + 2 * RGB(j-1, i, 1) + RGB(j-1, i + 1, 1)));
          gx = abs((RGB(j+1 , i-1, 2) + 2 * RGB(j+1, i, 2) + RGB(j+1, i+1, 2)) - (RGB(j-1, i - 1, 2) + 2 * RGB(j-1, i, 2) + RGB(j-1, i + 1, 2)));
          bx = abs((RGB(j+1 , i-1, 3) + 2 * RGB(j+1, i, 3) + RGB(j+1, i+1, 3)) - (RGB(j-1, i - 1, 3) + 2 * RGB(j-1, i, 3) + RGB(j-1, i + 1, 3)));
       
          ry = abs((RGB(j-1 , i+1, 1) + 2 * RGB(j, i+1, 1) + RGB(j+1, i+1, 1)) - (RGB(j-1, i - 1, 1) + 2 * RGB(j, i-1, 1) + RGB(j+1, i - 1, 1)));       
          gy = abs((RGB(j-1 , i+1, 2) + 2 * RGB(j, i+1, 2) + RGB(j+1, i+1, 2)) - (RGB(j-1, i - 1, 2) + 2 * RGB(j, i-1, 2) + RGB(j+1, i - 1, 2)));       
          by = abs((RGB(j-1 , i+1, 3) + 2 * RGB(j, i+1, 3) + RGB(j+1, i+1, 3)) - (RGB(j-1, i - 1, 3) + 2 * RGB(j, i-1, 3) + RGB(j+1, i - 1, 3)));       
       
         gxx = sqrt(double(rx * rx + gx * gx + bx * bx));
         gyy = sqrt(double(ry * ry + gy * gy + by * by));
         gxy = rx * ry + gx * gy + bx * by;
%          theta(i,j) = real(acosd(double(gxy)/double(gxx * gyy + 0.0001)));
        theta(j,i) = acosd(double(gxy)/double(gxx * gyy + 0.0001));
                         
    end
end