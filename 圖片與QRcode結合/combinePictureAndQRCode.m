clear all
% 此程式會將QRCode與圖片進行結合
% QRcode_file = 41x41的QRCode tif檔名
% in_file = 要結合的圖片檔名(最佳大小為420x420)
% out_file = 要產生的檔案檔名
% line 21 ，imresize(k9,492/400); 將圖片以 492/400 的比例放大
% line 25 ，myAddQR41(k1,y41,ii,jj,d9)
% 這個function會將圖片做處理，ii、jj會影響所需要的圖片大小，放大後的圖片不得小於(ii+492 x jj+492)

QRcode_file = '20211127_QRcode_TUNNEL.tif';
in_file = 'S__95625264.jpg';
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
%ii,jj 為QRCode 相對於左上角的位置
k1=myAddQR41red2(k91,y41,12,12,250);


% imwrite(k1,'res190724.tif','Resolution',600);
figure(3),imshow(k1);
imwrite(k1,out_file);