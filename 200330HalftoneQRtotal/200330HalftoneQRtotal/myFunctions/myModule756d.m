%  製作外顯影像   自動切為  756x567 郵票單元
%  
%  input: k0 : rgb image 
%         title: binary image (主姓名)
%         nnn : 第幾人
%          y41: QR41 data (binary)
%           d9: embedding intensity    
%
%  output: res3: 708x708 rgb 
%
% clear all;

 function k11=myModule756c(k0,title,nnn,y41,d9);

 %{
k0=k10;
title=imread('cap11.tiff');
nnn=28;
 %}
 
%k0=imread('ntnu743x748.tif');
% k0(:,1:8,:)=[];
 %title=imread('test0424.tif');
 %nnn=2;
%


vv=600;  % output dimension ==> image part
% hh=472;
hh=516;
%
k0=myCrop(k0,vv,hh);   % crop image sized into vv x hh
k1=myAddQR41r(k0,y41,12*3,12,d9);   % 600*516*3 <======= QR rotate 90
k1(:,1:12,:)=uint8(255*ones(600,12,3));   % remove left &right
k1(:,end-11:end,:)=uint8(255*ones(600,12,3));

% tt=36;
% k4=imresize(k1,[566+tt,600]);  % 566x600x3 image
%k4(:,1:72,:)=255;
% k4(:,600-72+1:600,:)=255;
v9=20;
k5=uint8(255*ones(708,708,3));
tt=(708-516)/2;
k5(1+v9:vv+v9,tt+1:tt+hh,:)=k1;


y2a=title;                     % 直接input 大標題 (binary)
% y2=imresize(y2a,[90 321]);
y2=imresize(y2a(:,:,1),[90 321]);
y3=imresize(y2,1);
[m1 n1 ]=size(y3);
%
y3r=y3;
ss2=600-15;tt2=40+72;
y4=logical(zeros(708,708));
y4(ss2+1:ss2+m1,tt2+1:tt2+n1)=y3r;   % 708x708
 
 
%
 %年代遮罩 (2019)
%
aa=logical(zeros(400,400,10));
for i=0:9
    a=imread(['h',num2str(i),'.tif']);
    aa(:,:,i+1)=rot90(a);
end
d1=2;
d2=0;
d3=1;
d4=9;
s7=91;
s8=310;
a1=[aa(:,s7:s8,d1+1) aa(:,s7:s8,d2+1) aa(:,s7:s8,d3+1) aa(:,s7:s8,d4+1)];
% imshow(a1);
%
yr=~a1;    % 400x880
yr0=uint8(255*double(yr));
% yr1=imresize(((rot90(yr0))),0.08);  % 40x88
yr1=imresize(((rot90(yr0))),0.07);  % 40x88  uint8
% yr2=yr1>128;
[m7 n7]=size(yr1);
%
%m2018=logical(zeros(708,708));   % for "2017" mask
m2018=uint8(zeros(708,708));

 vv=510;hh=35+72;    %<<<<<<< 微調位置
% vv=600-50;hh=600-35;
%m2018(vv+1:vv+m7,hh+1:hh+n7)=yr2;
m2018(vv+1:vv+m7,hh+1:hh+n7)=yr1;    % uint8
%imshow(m2018);                   % 708x708
%

%
%  加入名字
%
%nn=3;
file='name30.tif';
u=imread(file);
num=str2num(file(5:6));
[m7 n7]=size(u);
m77=m7/num;
u2=u(round((nnn-1)*m77+1):round(nnn*m77),1:184+20);   % 53x221
u3a=imresize(u2,1.5);
u3=u3a(:,132:end);
[m3 n3]=size(u3);
% 
vv1=615;
%hh1=385+56-30;
hh1=385+56;

%
m2018b=double(m2018)/255;
m2018b(vv1+1:vv1+m3,hh1+1:hh1+n3) =(1-double(u3)/255);


%imshow(u2);
% 設計紅底白字區
%
red=uint8(ones(708,708,3)*255);
red(:,:,1)=174;% red
red(:,:,2)=33;
red(:,:,3)=32;
%
blank=uint8(ones(708,708,3)*255);
%
res1=myBlendColorImages(red,blank,~y4);  % 紅底白字
%
%imwrite(res1,'testCombo2.tif');


% 設計新mask
%
m2=zeros(708,708);
%t=1:708;
%a=cos(t/1100*pi);   % 1x708
%a1=a>1;
%a2=a.*double(~a1)+double(a1);
a9=0.995:-0.005:0;     % 1x200
a=[ones(1,350) a9 zeros(1,708-550)];
%{
gra=1:-1/119:0;
a0=[ones(1,580) gra zeros(1,55)];
a=fliplr(a0);
%}
%w=60; 
w=100;
b=ones(1,w);  % 1 x w
c=a'*b; % 708 x w
ee=580;
m2(:,ee+1:ee+w)=c;
%figure(3),imshow(uint8(m2*255));
%


%  合成影像
%
res2=myBlendColorImages(res1,k5,m2');
% imwrite(res2,'test14i.tif');
%

res2(:,1:30+72-5,:)=255;

black1=uint8(zeros(708,708,3));  % 加入年代 姓名
res3=myBlendColorImages(res2,black1,1-(m2018b));

k1=res3;
k1(:,end-70:end,:)=[];   % cut right 71          調整為
k1(:,1:70,:)=[];    % cut left 71          <==== 708x567x3
%
k11=uint8(255*ones(756,567,3));
k11(24+1:24+708,:,:)=k1;

%{

black1=uint8(zeros(708,708,3));
% res3=myBlendColorImages(res2,black1,1-double(m2018b)/255);
res3=myBlendColorImages(res2,black1,1-(m2018b));
part=res3(20+1:20+660,92:589,:);
[m7 n7 p7]=size(part);   % 660x498*3
%
h9=-10;
res4=uint8(255*ones(756,567,3));   % 圖幅往右上修正
ss=round((756-m7)/2);tt=round((567-498)/2);  
res4(ss+1:ss+m7,h9+tt+1:h9+tt+n7,:)=part;
res5=myAddNTNUtext(res4);    %     <===== 加入左邊文字
% imwrite(res4,'res4.tif');
%}
 % imshow(res3);