
y=imread('YA9FYG4A28.png');
    y1 = rgb2gray(y);
    y2=(y1==255);
    subplot(2,2,1),imshow(y);subplot(2,2,2),imshow(y1);subplot(2,2,3),imshow(y2);
imwrite(y2,'peggyword12QRCode41HideQR1.tif');


