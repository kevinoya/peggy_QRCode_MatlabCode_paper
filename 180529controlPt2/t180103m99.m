% auto find control point + 解密IR/QR 33x33   2017-12-29
%

%                           input print-and-scan image  5x4
y5=imread('L180103_3.jpg');
 ie=213+660+660+660+660;je=196+660;  % 影像左上角點位置  L171227.jpg
% ie=645;je=350;  % 影像左上角點位置
%
ii=1; jj=1;         % <========== 選取位置
%
 y5a=(rgb2gray(y5(ie+1+(ii-1)*660:ie+ii*660,je+1+(jj-1)*660:je+jj*660,:)));   % 抓第一章影像

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

%  figure(1),imshow(y5b);hold;plot(uv(:,1),uv(:,2),'+');hold;

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
 
% figure(3),imshow(uint8(kk));title('decoded image');axis('xy'); % 99x99
kk1=kk(2:3:99,2:3:99); % 33x33

% figure(4),imshow(uint8(kk)>128);title('decode data');axis('xy');

% figure(5),imhist(uint8(kk1));title('histogram');

data0=flipud(uint8(kk)>128);  % 99x99 calculated data
data=data0(2:3:99,2:3:99);    % 33x33
%figure(6),imshow(data);


t=imread('L52.png');           % original QR data
t1=(t==0);
t2=imresize(t1,[37,37]);
t3=t2(3:35,3:35);
% imshow(t3);

recognition=sum(sum(data==t3))/33/33
%figure(2),imshow(data==t3);title('error map');


% imwrite(data==t3,'error.tif');
