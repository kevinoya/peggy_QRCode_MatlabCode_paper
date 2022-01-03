%  快速產生彩色圖像化QR   加密0/1 + error diffusion  2017-12-01
%
%  input:  QR + 外顯color + 加密強度(面積) 
%    
%  output:  Color Graphic QR (396x396x3)
clear all;

inputErrorMask6x6;  % 得到 m4 (6x6x4)
n=1;  % n=1,2,3,4  -->  12 16 20 24  / 144   不同的加密區域比率
m7=m4(:,:,n);

y33=imread('33QR.tif');   % 33x33 binary
k5a=imread('NTNU_logo660.tif');  % 660x660x3 外顯影像
clf;
subplot(2,2,1),imshow(k5a); title('input image');
subplot(2,2,2),imshow(y33); title('QR image');

aa=(660-396)/2;
k5=k5a(aa+1:aa+396,aa+1:aa+396,:);   % 只抓出 396x396 做加密處理
zz=myQR33HideColorB(k5,y33,m7);   % <=====  主要處理程序
%
k5a(aa+1:aa+396,aa+1:aa+396,:)=zz;
subplot(2,2,3),imshow(k5a); title('QR embedded');
imwrite(k5a,'test1228C.tif');           % 660x660x3   加密


B=0.8;  %   設計圓漸層
inputCircle;  % 得到  Z5  mask (660x660)
%
w660=uint8(ones(660,660,3)*255);    % 處理為圓底
k2=myBlendColorImages( k5a, w660, Z5);
% k3=uint8(double(k3a).*double(Z5));
% imwrite(k2,'RGBimageO.tif');


qrf=imread('QRfinderColor.tif');      % 加入 QR 框
mask=imread('binQR33_660.tif');
res=myBlendColorImages(k2,qrf,~mask);
subplot(2,2,4),imshow(res);title('final');
imwrite(res,'test1228v.tif');



