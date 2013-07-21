function [ImageX, Ori] = QuantizeTextureOrientation(RGB, theta ,Rows, Columns,CSB)


% ============================ CALCULATE ORIENTATION    ============================
% ============================          AND             ============================
% ==================== QUANTIZE TEXTURE ORIENTATION UNIFORMALY =====================
% ==================== INTO 18 ORIENTATIONS WITH 10 AS STEP-LENGTH =================

ImageX  = double(zeros(Rows, Columns));
Ori     = double(zeros(Rows, Columns));

for i=1:Rows
    for j=1:Columns

       R = RGB(i, j,1);
       G = RGB(i, j,2);
       B = RGB(i, j,3);

       if (R >=0 && R <= 64)
           VI = 0;
       elseif (R >= 65  && R <= 128)    
           VI = 1;
       elseif (R >= 129 && R <= 192)   
           VI = 2;
       elseif (R >= 193 && R <= 255)   
           VI = 3;
       end
       %-------------------------------------
       if (G>= 0 && G <= 64)       
           SI = 0;
       elseif (G >= 65 && G <= 128)    
           SI = 1;
       elseif (G >= 129 && G <= 192)   
           SI = 2;
       elseif (G >= 193 && G <= 255)   
           SI = 3;
       end
       % -------------------------------------------
       if (B >= 0 && B <= 64)       
           HI = 0;
       elseif (B >= 65 && B <= 128)    
           HI = 1;
       elseif (B >= 129 && B <= 192)   
           HI = 2;
       elseif (B >= 193 && B <= 255)   
           HI = 3;
       end
       %-------------------------------------------

       ImageX(i, j) = 16 * VI + 4 * SI + HI;
%        Ori(i,j)= (theta(i,j)*CSB/180);
        Ori(i,j)= (theta(i,j)/10);
       if (Ori(i,j)>=CSB-1) 
           Ori(i,j)=CSB-1;
       end
       
    end
end

