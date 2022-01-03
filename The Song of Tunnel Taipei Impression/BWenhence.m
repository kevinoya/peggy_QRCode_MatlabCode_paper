function res=BWenhence(k,y41,y41a,ii,jj);

d91=ii; %black
d93=jj; %white

% k1=myAddQR41red(k91,y41,232,193,70);
k1=myAddQR41red2(k,y41,232,193,d91);
k2=imcrop(k1,[193,232,491,491]);imshow(k2);

k3=myAddQR41red2(k,y41,232,193,d93);
k4=imcrop(k3,[193,232,491,491]);imshow(k4);



% imwrite(k1,'res190724.tif','Resolution',600);
%figure(3),imshow(k2);%é»‘é?žå??
%figure(4),imshow(k4);%?™½é»žå??
%imwrite(k2,'QQQtina90.tif');


m1=k4;
m2=k2;

%y41a=imread('yuiQR41.tif');
y1=imresize(y41a,12,'nearest');
mask=y1;

res=myBlendColorImages(m1,m2,mask);
[m n p]=size(m1);
res=uint8(zeros(m,n,p));
for i=1:p
    res(:,:,i)=uint8(double(m1(:,:,i)).*double(mask)+double(m2(:,:,i)).*(1-double(mask)));
end