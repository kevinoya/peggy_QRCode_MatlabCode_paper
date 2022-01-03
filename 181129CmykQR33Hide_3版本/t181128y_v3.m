% k5a=imread('inputColor660.tif');
k5a=imread('ntnuLogoColor660B.tif');
%for ii=1:1
%filename=[ 'myQR1000',num2str(ii),'_2.png'];  % input QR code
%qr1=imread('myQR10001_2.png');
qr1=imread('29QR.tif'); %外顯的QR code
qr2=imread('4x4_v3_174bit.tif'); % 內藏的QR code
%load qrA20;
%load qrB20;
ss=1806070;

res1_120=[myCmykQR33_181128v3(k5a,4,qr1,qr2,50,ss+3)];
%{
 res1_120=[myCmykQR33_180607(k5a,4,qr1,qr2,30,ss+3);
           myCmykQR33_180607(k5a,4,qr1,qr2,40,ss+4);
           myCmykQR33_180607(k5a,4,qr1,qr2,50,ss+5);
           myCmykQR33_180607(k5a,4,qr1,qr2,60,ss+6) ];
%}

imwrite(res1_120,'test181129y_v3_50.tif');
imshow(imadjust(255-res1_120(:,:,4),[0.5 1],[0 1]));title('hidden QR');
%end
%imwrite(imadjust(255-res1(:,:,4),[0.5 1],[0 1]),'test180418yB.tif','Resolution',600);