y=imread('QRcode_TUNNEL.png');
y1=y(1:3:123,1:3:123);
y2=y1>128;
imshow(y1);
%imshow(y2);
imwrite(y2,'20211127_QRcode_TUNNEL.tif');