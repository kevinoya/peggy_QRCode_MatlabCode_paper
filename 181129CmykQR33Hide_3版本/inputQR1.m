filename='33.png';  % input QR code
%  input QR
%
filename='old\33.png';
y=imread(filename);   
y1=(y==0);  % 219x185 binary  
y2=y1(1:185,1:185);
y37=imresize(y2,[37 37],'nearest');  % 37x37
% imshow(y37);
y33=y37(2+1:2+33,2+1:2+33);   %      33x33 QR data to be embedded
clf;
subplot(1,2,1),imshow(y1);title('original QR');
subplot(1,2,2),imshow(y33);title('33x33 QR in binary');
imwrite(y33,'33QRbin.tif');