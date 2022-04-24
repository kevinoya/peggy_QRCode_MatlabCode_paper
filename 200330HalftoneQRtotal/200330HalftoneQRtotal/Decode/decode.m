%解密   2022-03-20 only for 41*41
clear all,close all,clc;

originalData=imread('20220424_combine.tif');  % original data 165x165

figure(1),
subplot(1,3,1),imshow(originalData);title('original data');

%  加 key 解密 
key=9;
s=21;
t=21;

% if QRB is 33x33
subplot(1,3,2),
a=myDecodeKey(originalData(s+1:s+123,t+1:t+123),key);
imshow(a);title(['key=',num2str(key)]);
b=myQR41temp33(a);
subplot(1,3,3),imshow(imresize(uint8(double(b)*255),8,'nearest'));title('if Mask - decoded QR 41*41');
