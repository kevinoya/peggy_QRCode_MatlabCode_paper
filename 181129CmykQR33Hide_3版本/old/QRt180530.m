k5a=imread('ntnuLogoColor660B.tif');
qr1=imread('m180111.tif');


inputErrorMask6x6;  % �o�� m4 (6x6x4)
% n=1;  % n=1,2,3,4  -->  12 16 20 24  / 144   ���P���[�K�ϰ��v
m7=m4(:,:,n);

% y33=imread('33aQRbin.tif');   % 33x33 binary
y33=qr1;

aa=(660-396)/2;
k5=k5a(aa+1:aa+396,aa+1:aa+396,:);   % �u��X 396x396 ���[�K�B�z
zz=myQR33HideColorB(k5,y33,m7);   % <=====  �D�n�B�z�{��

%
k5a(aa+1:aa+396,aa+1:aa+396,:)=zz;
% subplot(2,2,3),imshow(k5a); title('QR embedded');
% imwrite(k5a,'test1209C.tif');           % 660x660x3   �[�K

b=k5a;  % 660x660x3  RGB �[�K�v��
imwrite(b,'test180530.tif');