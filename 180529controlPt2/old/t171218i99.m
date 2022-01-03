% auto find control point + 解密彩色圖像化 QR   2017-12-18
%

%y5a=imread('sample.tif');    %  input print-and-scan image
%y5=imread('test13x.jpg');
% y5=imread('scan1part.jpg');
y5=imread('171218scan.jpg');
 y5a=rgb2gray(y5(:,1:700,:));   % 抓第一章影像
 y5a=rgb2gray(y5(:,701:1400,:));   % 抓第2章影像
 y5a=rgb2gray(y5(:,1401:2100,:));   % 抓第3章影像
 %y5a=rgb2gray(y5(:,end-700:end,:));  % 抓第4章影像


load qrA20;           % load  QR 原始data
 t32dat=qrA20(:,:,1);  % 1st
 t32dat=qrA20(:,:,6);  % 2nd
 t32dat=qrA20(:,:,11);  % 3rd
 %t32dat=qrA20(:,:,16); % 4th


[y5b,dat]=myFindQR33(y5a);   % 前處理影像 及 找到4組控制點

% control points
%  (QR module coordinate)
%    x  y            
xy=[ 4  4;    %  p1      y |  p4   p3
     27 7;    %  p2        |
    30 30;    %  p3        |  p1   p2
     4 30];   %  p4        +-------->  x
% 
%  (image coordinate)
%   u       v                  +---------> u
%uv=[233.6  359.6;  % p1       |   p4    p3
%    379.5  371.5   % p2       |
%    349.6  226.4;  % p3       |   p1    p2  
%    225.6  235.6]; % p4       v 
uv=[dat(:,2) dat(:,1)];  % uv 及 ij 要倒過來

%figure(1),imshow(d);hold;plot(uv(:,1),uv(:,2),'+');hold;

%   U=A*X
%                                  1  1  1  1
%   U=[ u1 u2 u3 u4 ]       X =[  x1 x2 x3 x4 ]
%       v1 v2 v3 v4               y1 y2 y3 y4
U=uv';
X=[ones(1,4); xy'];
A=U*X'*inv(X*X');


% calculating new positions in UV coordinates (99x99)
%

newuv=[];
for nx=2/3 : 1/3 : 33+1/3
    for ny=2/3 : 1/3 : 33+1/3
        uv=A*[1; nx; ny];
        newuv=[newuv; [uv(1) uv(2)]];
    end
end
figure(2),imshow(y5b);hold;plot(newuv(:,1),newuv(:,2),'r.');hold;
 

% displaying decoded image  (99x99)
%
kk=zeros(99,99);
[m1 n1]=size(y5b);
for ny=2/3 : 1/3 : 33+1/3
    for nx=2/3 : 1/3 : 33+1/3
    uv=A*[1; nx; ny];
  if (uv(2)>0.5)&(uv(2)<m1)&(uv(1)>0.5)&(uv(1)<n1)
    kk(round(ny*3-1),round(nx*3-1))=y5b(round(uv(2)),round(uv(1)));
  else
    kk(round(ny*3-1),round(nx*3-1))=0;
  end
     end
end
 
figure(3),imshow(uint8(kk));title('decoded image');axis('xy'); % 99x99
kk1=kk(2:3:99,2:3:99); % 33x33

figure(4),imshow(uint8(kk)>128);title('decode data');axis('xy');

figure(5),imhist(uint8(kk1));title('histogram');

data0=flipud(uint8(kk)>128);  % 99x99 calculated data
data=data0(2:3:99,2:3:99);    % 33x33
figure(6),imshow(data);

recognition=sum(sum(data==t32dat))/33/33
figure(7),imshow(data==t32dat);title('error map');

%zz=myDecodeKey(data0,9);
%figure(7),imshow(zz);title('decoded 2nd QR');



