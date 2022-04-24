clear all;
%
%path(path,'C:\Users\HALFMEDIA\Desktop\18adm')
% path(path,'C:\Users\hsiwang\Desktop\190427photo')
 path(path,'..\190425cStamps30')
 % path(path,'..\19adm')
%

y=imread('res30.jpg');    % 2480x3508x3  300dpi TEMPLATE  30枚郵票格式

a=0.1;    %  input image
%
% k=imread('ntnu743x748.tif');           %        ntnu 建築
k=imread('1.jpg'); 
k31=imadjust(k,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]); % 調整

k0=imread('2.jpg'); 
k=k0(60:570,30:end,:);
k32=imadjust(k,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]); % 調整

k0=imread('5.jpg'); 
k=k0(80:850,:,:);
k33=imadjust(k,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]); % 調整

k0=imread('4.jpg'); 
k=k0(50:500,350:700,:);
k34=imadjust(k,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]); % 調整


%
T1=imread('TleeHope.png'); % 92*396x3    uint8
ntnu=imread('ntnu256.tif'); % 256x256    logical
n2=uint8(double(~ntnu)*255);
n3=imresize(n2,[92 92]);
T2a=[n3 T1(:,:,1)];
T2=T2a>128;
T2(:,93:92+70)=[];
 % z=myModule756y(k30,T2,3);
 % imwrite(z,'test0513.tif','Resolution',600);



m9=376.6;   % 左上角點 @ 30枚郵票格式
n9=282.4;
%
dat=uint8(zeros(378,284,3,30));
% fn='stamp190426.tif';
ss=0.5;
%

dat(:,:,:,1)=imresize(myModule756y(k31,T2,3),ss);
dat(:,:,:,2)=imresize(myModule756y(k32,T2,3),ss);
dat(:,:,:,3)=imresize(myModule756y(k33,T2,3),ss);
dat(:,:,:,4)=imresize(myModule756y(k34,T2,3),ss);

for jj=5:30
    dat(:,:,:,jj)=dat(:,:,:,rem(jj-1,4)+1);
end

%
m=84;  % offset
n=816;
s=10;  % indent
y=imread('stamp30.jpg');
nn=1;
    for j=1:2:10
        for i=1:6
        y( round(m+(i-1)*m9)+1+s: round(m+(i-1)*m9)+378-s, round( n+(j-1)*n9+1)+s :round(n+(j-1)*n9)+284-s ,:)=dat(1+s:end-s, 1+s:end-s ,:,nn);
    nn=nn+1;
        end
end
imwrite(y,'res0517.jpg');

