y=imread('stamp190424.tif');   % 756x567x3
%
x=imread('NTNU.tif');
x1=x(:,:,1);               % 72x703
x2=imresize(x1,0.70);
x3=rot90((x2));
[m n]=size(x3);
%
m1=uint8(zeros(756,567));
m0=130;n0=14;
m1(m0+1:m0+m,n0+1:n0+n)=x3;
%
k=uint8(zeros(756,567,3));
%
z=myBlendColorImages(k,y,m1);
imwrite(z,'stamp0425.tif');
imshow(z);
