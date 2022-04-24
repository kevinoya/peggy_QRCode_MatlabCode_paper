% cut 660x660 加入QR
%
clear all;
%
%y=imread('resA.tif');   % 756x567
y=imread('resB.tif');   % 756x567
y1000=uint8(255*ones(1000,1000,3));

i1=round( (1000-756)/2);  % 微調QR位置
j1=round( (1000-567)/2)-3;
y1000(i1+1:i1+756,j1+1:j1+567,:)=y;
%
i2=round( (1000-660)/2);
res660=y1000(i2+1:i2+660,i2+1:i2+660,:);
%
%  處理 660x660  add QR
%
qr1=imread('hmlvideo.tif');
ss=1901010;
%
res2=myRgbQR33(res660,4,qr1,ss+1);
%
y1000(i2+1:i2+660,i2+1:i2+660,:)=res2;
y756=y1000(i1+1:i1+756,j1+1:j1+567,:);
imshow(y756);
imwrite(y756,'res10.tif');