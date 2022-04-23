
% 
%  usage:  y3=myQR33temp41(x2);
%
%  input:  x2   33x33 QR 
%
%  output:  y3  temp41QR (����i�H���� 2nd QR ����J)
% 

function y3=myQR33temp41(x2);
% preprocessing 41x41 QR
%
%y=imread('post.png');  % 147x147
%y1=imresize(y,1/3);  % 49x49
%y2= (y1(5:45,5:45)==0);  % 41x41 binary
%imshow(y2);
y2=imread('dummyQR41.tif');

% ��� QR33 100 ��codeword data
%
qr33_matrix;  % a is label 1-36 data;   101-164 ECC
a1=(a>0);   % 100 �� codeword ��m (1)
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

%  �s�@�@�ӵLcw�� QR 33
%
a33dummy=(~a1)&x2;
imshow(a33dummy);
imwrite(a33dummy,'a33dummy.tif');

%  �N100��codeword data ��J 41x41 �� dummy QR
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