%  �ק�name30���e (�L�ղ� 28,29 ����)
%
clear all;
y=imread('name30c.tif');
y1=y(:,:,1);
m1=1084; n1=100;
y9=y1(m1+1:m1+80,101:202);  % ���X����
%
y1(m1+1:m1+80,101:202)=255;  % ���
figure(1),imshow(y1);
%
ss=15;
y1(m1+1:m1+80,101-ss:202-ss)=y9; % �����m��
%
figure(2),imshow(y1);
%
% imwrite(uint8(y1),'name30.tif');  % �s�� 1200x248