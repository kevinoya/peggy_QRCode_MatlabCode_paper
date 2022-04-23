%  �ק� Graphic QR �~��v�� �@��  ��ַt�����I���~����   2018-01-01
% 
%  input:  aa: imadust �̧C�G�׭� (0.2 - 0.6)
%         jjj:  ��ƭ��n��� (1-4, 12,16,20,24 / 144)
%         iii:  QR code �Ǹ� (1-20)
%
%  output: res1:  660x660x3 Graphic QR
%
function res1=myCali660(aa,jjj,iii);
k5=imread('dog2000.tif');   % dog image for graphic QR
%
% aa=0.2; bb=0.8;   % 171231 ��X�ƾ�
%aa=0.4; 
bb=0.8;   % 180101 ��X�ƾ�
% aa=0.7; bb=0.8;   % 180101 ��X�ƾ� NG
%
k51=imadjust(k5,[0  0 0; 1 1 1],[0 aa aa; 1 bb bb]); 
%
cc=700;di=-200;dj=200;  % ���y���� QR2
cc=650;di=-200;dj=200;  % ���y���� QR3
k52=k51(cc+1+di:2000-cc+di,cc+1+dj:2000-cc+dj,:);
k5a=imresize(k52,[660,660]);
%k5a=imresize(k51,[660,660]);  % ��Ӫ��v���ؤo (�㰦��)

load qrE20;    % Ū�J33x33 QR 20 ��
ss=1805120;
% test=myRgbQR33(k5a,1,qrA20(:,:,1),ss+1);
% imwrite(test,'t1211b.tif');
% imshow(test);

% iii=1;
res=myRgbQR33noSer(k5a,jjj,qrE20(:,:,iii),ss+1);  % ���[�Ǹ�  2017/12/31 �����[�K�ϰ�


binL=imread('binQR33_660.tif');  %       Finders --> ����
LL=imread('QRfinderColor.tif');  % �¥�
LL1=LL(:,:,1)==0;  % binary
myBlank=ones(660,660,3)*255;
 %myBlank(:,:,1)=26;
 %myBlank(:,:,2)=255;
 %myBlank(:,:,3)=255;
myRed=zeros(660,660,3);
myRed(:,:,1)=255;
LL2=myBlendColorImages(uint8(myBlank),uint8(myRed),~LL1);
% imshow(LL2);
%
res1=myBlendColorImages(res,LL2,~binL);   % �o�� ���� QR finder
