%  修改 Graphic QR 外顯影像 濃度  減少暗部白點錯誤辨識   2018-01-01
% 
%  input:  aa: imadust 最低亮度值 (0.2 - 0.6)
%         jjj:  資料面積比例 (1-4, 12,16,20,24 / 144)
%         iii:  QR code 序號 (1-20)
%
%  output: res1:  660x660x3 Graphic QR
%
function res1=myCali660(aa,jjj,iii);
k5=imread('dog2000.tif');   % dog image for graphic QR
%
% aa=0.2; bb=0.8;   % 171231 輸出數據
%aa=0.4; 
bb=0.8;   % 180101 輸出數據
% aa=0.7; bb=0.8;   % 180101 輸出數據 NG
%
k51=imadjust(k5,[0  0 0; 1 1 1],[0 aa aa; 1 bb bb]); 
%
cc=700;di=-200;dj=200;  % 狗臉局部 QR2
cc=650;di=-200;dj=200;  % 狗臉局部 QR3
k52=k51(cc+1+di:2000-cc+di,cc+1+dj:2000-cc+dj,:);
k5a=imresize(k52,[660,660]);
%k5a=imresize(k51,[660,660]);  % 原來的影像尺寸 (整隻狗)

load qrE20;    % 讀入33x33 QR 20 個
ss=1805120;
% test=myRgbQR33(k5a,1,qrA20(:,:,1),ss+1);
% imwrite(test,'t1211b.tif');
% imshow(test);

% iii=1;
res=myRgbQR33noSer(k5a,jjj,qrE20(:,:,iii),ss+1);  % 不加序號  2017/12/31 提高加密區域


binL=imread('binQR33_660.tif');  %       Finders --> 紅色
LL=imread('QRfinderColor.tif');  % 黑白
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
res1=myBlendColorImages(res,LL2,~binL);   % 得到 紅色 QR finder
