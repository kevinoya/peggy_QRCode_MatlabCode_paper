
y=imread('peggyQR_原始版.png');
a1=0.1;
a2=0.9;
y1=imadjust(y,[0 0 0; 1 1 1],[a1 a1 a1; a2 a2 a2]);

y2=imresize(y1,[49,49]);
figure(1),imshow(y)
figure(2),imshow(y2)

imwrite(y2,'peggyOutQR.tif');