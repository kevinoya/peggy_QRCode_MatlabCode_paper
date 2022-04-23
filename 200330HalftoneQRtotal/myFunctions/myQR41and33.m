%
%  usage k22=myQR41and41(k3a,y41,qr33,key,bk);
%
%  input:  k3a : 165x165 image
%          y41 : 1st QR 41x41
%          qr33  : 2nd QR 33x33
%          key:  9 (for example)
%          bk: 0 or 1 (black or white background)
%
%  output:  k22  165x165 binary QR

function k22=myQR41and33(k3a,y41,qr33,key,bk);

hh=myQR33temp41(qr33);  % 33x33 --> expand to 41x41

%  TRANSFER FUNCTION
%
dd=28;  % clip upper/lower dd in grayscale
%
b0=[ones(1,dd)*dd dd:255-dd ones(1,dd)*(255-dd)];
b1=[ones(1,dd)*dd b0 ones(1,dd)*(255-dd)];   % 1 x (255+dd*2)
b2=conv2(b1,ones(1,dd)/dd,'same');
b=b2(dd+1:dd+256);
x1=mytransfer(k3a,b);  % using function "mytransfer.m"   165x165


% 製作圓形遮罩 165x165
%
t=-82:1:82;
dd=100;
[X,Y] = meshgrid(t/dd, t/dd);
B=0.8;
Z = (exp(-(X.^2 + Y.^2)/B^2));
Z1=Z/max(max(Z));
% k3=uint8(double(k3a).*Z1);
Z2=Z1>0.4;  % 165x165
Z3=logical(zeros(165+30,165+30));
Z3(30+1:30+165,30+1:30+165)=Z2;
Z4=conv2(double(Z3),ones(11,11)/121,'same');
Z5=Z4(30+1:30+165,30+1:30+165);      % <--------Mask

% 影像處理成漸層圓底 165x165
%
cc=bk*255;   %     <----------    255-> 白底    0 --> 黑底
w165=uint8(cc*ones(165,165)); %  
x=myBlendColorImages(x1,w165,Z5);
% k3=uint8(double(k3a).*double(Z5));
figure(1),
subplot(2,2,1),imshow(x1);
subplot(2,2,2),mesh(Z);
subplot(2,2,3),imshow(x);
% --------------------------------------- 2nd 影像前處理結束

s2=21;  t2=21; 
x4=x(s2+1:s2+123,t2+1:t2+123); % offset   取出其中 123x123 

% error diffusion + data hiding
%
%yc1=myFMDH123(x1,y41);
%
y123=uint8(2*ones(123,123));  %imresize(y41,3,'nearest');
y123(2:3:123,2:3:123)=uint8(y41);      %  <========= input 1st QR data 123x123  (????2  data 0 1)
%
y22=uint8(hh);   %  <=========  2nd QR data 41x41  (binary)
%
% key= 9;
rand('seed',key);               % <======  kEY
a1=uint8(ceil(rand(41,41)*8));
a2=a1+uint8(double(a1>=5));       % 1 2 3 4 6 7 8 9   (??3x3???? ???n????5?????m)  41x41 ?x?}
%a2=imresize(a1,3,'nearest'); %123*123
%


% --------------------------------- 原來的方法
%{
for i=1:41
for j=1:41
    mm=y123( (i-1)*3+1:i*3, (j-1)*3+1:j*3);
    mm(a2(i,j))=y22(i,j);
    y123( (i-1)*3+1:i*3, (j-1)*3+1:j*3)=mm;
end
end
%}
% ---------------------------------


mk=imread('41x41_72mask.tif');   % <------ 改進有mask 中心品質提高
nnn=0;
%
for i=1:41
for j=1:41
    %if mk(i,j)==0
        %nnn=nnn+1;
    mm=y123( (i-1)*3+1:i*3, (j-1)*3+1:j*3);
    mm(a2(i,j))=y22(i,j);
    y123( (i-1)*3+1:i*3, (j-1)*3+1:j*3)=mm;
    %else
        %nnn=nnn;
    %end
end
end

%  error diffusion + data hiding 
%
%      x4: 123x123 
%      y123: 123x123 
yc1=myFMDH123QR123(x4,y123);

k22=dither(x);  %  先對 165x165 FM
%
k22(s2+1:s2+123,t2+1:t2+123,:)=yc1;     % 加密123x123 置入


% 加入 finder pattern
%
m=3;   % module size 
%
p=ones(9,9);
p(2:8,2:8)=0;
p(3:7,3:7)=1;
p(4:6,4:6)=0;
p2=imresize(logical(p),m,'nearest');
%
q=zeros(5,5);
q(2:4,2:4)=1; 
q(3,3)=0;
q2=imresize(logical(q),m,'nearest');
%
s=s2;t=t2;
k22(s-m+1:s-m+9*m,t-m+1:t-m+9*m)=p2;   % 
k22(s-m+1:s-m+9*m,t-m+1+34*m:t-m+9*m+34*m)=p2;   % 
k22(s-m+1+34*m:s-m+9*m+34*m,t-m+1:t-m+9*m)=p2;   % 
k22(s-m+1+33*m:s-m+38*m,t-m+1+33*m:t-m+38*m)=q2;   % (5x5)