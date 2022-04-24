clear all;
%
% path(path,'C:\Users\HALFMEDIA\Desktop\NTUphotos\180315NTUphoto70Wang1800')
path(path,'C:\Users\HALFMEDIA\Desktop\18adm')
%
y=imread('stamp30.jpg');    % 2480x3508x3  300dpi TEMPLATE
%

% x=myModule756ntnu(k0,imread('Tsmall4.tif'),30);
  % k0=imread('01.jpg');  % 財神
 %k0=imread('101.jpg');

 % k=imread('ntnu743x748.tif');           %        ntnu 建築
 k=imread('101.jpg'); 
 a=0.1;
 k0=imadjust(k,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]); % 調整
%
% x=myModule756v(k0,imread('T2664069.tif'),30);  % postcrossing
 %x=myModule756v(k0,imread('T2664071.tif'),30);  % postcrossing
 %x=myModule756chen(k0,imread('Tchen.tif'),30);  % postcrossing
 TT=imread('test0424.tif');
 Tadj=12;
TT1=TT(Tadj:92-Tadj,:);
% x=myModule756w(k0,TT(Tadj:92-Tadj,:),1);  % 產學聯盟
%
%x1=myAddNTNUtext(x);     % 378x284x3  300dpi   <==== preview
%imwrite(x1,'stamp190426.tif');
m9=376.6;
n9=282.4;

dat=uint8(zeros(378,284,3,30));
fn='stamp190426.tif';
ss=0.5;
dat(:,:,:,1)=imresize(myModule756w(k0,TT(Tadj:92-Tadj,:),26),ss);
dat(:,:,:,2)=imresize(myModule756w(k0,TT(Tadj:92-Tadj,:),27),ss);
dat(:,:,:,3)=imresize(myModule756w(k0,TT(Tadj:92-Tadj,:),28),ss);
dat(:,:,:,4)=imresize(myModule756w(k0,TT(Tadj:92-Tadj,:),29),ss);
dat(:,:,:,5)=imresize(myModule756w(k0,TT(Tadj:92-Tadj,:),30),ss);
dat(:,:,:,6)=imresize(myModule756w(k0,TT(Tadj:92-Tadj,:),1),ss);
%
dat(:,:,:,7)=imresize(myModule756w(k0,TT(Tadj:92-Tadj,:),2),ss);
dat(:,:,:,8)=imresize(myModule756w(k0,TT(Tadj:92-Tadj,:),3),ss);
dat(:,:,:,9)=imresize(myModule756w(k0,TT(Tadj:92-Tadj,:),4),ss);
dat(:,:,:,10)=imresize(myModule756w(k0,TT(Tadj:92-Tadj,:),5),ss);
%
dat(:,:,:,11)=imresize(myModule756w(k0,TT1,6),ss);
dat(:,:,:,12)=imresize(myModule756w(k0,TT1,7),ss);
%
dat(:,:,:,13)=imresize(myModule756w(k0,TT1,8),ss);
dat(:,:,:,14)=imresize(myModule756w(k0,TT1,9),ss);
dat(:,:,:,15)=imresize(myModule756w(k0,TT1,10),ss);
%
dat(:,:,:,16)=imresize(myModule756w(k0,TT1,11),ss);
dat(:,:,:,17)=imresize(myModule756w(k0,TT1,12),ss);
dat(:,:,:,18)=imresize(myModule756w(k0,TT1,13),ss);
%
dat(:,:,:,19)=imresize(myModule756w(k0,TT1,14),ss);
dat(:,:,:,20)=imresize(myModule756w(k0,TT1,15),ss);
dat(:,:,:,21)=imresize(myModule756w(k0,TT1,16),ss);
dat(:,:,:,22)=imresize(myModule756w(k0,TT1,17),ss);
dat(:,:,:,23)=imresize(myModule756w(k0,TT1,18),ss);
dat(:,:,:,24)=imresize(myModule756w(k0,TT1,19),ss);
%
dat(:,:,:,25)=imresize(myModule756w(k0,TT1,20),ss);
dat(:,:,:,26)=imresize(myModule756w(k0,TT1,21),ss);
dat(:,:,:,27)=imresize(myModule756w(k0,TT1,22),ss);
dat(:,:,:,28)=imresize(myModule756w(k0,TT1,23),ss);
dat(:,:,:,29)=imresize(myModule756w(k0,TT1,24),ss);
dat(:,:,:,30)=imresize(myModule756w(k0,TT1,25),ss);
%
m=84;  % offset
n=816;
s=10;  % indent
nn=1;
    for j=1:2:10
        for i=1:6
        y( round(m+(i-1)*m9)+1+s: round(m+(i-1)*m9)+378-s, round( n+(j-1)*n9+1)+s :round(n+(j-1)*n9)+284-s ,:)=dat(1+s:end-s, 1+s:end-s ,:,nn);
    nn=nn+1;
        end
end
imwrite(y,'res30.jpg');
        