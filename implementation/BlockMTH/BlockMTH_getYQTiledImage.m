function NewSubImg = getYQTiledImage(Img,from,to)

            R =Img(from,to ,1);
            G =Img(from,to ,2);
            B =Img(from,to ,3);

            NewSubImg(:,:,1) = R;
            NewSubImg(:,:,2) = G;
            NewSubImg(:,:,3) = B;
            
            
            
            
            
end
