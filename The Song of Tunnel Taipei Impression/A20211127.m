clear all


% path(path,'..\myFunctions')
% path(path,'..\myFunctions\data')
% path(path,'..\ScannedImages')
% QRcode_file = 'NBT5UN3TZH_1.tif';
QRcode_file = '20211127_QRcode_TUNNEL.tif';
in_file = 'S__95625264.jpg';
% in_file = 'RO1.png';
out_file = '20211127_TUNNEL.png';

% input QR code
y41a=imread(QRcode_file);        %     <============ 41x41 binary data
y41=y41a==1;


k9=imread(in_file);
xy =[  17.0000  1000.0000;
  217.0000  01050.0000];
k91=imresize(k9,492/400);
imshow(k91);


% k1=myAddQR41red(k91,y41,232,193,70);
k1=myAddQR41red2(k91,y41,12,12,250);


% imwrite(k1,'res190724.tif','Resolution',600);
figure(3),imshow(k1);
imwrite(k1,out_file);