path(path,'..\190320_08QR41all\myMatlabFunctions')
 %
 %{
x=imread('old660.tif');  % while imput a 660x660
x1=x>128;
x2=x1(1:4:660,1:4:660);
a=x2;
 %}
%  Kuan's method
%
% a=imread('n165taiwan.tif');
 % a=imread('QR0308q165.tif');   % kuan 41x41 B OK  <===
 % a=imread('QR0308r165.tif');   %  ¦P¤W
 % a=imread('QR0308s165.tif');   % Juan 41x41 B NG / 33x33 B OK
 %
 a=imread('LenaNewW165.tif');   % white background
 a=imread('LenaOldW165.tif'); 
 %
  a=imread('TwNewB165.tif');   % Black background
  a=imread('TwOldB165.tif');   % Black background
  %
  a=imread('LenaNewB165.tif');   % Black background 
  a=imread('LenaOldB165.tif');  % 
  
figure(1),imshow(a);
s=(165-123)/2;
a1=a(s+1:s+123,s+1:s+123);
figure(2),
b=myDecodeKey(a1,9);
c=myQR41temp33(b);
figure(3),imshow(c);


%  testing visually
%{
  a1=imread('TwNewB165.tif');   % Black background
  a2=imread('TwOldB165.tif');   % Black background
  %
  b1=imread('LenaNewB165.tif');   % Black background 
  b2=imread('LenaOldB165.tif');  % 
  
  c=[a1 a2; b1 b2];
  c1=uint8(double(c)*255);
   c2=imresize(c1,2,'nearest');
   imwrite(c2,'test0527.tif');
%}