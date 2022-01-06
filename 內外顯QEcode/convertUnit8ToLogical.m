%
% 此程式用來將unit8轉成logical
%
A=imread('huiyuQRcode.png');%讀檔

y=(A==1); %轉成logical
%因為轉完之後，黑白會對調，所以要再對調回來。
%黑白對調 Start
x=find(y==0);
y(find(y==1))=0;
y(x)=1; 
%黑白對調 Start

imwrite(y,'huiyuQRcode.tif');%產檔