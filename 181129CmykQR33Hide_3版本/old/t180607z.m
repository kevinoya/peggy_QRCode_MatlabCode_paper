qr1=imread('m180111_2.tif');
qr2=imread('hml33.tif');

%a1=imresize(qr1,12,'nearest');

b=qr1;  % 660x660x3  RGB 加密影像
b1=uint8(zeros(660,660,4));
b1(:,:,1:3)=255-b;        % 產生 660x660x4  CMYK 加密影像 (K 無訊號)

a=ones(660,660);
b=132;
a(b+1:b+396,b+1:b+396)=qr1;
%}
d=uint8(zeros(660,660,4));  % 設 CMYK 區域
for i=1:3
    d(:,:,i)=uint8(double(a)*30);
end
d(:,:,4)=uint8(double(~a)*30);
% imwrite(d,'test1208a.tif');    % 平緩的CMYK image
c=uint8(b1+d);  % 合成

imwrite(c,'t0607.tif');