clear all;
%
path(path,'C:\Users\HALFMEDIA\Desktop\NTUphotos\180315NTUphoto70Wang1800')
y=imread('stamp30.jpg');    % 2480x3508x3  300dpi
%
%x=imread('res4.tif');    % 756x567x3    600dpi
%k0=imread('ntnu743x748.tif');
k0=imread('01.jpg');
k0=imread('101.jpg');
% x=myModule756ntnu(k0,imread('Tsmall4.tif'),30);
x=myModule756ntnu(k0,imread('Thml4.tif'),30);
x1=imresize(x,0.5);     % 378x284x3  300dpi

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
        