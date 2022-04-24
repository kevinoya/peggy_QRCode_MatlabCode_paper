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
 x=myModule756v(k0,TT(Tadj:92-Tadj,:),1);  % 產學聯盟
%
x1=myAddNTNUtext(x);     % 378x284x3  300dpi   <==== preview
imwrite(x1,'stamp190426.tif');
m9=376.6;
n9=282.4;

dat=uint8(zeros(378,284,3,30));
fn='stamp190426.tif';
ss=0.5;
dat(:,:,:,1)=imresize(imread(fn),ss);
dat(:,:,:,2)=imresize(imread(fn),ss);
dat(:,:,:,3)=imresize(imread(fn),ss);
dat(:,:,:,4)=imresize(imread(fn),ss);
dat(:,:,:,5)=imresize(imread(fn),ss);
dat(:,:,:,6)=imresize(imread(fn),ss);
%
dat(:,:,:,7)=imresize(imread(fn),ss);
dat(:,:,:,8)=imresize(imread(fn),ss);
dat(:,:,:,9)=imresize(imread(fn),ss);
dat(:,:,:,10)=imresize(imread(fn),ss);
dat(:,:,:,11)=imresize(imread(fn),ss);
dat(:,:,:,12)=imresize(imread(fn),ss);
%
dat(:,:,:,13)=imresize(imread(fn),ss);
dat(:,:,:,14)=imresize(imread(fn),ss);
dat(:,:,:,15)=imresize(imread(fn),ss);
dat(:,:,:,16)=imresize(imread(fn),ss);
dat(:,:,:,17)=imresize(imread(fn),ss);
dat(:,:,:,18)=imresize(imread(fn),ss);
%
dat(:,:,:,19)=imresize(imread(fn),ss);
dat(:,:,:,20)=imresize(imread(fn),ss);
dat(:,:,:,21)=imresize(imread(fn),ss);
dat(:,:,:,22)=imresize(imread(fn),ss);
dat(:,:,:,23)=imresize(imread(fn),ss);
dat(:,:,:,24)=imresize(imread(fn),ss);
%
dat(:,:,:,25)=imresize(imread(fn),ss);
dat(:,:,:,26)=imresize(imread(fn),ss);
dat(:,:,:,27)=imresize(imread(fn),ss);
dat(:,:,:,28)=imresize(imread(fn),ss);
dat(:,:,:,29)=imresize(imread(fn),ss);
dat(:,:,:,30)=imresize(imread(fn),ss);
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
        