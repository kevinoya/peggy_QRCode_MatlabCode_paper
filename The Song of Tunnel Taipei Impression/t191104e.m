clear all


% path(path,'..\myFunctions')
% path(path,'..\myFunctions\data')
% path(path,'..\ScannedImages')

% input QR code
y41a=imread('shortmusicQR.tif');        %     <============ 41x41 binary data
y41=y41a==1;


k9=imread('music.png');
xy =[  17.0000  1000.0000;
  217.0000  01050.0000];
k91=imresize(k9,492/400);
imshow(k91);


% k1=myAddQR41red(k91,y41,232,193,70);
k1=myAddQR41red2(k91,y41,100,100,250);


% imwrite(k1,'res190724.tif','Resolution',600);
figure(3),imshow(k1);
imwrite(k1,'210831cm.tif');