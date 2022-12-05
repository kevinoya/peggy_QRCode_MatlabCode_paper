%
% 此程式用來將原始圖片轉為灰度圖
%
filename = "20221205B";
y=imread(filename + ".png");
    y1 = rgb2gray(y);
    y2=(y1==255);
    subplot(2,2,1),imshow(y);subplot(2,2,2),imshow(y1);subplot(2,2,3),imshow(y2);
imwrite(y2,filename + ".tif");