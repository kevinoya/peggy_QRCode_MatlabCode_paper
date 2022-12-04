%
% 此程式會產生內外顯結合的圖片
%


k5a=imread('NTNU22.jpg');%使用的圖片檔名(660x660)

% 九點位跟四點位的QR Code大小不一樣，
% 九點位 = (49*49) QR Code像素大小147*147 cut 49*49
% 四點位 = (41*41) QR Code像素大小123*123 cut 41*41
% 四點位 = (33*33) QR Code像素大小99*99 cut 33*33
% 四點位 = (29*29) 
qr1=imread('NTNUQR Code-out41H.tif');  % 外顯的QR code  logical
qr2=imread('158word-41L.tif'); % 內藏的QR code  logical
%

ss=1529524; %隱藏QRCode顯示的數字，第一碼不明原因不會顯示
%%實際顯示會+3，因會下面那行 ss+3

%九個點位的程式 START%
%res1_120=[myCmykQR33_181128v8(k5a,4,qr1,qr2,70,ss+3)]; 
%九個點位的程式 END%

%四個點位(41*41)的程式 START%
res1_120=[myCmykQR33_181128v6(k5a,4,qr1,qr2,70,ss+3)];
%四個點位(41*41)的程式 END%

%四個點位(33*33)的程式 START%
%res1_120=[myCmykQR33_181128v4(k5a,4,qr1,qr2,70,ss+3)];
%四個點位(33*33)的程式 END%

%四個點位(29*29)的程式 START%
%res1_120=[myCmykQR33_181128v3(k5a,4,qr1,qr2,70,ss+3)];
%四個點位(29*29)的程式 END%


imwrite(res1_120,'158word-41L-out.tif');
imshow(imadjust(255-res1_120(:,:,4),[0.5 1],[0 1]));title('hidden QR');



