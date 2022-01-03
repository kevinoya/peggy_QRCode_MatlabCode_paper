% k5a=imread('inputColor660.tif');
k5a=imread('peggy.jpg');
%for ii=1:1
%filename=[ 'myQR1000',num2str(ii),'_2.png'];  % input QR code
%qr1=imread('myQR10001_2.png');
qr1=imread('peggyword12QRCode41QR.tif'); %外顯的QR code
qr2=imread('peggyword12QRCode41HideQR.tif'); % 內藏的QR code
%load qrA20;
%load qrB20;
ss=1529524;

res1_120=[myCmykQR33_181128v6(k5a,4,qr1,qr2,50,ss+3)];
%{
 res1_120=[myCmykQR33_180607(k5a,4,qr1,qr2,30,ss+3);
           myCmykQR33_180607(k5a,4,qr1,qr2,40,ss+4);
           myCmykQR33_180607(k5a,4,qr1,qr2,50,ss+5);
           myCmykQR33_180607(k5a,4,qr1,qr2,60,ss+6) ];
%}

imwrite(res1_120,'202112101.tif');
imshow(imadjust(255-res1_120(:,:,4),[0.5 1],[0 1]));title('hidden QR');
%end
%imwrite(imadjust(255-res1(:,:,4),[0.5 1],[0 1]),'test180418yB.tif','Resolution',600);