%  修改name30內容 (微調第 28,29 左移)
%
clear all;
y=imread('name30c.tif');
y1=y(:,:,1);
m1=1084; n1=100;
y9=y1(m1+1:m1+80,101:202);  % 切出部分
%
y1(m1+1:m1+80,101:202)=255;  % 填白
figure(1),imshow(y1);
%
ss=15;
y1(m1+1:m1+80,101-ss:202-ss)=y9; % 左移置換
%
figure(2),imshow(y1);
%
% imwrite(uint8(y1),'name30.tif');  % 存成 1200x248