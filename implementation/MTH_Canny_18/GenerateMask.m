function mask = GenerateMask(sig)
% Calculate Mask Size
sHalf = round(sqrt(-log(0.1) * 2 * sig^2));
mask_size = 2*sHalf + 1;
% Compute the Mask and save it in a mask.doc file
fid = fopen('mask.doc', 'w+');
% fprintf(fid,'\t\t --- THE GUASSIAN FIRST DERIVATIVE MASK COMPUATATION ---- \n\n\n');
% fprintf(fid,'Sigma =  %d \n\n',sig);

% fy Mask
for i=-sHalf:sHalf
    y = i;
    fy(i+sHalf+1) = -y/(sqrt(2*pi)*sig^3) * exp(-0.5*y.^2/sig^2);
end

% fy Mask
fx = fy';

% Save the mask
% fprintf(fid,'\n\nThe fx Mask with size =  1 x %d : \n\n[',mask_size);
for i=1:mask_size
    fprintf(fid,'%4.4f \t',fx(i));
end

% fprintf(fid,']\n\n\n\nThe fy Mask with size =  %d x 1 : \n\n\t[',mask_size);
% for i=1:mask_size
%     fprintf(fid,'\t%4.4f \n',fy(i));
% end
% fprintf(fid,'\t]');
% fprintf(fid,'\n\n\n\n\n------------------------------------------------');
% fprintf(fid,'\n Gaussain First Derivate Mask Generator \n by M. Shaid Farid');
mask = fx;
% Close the file
fclose(fid);


