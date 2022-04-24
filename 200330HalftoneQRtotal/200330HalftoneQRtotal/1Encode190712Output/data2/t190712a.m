%  t180813i.m  台灣黑白反轉
%   
%  error diffusion + data hiding (1st QR - ?~?? Graphic QR)
%                        + random number (2nd QR - ???? QR) 
%                          key=9;
%   
clear all;
path(path,'..\myFunctions')

key=9;
colorimage='Lena516.tif'; 
 
%  前處理  QR1  QR2  CoverImage
%
y41=imread('QRpost41.tif');   %  QR A     41x41 binary 
hh=imread('QRhml41.tif');     %  QR B     41x41 binary
qr33=imread('hmlvideo.tif');  % QR B 33x33 binary

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
 k2p=k2(round(uvc(2)-hv9):round(uvc(2)+hv9), round(uvc(1)-hv9):round(uvc(1)+hv9));
%
k2q=imadjust(k2p,[0  1],[0.1  1]);  % 調階調 
k3a=imresize(k2q,[165 165]);
% --------------------------------------- 1st  影像前處理結束


k22=myQR41and41(k3a,y41,hh,9,0);   % old method  <===== 主要雙重加密處理步驟  (0 黑背景; 1 白背景)
% k22=myQR41and33(k3a,y41,qr33,9,0);   % new method


imwrite(k22,'QR123r165.tif','Resolution',600);  % output binary 165x165

%test=[myQR41and41(k3a,y41,hh,9,0) myQR41and41(k3a,y41,hh,9,1);
%    myQR41and33(k3a,y41,qr33,9,0) myQR41and33(k3a,y41,qr33,9,1)];

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
 

% if QRB is 33x33
a=myDecodeKey(k22(s+1:s+123,t+1:t+123),key);
b=myQR41temp33(a);
figure(4),imshow(imresize(uint8(double(b)*255),8,'nearest'));title('if Mask - decoded QR 33x33');