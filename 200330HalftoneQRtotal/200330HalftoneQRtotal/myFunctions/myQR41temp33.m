%  將 tempQR41.tif  中的 800 data 再塞入a33dummy  (from t190126c.m)   2019-03-08
% 
%  usage:  x=myQR41temp33(y);
%
%  input:  y   41x41 QR temp (為  myDecodekey 解出來的2nd QR)
%
%  output:  x  33x33 QR
% 
function x=myQR41temp33(y);
% y=imread('dummyQR41.tif');
% y=imread('41x41dummy2.tif');
m=imread('41x41_100mask.tif');
x=imread('a33dummy.tif');   
m33=imread('33x33_100mask.tif');
dat=[];
for jj=1:41
    for ii=1:41
        if m(ii,jj)==1
            dat=[dat; y(ii,jj)];
           else
            dat=dat;
        end
    end
end

nn=0;
for j=1:33
    for i=1:33
        if m33(i,j)==1
            nn=nn+1;
            x(i,j)=dat(nn);
        else
            nn=nn;
        end
    end
end
% imshow(x);