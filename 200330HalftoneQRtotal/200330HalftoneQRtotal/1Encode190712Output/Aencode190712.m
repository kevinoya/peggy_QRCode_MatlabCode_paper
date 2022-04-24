%  製作halftone QR 之藏密 (外顯 41x41QR; 可選內藏 41x41QR / 33x33QR; 也選白底或黑底)
%
%  error diffusion + data hiding (1st QR - 41x41 Graphic QR)
%                        + random number (2nd QR - 41x41 (old) / 33x33 (new) QR)
%                          key=9;
%
clear all;close all,clc
path(path,'../myFunctions')

key=9;
colorimage='tiger.jpg';

%  前處理  QR1  QR2  CoverImage
%
y41=imread('hai41X41.tif');   %  QR A     41x41 binary
hh=imread('hai41X41.tif');     %  QR B     41x41 binary
qr33=imread('try33X33try33X3300.tif');  % QR B 33x33 binary


%  色彩影像 前處理
%
k1=imread(colorimage);

% 宣告處理RGB影像的CLASS
  Imgcls=ImgClass;

for i=1:4 %迴圈跑四遍，原始->R->G->B
    switch i
        case 1 %原始
            k2=(rgb2gray(k1));
            outFileName = '';
        case 2 %R
            R = SeparateRGB(Imgcls,k1,'R');
            k2=R;
            outFileName = 'R';
        case 3 %G
            G = SeparateRGB(Imgcls,k1,'G');
            k2=G;
            outFileName = 'G';
        case 4 %B
            B = SeparateRGB(Imgcls,k1,'B');
            k2=B;
            outFileName = 'B';
    end

    [n1 n2 ]=size(k2);    
    imshow(k2);
    %uv=ginput(2);    % 找到大致位置
    %底下兩行與原始圖片大小有關，是為了要擷取特定區塊
    %uv =[105   74;      435  436]; %用於660*660
    uv=[750,1050;3550,3250]%用於4269*4269
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


    k22=myQR41and41(k3a,y41,hh,9,1);   % old method  <===== 主要雙重加密處理步驟  (0 黑背景; 1 白背景)
    % k22=myQR41and33(k3a,y41,qr33,9,1);   % new method


    % 輸出小影像 (165)x(165)  -->  165x165
    %
    imwrite(k22,['20220424_' outFileName '1.tif'],'Resolution',600);  % output binary 165x165

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
    imwrite(k5,['20220424_' outFileName '2.tif'],'Resolution',600);  % output color 660x660x3
    figure(2),imshow(k5);


    %  加 key 解密
    s=21;t=21;
    figure(3),
    subplot(1,2,1),myDecodeKey(k22(s+1:s+123,t+1:t+123),key);title(['key=',num2str(key)]);
    subplot(1,2,2),myDecodeKey(k22(s+1:s+123,t+1:t+123),key+1);title(['key=',num2str(key+1)]);

end

 % 以下為將分別的R、G、B整合為一個RGB圖檔
  R=imread('20220424_R1.tif');
  G=imread('20220424_G1.tif');
  B=imread('20220424_B1.tif');
  out = CombineRGB(Imgcls,R,G,B); 
  outUnit8 = im2uint8(out,'indexed');
  imshow(outUnit8);
  imwrite(outUnit8,'2022042_combine.tif');
 %



% if QRB is 33x33
% figure(4),
% a=myDecodeKey(k22(s+1:s+123,t+1:t+123),key);
% b=myQR41temp33(a);
% imshow(imresize(uint8(double(b)*255),8,'nearest'));title('if Mask - decoded QR 33x33');