clear all;
y=imread('res30part.jpg');
imshow(y);
% a=ginput(1)
y1=y(13:767,20:868,:);  % 755*849*3
imshow(y1);   
y1(:,283+1:283+283,:)=[];
imshow(y1);
imwrite(y1,'lee2x2.jpg','Quality',100);