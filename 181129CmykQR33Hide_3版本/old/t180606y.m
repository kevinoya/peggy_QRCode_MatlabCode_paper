% k5a=imread('inputColor660.tif');
k5a=imread('ntnuLogoColor660B.tif');
qr1=imread('m180111.tif');
qr2=imread('hml33.tif');
%load qrA20;
%load qrB20;
ss=1806070;

res1_120=[myCmykQR33_180514(k5a,4,qr1,qr2,30,ss+3)];

%{
 res1_120=[myCmykQR33_180607(k5a,4,qr1,qr2,30,ss+3);
           myCmykQR33_180607(k5a,4,qr1,qr2,40,ss+4);
           myCmykQR33_180607(k5a,4,qr1,qr2,50,ss+5);
           myCmykQR33_180607(k5a,4,qr1,qr2,60,ss+6) ];
%}

%{
res1=[
myCmykQR33_180514(k5a,1,qr1,qr2,30,ss+1)    myCmykQR33_180514(k5a,2,qr1,qr2,30,ss+2)    myCmykQR33_180514(k5a,3,qr1,qr2,30,ss+3)   myCmykQR33_180514(k5a,4,qr1,qr2,30,ss+4);
myCmykQR33_180514(k5a,1,qr1,qr2,40,ss+5)    myCmykQR33_180514(k5a,2,qr1,qr2,40,ss+6)    myCmykQR33_180514(k5a,3,qr1,qr2,40,ss+7)   myCmykQR33_180514(k5a,4,qr1,qr2,40,ss+8);
myCmykQR33_180514(k5a,1,qr1,qr2,50,ss+9)    myCmykQR33_180514(k5a,2,qr1,qr2,50,ss+10)   myCmykQR33_180514(k5a,3,qr1,qr2,50,ss+11)   myCmykQR33_180514(k5a,4,qr1,qr2,50,ss+12);
myCmykQR33_180514(k5a,1,qr1,qr2,60,ss+13)   myCmykQR33_180514(k5a,2,qr1,qr2,60,ss+14)   myCmykQR33_180514(k5a,3,qr1,qr2,60,ss+15)   myCmykQR33_180514(k5a,4,qr1,qr2,60,ss+16);
myCmykQR33_180514(k5a,1,qr1,qr2,70,ss+17)   myCmykQR33_180514(k5a,2,qr1,qr2,70,ss+18)   myCmykQR33_180514(k5a,3,qr1,qr2,70,ss+19)   myCmykQR33_180514(k5a,4,qr1,qr2,70,ss+20);
myCmykQR33_180514(k5a,1,qr1,qr2,80,ss+21)   myCmykQR33_180514(k5a,2,qr1,qr2,80,ss+22)   myCmykQR33_180514(k5a,3,qr1,qr2,80,ss+23)   myCmykQR33_180514(k5a,4,qr1,qr2,80,ss+24);
myCmykQR33_180514(k5a,1,qr1,qr2,90,ss+25)   myCmykQR33_180514(k5a,2,qr1,qr2,90,ss+26)   myCmykQR33_180514(k5a,3,qr1,qr2,90,ss+27)   myCmykQR33_180514(k5a,4,qr1,qr2,90,ss+28);
myCmykQR33_180514(k5a,1,qr1,qr2,100,ss+29)  myCmykQR33_180514(k5a,2,qr1,qr2,100,ss+30)  myCmykQR33_180514(k5a,3,qr1,qr2,100,ss+31)  myCmykQR33_180514(k5a,4,qr1,qr2,100,ss+32);
myCmykQR33_180514(k5a,1,qr1,qr2,110,ss+33)  myCmykQR33_180514(k5a,2,qr1,qr2,110,ss+34)  myCmykQR33_180514(k5a,3,qr1,qr2,110,ss+35)  myCmykQR33_180514(k5a,4,qr1,qr2,110,ss+36);
myCmykQR33_180514(k5a,1,qr1,qr2,120,ss+37)  myCmykQR33_180514(k5a,2,qr1,qr2,120,ss+38)  myCmykQR33_180514(k5a,3,qr1,qr2,120,ss+39)  myCmykQR33_180514(k5a,4,qr1,qr2,120,ss+40)];  
%}

imwrite(res1_120,'test18610yA_2.tif','Resolution',600);
imshow(imadjust(255-res1_120(:,:,4),[0.5 1],[0 1]));title('hidden QR');
%imwrite(imadjust(255-res1(:,:,4),[0.5 1],[0 1]),'test180418yB.tif','Resolution',600);