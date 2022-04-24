clear all;
%
 % path(path,'..\190503photo')
 path(path,'..\18adm')
%
a=0.1;    %  input image
%
k=imread('ntnu743x748.tif');           %        ntnu 建築
k30=imadjust(k,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]); % 調整
%
% z=myModule756x(k30,myPCidTitle('1234567'),2);
% imwrite(z,'test0506.tif','Resolution',600);


m9=376.6;   % 左上角點 @ 30枚郵票格式
n9=282.4;
%
dat=uint8(zeros(378,284,3,30));
% fn='stamp190426.tif';
ss=0.5;
%
dat(:,:,:,1)=imresize(myModule756x(k30,imread('cap3.tif'),2),ss);
dat(:,:,:,2)=imresize(myModule756x(k30,myPCidTitle('9369180'),2),ss);

for k=3:30
 dat(:,:,:,k)=imresize(myModule756x(k30,myPCidTitle(num2str(9369180+k)),2),ss);
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
imwrite(y,'res30.jpg');