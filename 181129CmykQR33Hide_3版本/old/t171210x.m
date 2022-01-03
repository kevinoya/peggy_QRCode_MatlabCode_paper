k5a=imread('inputColor660.tif');
qr1=imread('33aQRbin.tif');
qr2=imread('33bQRbin.tif');
ss=1805120;

res1=[
myCmykQR33(k5a,1,qr1,qr2,30,ss+1) myCmykQR33(k5a,2,qr1,qr2,30,ss+6)  myCmykQR33(k5a,3,qr1,qr2,30,ss+11) myCmykQR33(k5a,4,qr1,qr2,30,ss+16);
myCmykQR33(k5a,1,qr1,qr2,40,ss+2) myCmykQR33(k5a,2,qr1,qr2,40,ss+7)  myCmykQR33(k5a,3,qr1,qr2,40,ss+12) myCmykQR33(k5a,4,qr1,qr2,40,ss+17);
myCmykQR33(k5a,1,qr1,qr2,50,ss+3) myCmykQR33(k5a,2,qr1,qr2,50,ss+8)  myCmykQR33(k5a,3,qr1,qr2,50,ss+13) myCmykQR33(k5a,4,qr1,qr2,50,ss+18);
myCmykQR33(k5a,1,qr1,qr2,60,ss+4) myCmykQR33(k5a,2,qr1,qr2,60,ss+9)  myCmykQR33(k5a,3,qr1,qr2,60,ss+14) myCmykQR33(k5a,4,qr1,qr2,60,ss+19);
myCmykQR33(k5a,1,qr1,qr2,70,ss+5) myCmykQR33(k5a,2,qr1,qr2,70,ss+10) myCmykQR33(k5a,3,qr1,qr2,70,ss+15) myCmykQR33(k5a,4,qr1,qr2,70,ss+20)];

imwrite(res1,'test1210.tif');
imshow(imadjust(255-res1(:,:,4),[0.5 1],[0 1]));title('hidden QR');
imwrite(imadjust(255-res1(:,:,4),[0.5 1],[0 1]),'test1210b.tif');