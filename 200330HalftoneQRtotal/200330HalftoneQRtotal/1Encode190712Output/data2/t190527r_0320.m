%  t180813i.m  台灣黑白反轉
%   
%  error diffusion + data hiding (1st QR - ?~?? Graphic QR)
%                        + random number (2nd QR - ???? QR) 
%                          key=9;
%   
clear all;
path(path,'..\190320_08QR41all\myMatlabFunctions')
% path(path,'..\myMatlabFunctions')
% path(path,'..\..\PrintScan')


QRcodeA='post.png';  % <====    1st QR code filename (?~??)
QRcodeB='ntnuhml.png';     %  <====   2nd QR code filename (????)
key=9;
 % colorimage='161009cat1.jpg';  % ?~?????m?v??
 % colorimage='01.jpg';  % ?~?????m?v??
 colorimage='Lena516.tif'; 
  
 
%  前處理  QR1  QR2  CoverImage
%
y=imread(QRcodeA);   % <====   input 1st QR code  (?~??)
y1=(y==0);  % 147x147 binary   [ (4+41+4)*3  X  (4+41+4)*3 ]
y47=imresize(y1,[49 49],'nearest');  % 49x49
y41=y47(5:45,5:45);        %      41x41 orignal binary data
%imwrite(y41,'orignial.tif')

h=imread(QRcodeB);     %  <====  input hidden 2nd QR  (????)
h1=(h==0);  % 147x147 binary   [ (4+41+4)*3  X  (4+41+4)*3 ]
h47=imresize(h1,[49 49],'nearest');  % 49x49
hh=h47(5:45,5:45);   % 41x41 binary
%hh=imread('dummyQR41.tif');  %  <====  input hidden 2nd QR

%  色彩影像
%
 k1=imread(colorimage);  
 %k2=imadjust(rgb2gray(k1));    %    ?????????v??
 k20=(rgb2gray(k1));
 % k2=uint8(255-double(k20));   %   <================ 2019-01-26
 k2=k20;
 [n1 n2 ]=size(k2);
 %
 imshow(k2);
 %uv=ginput(2);    % 找到大致位置
 uv =[105   74;
      435  436];
 %
 uvc=mean(uv);  % 1x2  微調
 h9=(uv(2,1)-uv(1,1));  % 
 v9=(uv(2,2)-uv(1,2));  % 
 hv9=(h9+v9)/4;
 %k2p=k2(round(uv(1,2)):round(uv(2,2)),round(uv(1,1)):round(uv(2,1)));
 k2p=k2(round(uvc(2)-hv9):round(uvc(2)+hv9), round(uvc(1)-hv9):round(uvc(1)+hv9));
%
% f=0 
% k2q=imadjust(k2p,[0  1],[0.4  1]); %?????????
k2q=imadjust(k2p,[0  1],[0.1  1]); 
%k2q=imadjust(k2p);
%
%  165x165 
%s1=81+ii; t1=145+jj;
%k3=k2(s1+1:s1+165,t1+1:t1+165);
k3a=imresize(k2q,[165 165]);
% --------------------------------------- 1st  影像前處理結束


k22=myQR41and41B(k3a,y41,hh,9);   % <===== 主要雙重加密處理步驟  黑背景


imwrite(k22,'QR123r165.tif','Resolution',600);  % output binary 165x165

% 輸出大影像 (165x4)x(165x4)  -->  660x660x3 ?m???v??
%
k33=uint8(zeros(165,165,3));
for i=1:3
    k33(:,:,i)=uint8(double(k22)*255);
end
k5=imresize(k33,4,'nearest');  % 660x660
%
imwrite(k5,'QR123r660.tif','Resolution',600);  % output color 660x660x3
figure(2),imshow(k5);
 
%  加 key 解密 
s=21;t=21;
figure(3),
subplot(1,2,1),myDecodeKey(k22(s+1:s+123,t+1:t+123),key);title(['key=',num2str(key)]);
subplot(1,2,2),myDecodeKey(k22(s+1:s+123,t+1:t+123),key+1);title(['key=',num2str(key+1)]);
 