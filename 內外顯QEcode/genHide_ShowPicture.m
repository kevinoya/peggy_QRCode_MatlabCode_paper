%
% 此程式會產生內外顯結合的圖片
%
k5a=imread('peggy.jpg');%使用的圖片檔名(660x660)
qr1=imread('peggyOutQR.tif'); %外顯的QR code (49*49) logical
qr2=imread('peggyHideQR.tif'); % 內藏的QR code (49*49) logical
ss=1529524; %隱藏QRCode顯示的數字，第一碼不明原因不會顯示(我搞不懂)
%%實際顯示會+3，因會下面那行 ss+3
res1_120=[myCmykQR33_181128v8(k5a,4,qr1,qr2,50,ss+3)];

imwrite(res1_120,'20211210.tif');
imshow(imadjust(255-res1_120(:,:,4),[0.5 1],[0 1]));title('hidden QR');
