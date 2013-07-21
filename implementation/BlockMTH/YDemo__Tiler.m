
close all
clear all
clc

% YTiler(2,2,'DSC00013.JPG');
% YQTiler(4,4,'DSC00013.JPG');
% YTiler(4,3,'DSC00013.JPG');

Img = imread('622.jpg');
 ImgYContainer =  BlockMTH_YQTiler(3,3,Img);
   
    for imgNo = 1 : length(ImgYContainer)
        RGB = ImgYContainer{imgNo};
        subplot(3,3,imgNo);
        imshow(RGB,imgNo);
    end