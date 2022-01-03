% k5a=imread('inputColor660.tif');
k5a=imread('inputLogoColor660B.tif');
%qr1=imread('33aQRbin.tif');
%qr2=imread('33bQRbin.tif');
load qrA20;
load qrB20;
ss=1805120;

res1=[
myCmykQR33(k5a,1,qrA20(:,:,1),qrB20(:,:,1),30,ss+1) myCmykQR33(k5a,2,qrA20(:,:,6),qrB20(:,:,6),30,ss+6)    myCmykQR33(k5a,3,qrA20(:,:,11),qrB20(:,:,11),30,ss+11) myCmykQR33(k5a,4,qrA20(:,:,16),qrB20(:,:,16),30,ss+16);
myCmykQR33(k5a,1,qrA20(:,:,2),qrB20(:,:,2),40,ss+2) myCmykQR33(k5a,2,qrA20(:,:,7),qrB20(:,:,7),40,ss+7)    myCmykQR33(k5a,3,qrA20(:,:,12),qrB20(:,:,12),40,ss+12) myCmykQR33(k5a,4,qrA20(:,:,17),qrB20(:,:,17),40,ss+17);
myCmykQR33(k5a,1,qrA20(:,:,3),qrB20(:,:,3),50,ss+3) myCmykQR33(k5a,2,qrA20(:,:,8),qrB20(:,:,8),50,ss+8)    myCmykQR33(k5a,3,qrA20(:,:,13),qrB20(:,:,13),50,ss+13) myCmykQR33(k5a,4,qrA20(:,:,18),qrB20(:,:,18),50,ss+18);
myCmykQR33(k5a,1,qrA20(:,:,4),qrB20(:,:,4),60,ss+4) myCmykQR33(k5a,2,qrA20(:,:,9),qrB20(:,:,9),60,ss+9)    myCmykQR33(k5a,3,qrA20(:,:,14),qrB20(:,:,14),60,ss+14) myCmykQR33(k5a,4,qrA20(:,:,19),qrB20(:,:,19),60,ss+19);
myCmykQR33(k5a,1,qrA20(:,:,5),qrB20(:,:,5),70,ss+5) myCmykQR33(k5a,2,qrA20(:,:,10),qrB20(:,:,10),70,ss+10) myCmykQR33(k5a,3,qrA20(:,:,15),qrB20(:,:,15),70,ss+15) myCmykQR33(k5a,4,qrA20(:,:,20),qrB20(:,:,20),70,ss+20)];

imwrite(res1,'test1210yA.tif');
imshow(imadjust(255-res1(:,:,4),[0.5 1],[0 1]));title('hidden QR');
imwrite(imadjust(255-res1(:,:,4),[0.5 1],[0 1]),'test1210yB.tif');