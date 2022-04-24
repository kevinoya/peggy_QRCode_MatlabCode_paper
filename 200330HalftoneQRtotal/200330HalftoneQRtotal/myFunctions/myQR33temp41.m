
% 
%  usage:  y3=myQR33temp41(x2);
%
%  input:  x2   33x33 QR 
%
%  output:  y3  temp41QR (之後可以做為 2nd QR 的輸入)
% 

function y3=myQR33temp41(x2);
% preprocessing 41x41 QR
%
%y=imread('post.png');  % 147x147
%y1=imresize(y,1/3);  % 49x49
%y2= (y1(5:45,5:45)==0);  % 41x41 binary
%imshow(y2);
y2=imread('dummyQR41.tif');

% 抽取 QR33 100 個codeword data
%
qr33_matrix;  % a is label 1-36 data;   101-164 ECC
a1=(a>0);   % 100 個 codeword 位置 (1)
dat33=[];
for j=1:33
    for i=1:33
        if a1(i,j)==1
            dat33=[dat33; x2(i,j)];
        else
            dat33=dat33;
        end
    end
end

%  製作一個無cw的 QR 33
%
a33dummy=(~a1)&x2;
imshow(a33dummy);
imwrite(a33dummy,'a33dummy.tif');

%  將100個codeword data 放入 41x41 的 dummy QR
%
y3=y2;
tt=imread('41x41_100mask.tif');
nn=0;
for jj=1:41
    for ii=1:41
        if tt(ii,jj)==1
          nn=nn+1;
          y3(ii,jj)=dat33(nn);
        else
            nn=nn;
        end
    end
end