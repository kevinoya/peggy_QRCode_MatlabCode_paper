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


%
%  1-12 
%
dat(:,:,:,1)=imresize(myModule756z(k,T11>128,28),ss);
dat(:,:,:,2)=imresize(myModule756z(k,T12>128,28),ss);
dat(:,:,:,3)=imresize(myModule756z(k,T13>128,28),ss);
dat(:,:,:,4)=imresize(myModule756z(k,T14>128,28),ss);
dat(:,:,:,5)=imresize(myModule756z(k,T15>128,28),ss);
dat(:,:,:,6)=imresize(myModule756z(k,T16>128,28),ss);
%
for jj=7:12
    dat(:,:,:,jj)=dat(:,:,:,rem(jj-1,6)+1);
end



%
%   13-16   19-22
%
a=0.1;    %  input image  (enhancement)
%
k=imread('1.jpg'); 
k31=imadjust(k,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]); % 調整
%
k0=imread('2.jpg'); 
k=k0(60:570,30:end,:);
k32=imadjust(k,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]); % 調整
%
k0=imread('5.jpg'); 
k=k0(1:500,50:400,:);
k33=imadjust(k,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]); % 調整
figure(8),imshow(k33);
%
k0=imread('4.jpg'); 
k=k0(50:500,350:700,:);
k34=imadjust(k,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]); % 調整
%
%
%  Make TITLE
%
T1=imread('TleeHope.png'); % 92*396x3    uint8
ntnu=imread('ntnu256.tif'); % 256x256    logical
n2=uint8(double(~ntnu)*255);
n3=imresize(n2,[92 92]);
T2a=[n3 uint8(double(T1(:,:,1)>10)*255)];  % 字調粗一些
T2=T2a>128;
T2(:,93:92+70)=[];
dat(:,:,:,13)=imresize(myModule756y(k32,T2,3),ss);
dat(:,:,:,14)=imresize(myModule756y(k33,T2,3),ss);
dat(:,:,:,15)=imresize(myModule756y(k32,T2,3),ss);
dat(:,:,:,16)=imresize(myModule756y(k33,T2,3),ss);
%
dat(:,:,:,19)=imresize(myModule756y(k34,T2,3),ss);
dat(:,:,:,20)=imresize(myModule756y(k31,T2,3),ss);
dat(:,:,:,21)=imresize(myModule756y(k34,T2,3),ss);
dat(:,:,:,22)=imresize(myModule756y(k31,T2,3),ss);



%
%  17-18   23-30
%
T30=imread('TntnuGrad.tif');
T30a=T30(13:60+8,12:392,1)>128;
imshow(T30a);
k0=imread('ntnu743x748.tif');           %        ntnu 建築
k=imadjust(k0,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]);    % enhancement
dat(:,:,:,17)=imresize(myModule756z(k,T30a,29),ss);

z=imread('25.tif');
kk=myModule756x(z,myPCidTitle('2774686'),2);
dat(:,:,:,18)=imresize(kk,ss);

 nk=2774686;
for jj=23:30   
    nk=nk+1;
    kk=myModule756x(z,myPCidTitle(num2str(nk)),2);
    dat(:,:,:,jj)=imresize(kk,ss);
end


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

imwrite(y,'res0603u.jpg');

