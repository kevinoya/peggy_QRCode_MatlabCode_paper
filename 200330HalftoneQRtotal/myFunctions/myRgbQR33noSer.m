function res=myRgbQR33(k5a,n,qr1,ss);
% input:   k5a : 660x660x3 RGB color image
%          n   :  error mask   n=1,2,3,4  -->  12 16 20 24  / 144   ���P���[�K�ϰ��v
%          qr1 : �~��QR
%          ss : �Ǹ� (7��� �u��ܫ� 6��)

inputErrorMask6x6;  % �o�� m4 (6x6x4)
% n=1;  % n=1,2,3,4  -->  12 16 20 24  / 144   ���P���[�K�ϰ��v
m7=m4(:,:,n);

% y33=imread('33aQRbin.tif');   % 33x33 binary
y33=qr1;

% k5a=imread('inputColor660.tif');  % 660x660x3 �~��v��
% clf;
% subplot(2,2,1),imshow(k5a); title('input image');
% subplot(2,2,2),imshow(y33); title('QR image');

aa=(660-396)/2;
k5=k5a(aa+1:aa+396,aa+1:aa+396,:);   % �u��X 396x396 ���[�K�B�z
zz=myQR33HideColorB(k5,y33,m7);   % <=====  �D�n�B�z�{��
%
k5a(aa+1:aa+396,aa+1:aa+396,:)=zz;
% subplot(2,2,3),imshow(k5a); title('QR embedded');
% imwrite(k5a,'test1209C.tif');           % 660x660x3   �[�K



jj=0;                 % �[�Ǹ�
str=num2str(jj+ss);
%
qq1=imread(['h',str(1),'.tif']);
qq2=imread(['h',str(2),'.tif']);
qq3=imread(['h',str(3),'.tif']);
qq4=imread(['h',str(4),'.tif']);
qq5=imread(['h',str(5),'.tif']);
qq6=imread(['h',str(6),'.tif']);
qq7=imread(['h',str(7),'.tif']);
%
q1=qq1(95:304,50:339); 
q2=qq2(95:304,50:339);
q3=qq3(95:304,50:339);
q4=qq4(95:304,50:339);
q5=qq5(95:304,50:339);
q6=qq6(95:304,50:339);
q7=qq7(95:304,50:339);
%
mm1=[q1;q2;q3;q4;q5;q6;q7];  % 1470x290   7��ƧǸ�
mm2=imresize(mm1,[150 20]); 
mm3=rot90(mm2);              % 116*588
% aa=540; bb=200;
aa=530; bb=185+80;
%cym=imread('ntnu256.tif');
%cym2=imresize(cym,[40,40]);
cym2=logical(ones(35,35));
a=logical(ones(660,660));
% a(aa+1:aa+20, bb+1:bb+150)=mm3;   <====== series number
% a(aa+1:aa+35, bb+1:bb+35)=cym2;
%
b=uint8(zeros(660,660,3));
%c=myBlendColorImages(k5a,b,a);
c=k5a;

%B=5.8;  %   �]�p�꺥�h
B=10;
inputCircle;  % �o��  Z5  mask (660x660)
%
w660=uint8(255*ones(660,660,3));   % �B�z���ꩳ
k2=myBlendColorImages(c,w660,Z);
% k3=uint8(double(k3a).*double(Z5));
% imwrite(k2,'CMYKimageO.tif');


qrf=imread('QRfinderColor.tif');    % �[ QR ��
mask=imread('binQR33_660.tif');
res=myBlendColorImages(k2,qrf,~mask);
% imwrite(res,'test1211s.tif');

