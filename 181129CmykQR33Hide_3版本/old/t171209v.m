%  �ֳt���ͱm��Ϲ���QR   �[�K0/1 + error diffusion  2017-12-01
%
%  input:  QR + �~��color + �[�K�j��(���n) 
%    
%  output:  Color Graphic QR (396x396x3)
clear all;

inputErrorMask6x6;  % �o�� m4 (6x6x4)
n=1;  % n=1,2,3,4  -->  12 16 20 24  / 144   ���P���[�K�ϰ��v
m7=m4(:,:,n);

y33=imread('33QR.tif');   % 33x33 binary
k5a=imread('NTNU_logo660.tif');  % 660x660x3 �~��v��
clf;
subplot(2,2,1),imshow(k5a); title('input image');
subplot(2,2,2),imshow(y33); title('QR image');

aa=(660-396)/2;
k5=k5a(aa+1:aa+396,aa+1:aa+396,:);   % �u��X 396x396 ���[�K�B�z
zz=myQR33HideColorB(k5,y33,m7);   % <=====  �D�n�B�z�{��
%
k5a(aa+1:aa+396,aa+1:aa+396,:)=zz;
subplot(2,2,3),imshow(k5a); title('QR embedded');
imwrite(k5a,'test1228C.tif');           % 660x660x3   �[�K


B=0.8;  %   �]�p�꺥�h
inputCircle;  % �o��  Z5  mask (660x660)
%
w660=uint8(ones(660,660,3)*255);    % �B�z���ꩳ
k2=myBlendColorImages( k5a, w660, Z5);
% k3=uint8(double(k3a).*double(Z5));
% imwrite(k2,'RGBimageO.tif');


qrf=imread('QRfinderColor.tif');      % �[�J QR ��
mask=imread('binQR33_660.tif');
res=myBlendColorImages(k2,qrf,~mask);
subplot(2,2,4),imshow(res);title('final');
imwrite(res,'test1228v.tif');



