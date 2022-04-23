function data=myLaserPerfRecog(y5b,xy,uv);

%uv1=[dat2(:,2) dat2(:,1)];  % uv 及 ij 要倒過來
uv1=uv;
%
%   U=A*X
%                                  1  1  1  1
%   U=[ u1 u2 u3 u4 ]       X =[  x1 x2 x3 x4 ]
%       v1 v2 v3 v4               y1 y2 y3 y4
U=uv1';
X=[ones(1,4); xy'];
A=U*X'*inv(X*X');

% calculating new positions in UV coordinates
%

newuv=[];
for nx=2/3 : 1/3 : 41+1/3
    for ny=2/3 : 1/3 : 41+1/3
        uv=A*[1; nx; ny];
        newuv=[newuv; [uv(1) uv(2)]];
    end
end
%
figure(3),imshow(y5b);title('sampling points');
hold;
plot(newuv(:,1),newuv(:,2),'r.');
plot(uv1(:,1),uv1(:,2),'b+');
hold;


% displaying decoded image
[m1 n1]=size(y5b);
%  decoding the data
%
cc=1;    % 0 -> 1x1 sampling      1-> 3x3 sampling
ccc=2*cc+1;
%
dd=28;
ddd=2*dd+1;
kk=zeros(41*3,41*3);
kkT=zeros(41*3,41*3);
%for ny=1 : 1 : 41
 %   for nx=1 : 1 : 41
for ny=1-1/3 : 1/3 : 41+1/3
   for nx=1-1/3 : 1/3 : 41+1/3
    uv=A*[1; nx; ny];
  if (uv(2)>0.5)&(uv(2)<m1)&(uv(1)>0.5)&(uv(1)<n1)
      ny1=round(ny*3-1);
      nx1=round(nx*3-1);
    %kk(ny,nx)=y5b(round(uv(2)),round(uv(1)));
    kk(ny1,nx1)=sum(sum(y5b(round(uv(2))-cc:round(uv(2))+cc, round(uv(1))-cc:round(uv(1))+cc )))/ccc/ccc;
    kkT(ny1,nx1)=sum(sum(y5b(round(uv(2))-dd:round(uv(2))+dd, round(uv(1))-dd:round(uv(1))+dd )))/ddd/ddd;
  else
    kk(round(ny1),round(nx1))=0;
  end
     end
end
figure(10),imshow(uint8(kkT));
 kk1=kk;
%imwrite(uint8(kk1),'decode image41.tif')　%kk1是41x41QRcode上下顛倒
%
figure(4),imhist(uint8(kk1));title('histogram');

%th=128;
th=kkT;
 %th=140;
%可調整th數值 %解得隱藏之QRcode
%
% figure(5),imshow(uint8(kk1)>th);title('decode data 41x41');axis('xy');
figure(5),imshow(kk1>th);title('decode data 41x41');axis('xy');
% decoded iamge(uint8(kk1)>th)要存檔的話, 記得做鏡像轉正
%mirror;
%
data=flipud(kk1<th);  % 123x123 calculated data

