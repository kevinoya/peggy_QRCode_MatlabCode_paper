 path(path,'..\190320_08QR41all\myMatlabFunctions')
 %

%  Kuan's method
%
% a=imread('n165taiwan.tif');
a=imread('QR0126q165.tif');
figure(1),imshow(a);
s=(165-123)/2;
a1=a(s+1:s+123,s+1:s+123);
figure(2),
b=myDecodeKey(a1,9);

% Juan's method
%
% a=imread('QR0126k165.tif');  % Taiwan
 a=imread('QR0126q165.tif');   % Lena  33x33 OK (41x41 ³]¿ù¤F)
 a=imread('QR0126m165.tif');   % Lena  OK (33x33)
figure(1),imshow(a);
s=(165-123)/2;
a1=a(s+1:s+123,s+1:s+123);
figure(2),
b=myDecodeKey(a1,9);
c=myQR41temp33(b);
figure(3),imshow(c);