y=imread('shortmusicQR.png');
y1=y(1:3:123,1:3:123);
y2=y1>128;
imshow(y2);
imwrite(y2,'shortmusicQR.tif');