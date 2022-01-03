%  myQRadj5.m    對灰階影像作加密  (輸出不要有finder pattern)  2017-05-12
%   
%   input:   x:      492x492 gray image;  
%            y41:    41x41 QRcode (binary)
%            d9:     加密強度 
%   output:  492x492 加密影像


function res=myQRadj3(x,y41,d9);


% ---------------------------------------------
%  TRANSFER FUNCTION
%
dd=28;  % clip upper/lower dd in grayscale
%
b0=[ones(1,dd)*dd dd:255-dd ones(1,dd)*(255-dd)];
b1=[ones(1,dd)*dd b0 ones(1,dd)*(255-dd)];   % 1 x (255+dd*2)
b2=conv2(b1,ones(1,dd)/dd,'same');
b=b2(dd+1:dd+256);
x1=mytransfer(x,b);  % using function "mytransfer.m"
%figure(3),imshow(x1);
x1s=x1;


% 估計 threshold 
%
m60=ones(60,60)/3600;    % 12x12 5x5  ->  60x60
x1s9=[fliplr(flipud(x1s))  flipud(x1s)  fliplr(flipud(x1s));
    fliplr(x1s) x1s fliplr(x1s);
    fliplr(flipud(x1s))  flipud(x1s)  fliplr(flipud(x1s))];  % 外擴 3x3
x2s9=conv2(double(x1s9),m60,'same');
x2sp=x2s9(492+1:492+492,492+1:492+492);
thr=x2sp(6:12:492,6:12:492);  % 41x41 double


% 加密影像 處理
%
x1(6:12:492,6:12:492)=thr+sign(double(y41)-0.5)*d9;  % 中心區 (12) adaptive 加密 (不要全黑 全白)
x1(6:12:492,7:12:492)=thr+sign(double(y41)-0.5)*d9;
x1(7:12:492,6:12:492)=thr+sign(double(y41)-0.5)*d9;
x1(7:12:492,7:12:492)=thr+sign(double(y41)-0.5)*d9;
%
x1(5:12:492,6:12:492)=thr+sign(double(y41)-0.5)*d9;
x1(5:12:492,7:12:492)=thr+sign(double(y41)-0.5)*d9;
x1(6:12:492,5:12:492)=thr+sign(double(y41)-0.5)*d9;
x1(6:12:492,8:12:492)=thr+sign(double(y41)-0.5)*d9;
x1(7:12:492,5:12:492)=thr+sign(double(y41)-0.5)*d9;
x1(7:12:492,8:12:492)=thr+sign(double(y41)-0.5)*d9;
x1(8:12:492,6:12:492)=thr+sign(double(y41)-0.5)*d9;
x1(8:12:492,7:12:492)=thr+sign(double(y41)-0.5)*d9;
%
%
error=zeros(492,492);    % 計算這12個位置之error
error(6:12:492,6:12:492)= double(x1s(6:12:492,6:12:492))-double(x1(6:12:492,6:12:492));
error(6:12:492,7:12:492)= double(x1s(6:12:492,7:12:492))-double(x1(6:12:492,7:12:492));
error(7:12:492,6:12:492)= double(x1s(7:12:492,6:12:492))-double(x1(7:12:492,6:12:492));
error(7:12:492,7:12:492)= double(x1s(7:12:492,7:12:492))-double(x1(7:12:492,7:12:492));
%
dat=[5 6; 5 7; 6 5; 6 8; 7 5; 7 8; 8 6; 8 7];
for i=1:8
    m=dat(i,1);n=dat(i,2);
    error(m:12:492,n:12:492)= double(x1s(m:12:492,n:12:492))-double(x1(m:12:492,n:12:492));
end


mask=ones(12,12);      % 製作error diffusion mask weighting (to 12x12-12)
mask(2:11,2:11)=2;
mask(3:10,3:10)=3;
mask(4:9,4:9)=4;
mask(5,5:3:8)=5;
mask(8,5:3:8)=5;
%
mask(5,6:7)=0;
mask(6,5:8)=0;
mask(7,5:8)=0;
mask(8,6:7)=0;
mask1=mask/sum(sum(mask));


error1=conv2(error,mask1,'same');
x2=double(x1)+error1;
res=uint8(x2);
%subplot(1,2,1),imshow(x1s);
%subplot(1,2,2),imshow(res);

