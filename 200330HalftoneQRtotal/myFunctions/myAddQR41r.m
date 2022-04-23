%  彩色處理    from t190123r.m   t190516r.m
%
%  input: k0  colorimage
%         qr41  41x41 qr binary
%         ii,jj   position of UL corner of QR 41
%         d9   embedding intensity

 function k2=myAddQR41r(k1,y41,ii,jj,d9);

m=12;  % module size


%  製作外顯影像
%

[n1 n2 n3]=size(k1);

%s=xx ; t=xxx; %移動QR code位置 / s=上下 / t=左右
 s=ii;  t=jj;

 
%  crop 492x492
%
xR=k1(s+1:s+492,t+1:t+492,1);
xG=k1(s+1:s+492,t+1:t+492,2);
xB=k1(s+1:s+492,t+1:t+492,3);

xR=imrotate(xR,90);
xG=imrotate(xG,90);
xB=imrotate(xB,90);

%  植入QR資料
%
% d9=70;  % 加密強度
%
resR=myQRadj492(xR,y41,d9);
resG=myQRadj492(xG,y41,d9);
resB=myQRadj492(xB,y41,d9);
%
res=uint8(zeros(492,492,3));
res(:,:,1)=resR;
res(:,:,2)=resG;
res(:,:,3)=resB;
%



%  TRANSFER FUNCTION  先將整張做階調調整
%
dd=28;  % clip upper/lower dd in grayscale
%
b0=[ones(1,dd)*dd dd:255-dd ones(1,dd)*(255-dd)];
b1=[ones(1,dd)*dd b0 ones(1,dd)*(255-dd)];   % 1 x (255+dd*2)
b2=conv2(b1,ones(1,dd)/dd,'same');
b=b2(dd+1:dd+256);
k2r=mytransfer(k1(:,:,1),b);  % using function "mytransfer.m"
k2g=mytransfer(k1(:,:,2),b);
k2b=mytransfer(k1(:,:,3),b);
k2=uint8(zeros(n1, n2,3));
k2(:,:,1)=k2r;
k2(:,:,2)=k2g;
k2(:,:,3)=k2b;


% 插入 graphic QR (492x492)
%
%y=imread('tempC.tif');
 k2(s+1:s+492,t+1:t+492,:)=res;
k3=k2;  % remember the original data

% 加 finder pattern
%
p=ones(9,9,3);
p(2:8,2:8,:)=0;
p(3:7,3:7,:)=1;
p(4:6,4:6,:)=0;
p1=uint8(p*255);
p2=imresize(p1,m,'nearest');

q=zeros(5,5,3);
q(2:4,2:4,:)=1; 
q(3,3,:)=0;
q1=uint8(q*255);
q2=imresize(q1,m,'nearest');

m=12;   % module size 
k2(s-m+1:s-m+9*m,t-m+1:t-m+9*m,:)=p2;   % 左上
k2(s-m+1:s-m+9*m,t-m+1+34*m:t-m+9*m+34*m,:)=p2;   % 右上
k2(s-m+1+34*m:s-m+9*m+34*m,t-m+1:t-m+9*m,:)=p2;   % 左下
k2(s-m+1+33*m:s-m+38*m,t-m+1+33*m:t-m+38*m,:)=q2;   % 右下 (5x5)

k2(s+1:s+492,t+1:t+492,:)=imrotate(k2(s+1:s+492,t+1:t+492,:),-90);
%
% post-processing
n1=12*(3+41);n2=12;
k2(n1+1:n1+12,n2+1:n2+12*8,:)=k3(n1+1:n1+12,n2+1:n2+12*8,:);
n3=12*(41-7);
k2(n1+1:n1+12,n3+1:n3+12*8,:)=uint8(255*ones(12,12*8,3));

