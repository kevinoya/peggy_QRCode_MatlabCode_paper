%
% line 94、95 有指定QRcode點位需要用到的檔案，我猜應該是定位QRCode定位點用的
% binL=imread('binQR49_660.tif');
% LL=imread('QRfinderColor_v8.tif'); 


function res=myCmykQR33(k5a,n,qr1,qr2,S,ss);
% input:   k5a : 660x660x3 RGB color image
%          n   :  error mask   n=1,2,3,4  -->  12 16 20 24  / 144   不同的加密區域比率
%          qr1 : 外顯QR
%          qr2 : 內藏 IR QR
%          S : IR 強度 (30-70)
%          ss : 序號 (7位數 只顯示後 6位)

inputErrorMask6x6;  % 得到 m4 (6x6x4)
% n=1;  % n=1,2,3,4  -->  12 16 20 24  / 144   不同的加密區域比率
m7=m4(:,:,n);

y49=qr1;

aa=(660-588)/2;
k5=k5a(aa+1:aa+588,aa+1:aa+588,:);   % 只抓出 396x396 做加密處理
zz=myQR33HideColorB_181128v8(k5,y49,m7);   % <=====  主要處理程序
%
k5a(aa+1:aa+588,aa+1:aa+588,:)=zz;

b=k5a;  % 660x660x3  RGB 加密影像
b1=uint8(zeros(660,660,4));
b1(:,:,1:3)=255-b;        % 產生 660x660x4  CMYK 加密影像 (K 無訊號)

% S=40;                                % IR 強度
% a0=imread('33bQRbin.tif');  % 33x33 binary
a0=qr2;
a1=imresize(a0,12,'nearest');
a=ones(660,660);
b=36;
a(b+1:b+588,b+1:b+588)=a1;

jj=0;                 % 加序號
str=num2str(jj+ss);
%
qq1=imread(['h',str(1),'.tif']);
qq2=imread(['h',str(2),'.tif']);
qq3=imread(['h',str(3),'.tif']);
qq4=imread(['h',str(4),'.tif']);
qq5=imread(['h',str(5),'.tif']);
qq6=imread(['h',str(6),'.tif']);
qq7=imread(['h',str(7),'.tif']);
%
q1=qq1(95:304,50:339); 
q2=qq2(95:304,50:339);
q3=qq3(95:304,50:339);
q4=qq4(95:304,50:339);
q5=qq5(95:304,50:339);
q6=qq6(95:304,50:339);
q7=qq7(95:304,50:339);
%
mm1=[q1;q2;q3;q4;q5;q6;q7];  % 1470x290   7位數序號
mm2=imresize(mm1,[260 35]); 
mm3=rot90(mm2);              % 116*588
% aa=540; bb=200;
aa=510; bb=185;
%cym=imread('ntnu256.tif');
%cym2=imresize(cym,[40,40]);
cym2=logical(ones(35,35));
a(aa+1:aa+35, bb+1:bb+260)=mm3;
a(aa+1:aa+35, bb+1:bb+35)=cym2;
%
d=uint8(zeros(660,660,4));  % 設 CMYK 區域
for i=1:3
    d(:,:,i)=uint8(double(a)*S);
end
d(:,:,4)=uint8(double(~a)*S);
% imwrite(d,'test1208a.tif');    % 平緩的CMYK image


c=uint8(b1+d);  % 合成
% imwrite(c,'test1209CMYK.tif');
% imshow(imadjust(255-c(:,:,4)));title('hidden QR');


B=1.8;  %   設計圓漸層
inputCircle;  % 得到  Z5  mask (660x660)
%
w660=uint8(zeros(660,660,4));   % 處理為圓底
k2=myBlendColorImages(c,w660,Z5);
% k3=uint8(double(k3a).*double(Z5));
% imwrite(k2,'CMYKimageO.tif');


% qrf=imread('QRfinderCMYK.tif');    % 加 QR 框
% mask=imread('binQR33_660.tif');
% res=myBlendColorImages(k2,qrf,~mask);
binL=imread('binQR49_660.tif');
LL=imread('QRfinderColor_v8.tif');  % 黑白
LL1=LL(:,:,1)==0;  % binary
% myBlank=ones(660,660,4)*255;
myBlank=zeros(660,660,4);
myBlank(:,:,2)=255;
myBlank(:,:,3)=255;
myBlank(:,:,4)=128;
myRed=zeros(660,660,4);
%myRed(:,:,2)=0;
LL2=myBlendColorImages(uint8(myBlank),uint8(myRed),LL1);
% imshow(LL2);
%
res=myBlendColorImages(k2,LL2,~binL);   % 得到 紅色 QR finder
% imwrite(res,'test1209w.tif');
% clf;
% imshow(imadjust(255-res(:,:,4),[0.5 1],[0 1]));title('hidden QR');
