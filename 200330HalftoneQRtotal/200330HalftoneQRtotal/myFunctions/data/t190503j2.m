clear all;
%
%path(path,'C:\Users\HALFMEDIA\Desktop\18adm')
% path(path,'C:\Users\hsiwang\Desktop\190427photo')
 path(path,'..\190503photo')
%

y=imread('stamp30.jpg');    % 2480x3508x3  300dpi TEMPLATE  30枚郵票格式

 
a=0.1;    %  input image
%
k=imread('ntnu743x748.tif');           %        ntnu 建築
k30=imadjust(k,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]); % 調整
% 
k=imread('101.jpg'); 
k0=imadjust(k,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]); % 調整


TT=imread('test0424.tif');    %   郵票標題
Tadj=12;
TT1=TT(Tadj:92-Tadj,:);       % 數位影像加值應用
%
TT3=imread('Cap3.tif');       % 國立臺灣師範大學
TT5=imread('Cap5.tif');       % 周遵儒主任就職
TT7=imread('Cap7.tif');       % 白谷正治教授


m9=376.6;   % 左上角點 @ 30枚郵票格式
n9=282.4;

dat=uint8(zeros(756,567,3,30));
% fn='stamp190426.tif';
ss=1;
%
dat(:,:,:,1)=imresize(myModule756w(imread('00.JPG'),TT1,26),ss);
dat(:,:,:,2)=imresize(myModule756w(k0,TT1,27),ss);
dat(:,:,:,3)=imresize(myModule756w(k30,TT7,28),ss);
dat(:,:,:,4)=imresize(myModule756w(k30,TT5,29),ss);
dat(:,:,:,5)=imresize(myModule756w(k30,TT3,30),ss);
dat(:,:,:,6)=imresize(myModule756w(imread('01.JPG'),TT1,1),ss);
%
dat(:,:,:,7)= imresize(myModule756w(imread('02.jpg'),TT1,2),ss);
dat(:,:,:,8)= imresize(myModule756w(imread('03.JPG'),TT1,3),ss);
dat(:,:,:,9)= imresize(myModule756w(imread('04.JPG'),TT1,4),ss);
dat(:,:,:,10)=imresize(myModule756w(imread('05.JPG'),TT1,5),ss);
dat(:,:,:,11)=imresize(myModule756w(imread('06.JPG'),TT1,6),ss);
dat(:,:,:,12)=imresize(myModule756w(imread('07.JPG'),TT1,7),ss);
%
dat(:,:,:,13)=imresize(myModule756w(imread('08.JPG'),TT1,8),ss);
dat(:,:,:,14)=imresize(myModule756w(imread('09.JPG'),TT1,9),ss);
dat(:,:,:,15)=imresize(myModule756w(imrotate(imread('10.JPG'),-90),TT1,10),ss);
dat(:,:,:,16)=imresize(myModule756w(imread('11.JPG'),TT1,11),ss);
dat(:,:,:,17)=imresize(myModule756w(imrotate(imread('12.JPG'),-90),TT1,12),ss);
dat(:,:,:,18)=imresize(myModule756w(imread('13.JPG'),TT1,13),ss);
%
dat(:,:,:,19)=imresize(myModule756w(imread('14.JPG'),TT1,14),ss);
dat(:,:,:,20)=imresize(myModule756w(imread('15.JPG'),TT1,15),ss);
dat(:,:,:,21)=imresize(myModule756w(imread('16.JPG'),TT1,16),ss);
dat(:,:,:,22)=imresize(myModule756w(imread('17.JPG'),TT1,17),ss);
dat(:,:,:,23)=imresize(myModule756w(imread('18.JPG'),TT1,18),ss);
dat(:,:,:,24)=imresize(myModule756w(imread('19.JPG'),TT1,19),ss);
%
dat(:,:,:,25)=imresize(myModule756w(imread('20.JPG'),TT1,20),ss);
dat(:,:,:,26)=imresize(myModule756w(imread('21.JPG'),TT1,21),ss);
dat(:,:,:,27)=imresize(myModule756w(imread('22.JPG'),TT1,22),ss);
dat(:,:,:,28)=imresize(myModule756w(imread('23.JPG'),TT1,23),ss);
dat(:,:,:,29)=imresize(myModule756w(imrotate(imread('24.JPG'),-90),TT1,24),ss);
dat(:,:,:,30)=imresize(myModule756w(imread('25.JPG'),TT1,25),ss);
%
%
