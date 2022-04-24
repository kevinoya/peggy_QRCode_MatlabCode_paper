clear all;
%
% path(path,'..\19adm')
%


a=0.1;    %  input image
%
k0=imread('ntnu743x748.tif');           %        ntnu 建築
k=imadjust(k0,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]);    % enhancement


%  Make title
% 
T11=imread('cap11.tiff');
T12=imread('cap12.tiff');
T13=imread('cap13.tiff');
T14=imread('cap14.tiff');
T15=imread('cap15.tiff');
T16=imread('cap16.tiff');


m9=376.6;   % 左上角點 @ 30枚郵票格式
n9=282.4;
%
dat=uint8(zeros(378,284,3,30));
% fn='stamp190426.tif';
ss=0.5;
%

dat(:,:,:,1)=imresize(myModule756z(k,T11>128,28),ss);
dat(:,:,:,2)=imresize(myModule756z(k,T12>128,28),ss);
dat(:,:,:,3)=imresize(myModule756z(k,T13>128,28),ss);
dat(:,:,:,4)=imresize(myModule756z(k,T14>128,28),ss);
dat(:,:,:,5)=imresize(myModule756z(k,T15>128,28),ss);
dat(:,:,:,6)=imresize(myModule756z(k,T16>128,28),ss);

for jj=7:30
    dat(:,:,:,jj)=dat(:,:,:,rem(jj-1,6)+1);
end

T30=imread('TntnuGrad.tif');
T30a=T30(13:60+8,12:392,1)>128;
imshow(T30a);
dat(:,:,:,30)=imresize(myModule756z(k,T30a,29),ss);

z=imread('25.tif');
kk=myModule756x(z,myPCidTitle('1234567'),2);
dat(:,:,:,29)=imresize(kk,ss);

 y=imread('temp30.jpg');    % 2480x3508x3  300dpi TEMPLATE  30枚郵票格式
%
m=84;  % offset
n=816;
s=10;  % indent
%
nn=1;
    for j=1:2:10
        for i=1:6
        y( round(m+(i-1)*m9)+1+s: round(m+(i-1)*m9)+378-s, round( n+(j-1)*n9+1)+s :round(n+(j-1)*n9)+284-s ,:)=dat(1+s:end-s, 1+s:end-s ,:,nn);
    nn=nn+1;
        end
    end

imwrite(y,'res0520t.jpg');

