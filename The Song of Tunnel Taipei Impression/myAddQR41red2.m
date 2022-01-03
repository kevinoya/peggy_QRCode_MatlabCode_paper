%  ï¿½mï¿½ï¿½Bï¿½z    from t190123r.m   t190516r.m
%
%  input: k0  colorimage
%         qr41  41x41 qr binary
%         ii,jj   position of UL corner of QR 41
%         d9   embedding intensity

 function k2=myAddQR41(k1,y41,ii,jj,d9);

m=12;  % module size


%  ï¿½sï¿½@ï¿½~ï¿½ï¿½vï¿½ï¿½
%

[n1 n2 n3]=size(k1);

%s=xx ; t=xxx; %ï¿½ï¿½ï¿½ï¿½QR codeï¿½ï¿½m / s=ï¿½Wï¿½U / t=ï¿½ï¿½ï¿½k
 s=ii;  t=jj;

 
%  crop 492x492
%
xR=k1(s+1:s+492,t+1:t+492,1);
xG=k1(s+1:s+492,t+1:t+492,2);
xB=k1(s+1:s+492,t+1:t+492,3);


%  ï¿½Ó¤JQRï¿½ï¿½ï¿?
%
% d9=70;  % ï¿½[ï¿½Kï¿½jï¿½ï¿½
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



%  TRANSFER FUNCTION  ï¿½ï¿½ï¿½Nï¿½ï¿½iï¿½ï¿½ï¿½ï¿½ï¿½Õ½Õ¾ï¿½
%
dd=1;  % clip upper/lower dd in grayscale
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


% ï¿½ï¿½ï¿½J graphic QR (492x492)
%
%y=imread('tempC.tif');
% k2(s+1:s+492,t+1:t+492,:)=res;
k2(s+1:s+492,t+1:t+492,:)=res;

factor=1;
% [ 214 160 171]
ff=1;
fR=0/ff; fG=0/ff; fB=0/ff;
% ï¿½[ finder pattern (red) ?”¹é¡è‰²
%
white9=255*ones(9,9,3)*factor;
red9=zeros(9,9,3);
%red9(:,:,1)=255; 
red9(:,:,1)=fR; 
red9(:,:,2)=fG; 
red9(:,:,3)=fB; 
%
p=ones(9,9,3);
p(2:8,2:8,:)=0;
p(3:7,3:7,:)=1;
p(4:6,4:6,:)=0;
%p1=uint8(p*255);
p1=myBlendColorImages(white9,red9,p(:,:,1));
p2=imresize(p1,m,'nearest');


white5=255*ones(5,5,3)*factor;
red5=zeros(5,5,3);
%red5(:,:,1)=255;
red5(:,:,1)=fR; 
red5(:,:,2)=fG; 
red5(:,:,3)=fB; 
%
q=zeros(5,5,3);
q(2:4,2:4,:)=1; 
q(3,3,:)=0;
%q1=uint8(q*255);
q1=myBlendColorImages(white5,red5,q(:,:,1));
q2=imresize(q1,m,'nearest');

m=12;   % module size 
k2(s-m+1:s-m+9*m,t-m+1:t-m+9*m,:)=p2;   % ï¿½ï¿½ï¿½W
k2(s-m+1:s-m+9*m,t-m+1+34*m:t-m+9*m+34*m,:)=p2;   % ï¿½kï¿½W
k2(s-m+1+34*m:s-m+9*m+34*m,t-m+1:t-m+9*m,:)=p2;   % ï¿½ï¿½ï¿½U
k2(s-m+1+33*m:s-m+38*m,t-m+1+33*m:t-m+38*m,:)=q2;   % ï¿½kï¿½U (5x5)
%


