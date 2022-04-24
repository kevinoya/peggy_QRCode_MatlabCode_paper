clear all;
%
path(path,'C:\Users\HALFMEDIA\Desktop\NTUphotos\180315NTUphoto70Wang1800')
path(path,'C:\Users\HALFMEDIA\Desktop\18adm')
%
y=imread('stamp30.jpg');    % 2480x3508x3  300dpi TEMPLATE
%
%x=imread('res4.tif');    % 756x567x3    600dpi
%k0=imread('ntnu743x748.tif');

% x=myModule756ntnu(k0,imread('Tsmall4.tif'),30);
% k=imread('01.jpg');  % 財神
% k=imread('101.jpg');
k=imread('ntnu743x748.tif');           %        ntnu 建築
a=0.1;
k0=imadjust(k,[0 0 0 ;1 1 1 ],[a a a ; 1 1 1]); % 調整
%
% x=myModule756ntnu(k0,imread('T2.tif'),30);  % 產學聯盟
x=myModule756ntnu(k0,imread('T2664068.tif'),30);  % 產學聯盟

%x=myModule756ntnu(k0,imread('Thml4.tif'),30);  % HML
imwrite(x,'res.tif');
%
x1=imresize(x,0.5);     % 378x284x3  300dpi   <==== preview

m9=376.6;
n9=282.4;

m=84;  % offset
n=816;
s=10;  % indent
for i=1:6
    for j=1:2:10
        y( round(m+(i-1)*m9)+1+s: round(m+(i-1)*m9)+378-s, round( n+(j-1)*n9+1)+s :round(n+(j-1)*n9)+284-s ,:)=x1(1+s:end-s, 1+s:end-s ,:);
    end
end
imwrite(y,'res30.jpg');
        