%clear all;
%
%y=imread('stamp190424.tif');   % intpu 756x567x3
function z=myAddNTNUtext(y);
x=imread('PC4.tif');   % input NTNU char
x1=x(:,:,1);               % 72x703
x2=imresize(x1,0.65);
x3=rot90((x2));
[m n]=size(x3);
%
m1=uint8(zeros(756,567));   % design mask
m0=140;n0=16;
m1(m0+1:m0+m,n0+1:n0+n)=x3;

k=uint8(zeros(756,567,3));   % black layer

z=myBlendColorImages(k,y,double(m1)/255); % composition
%imwrite(z,'stamp0426.tif');
%imshow(z);
