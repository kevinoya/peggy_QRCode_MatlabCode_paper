%  transfer function   2012-07-25
%
% input: y: image(mxn)   b: mapped_data (1x256)
% output: new image
% usage: mytransfer(y,b)

function z=mytransfer(y,b);

 %y=imread('hw3b.tif');  % input image
 %b=[ones(1,20)*20 21:236 ones(1,20)*237];  % transfer function

%figure(9),subplot(1,3,1),imshow(y);title('original image');

t=0:255;
%figure(9),subplot(1,3,2),plot(t,b);axis([0 255 0 255]);axis('square');
%title('Transfer Function');xlabel('Input');ylabel('Output');

z=uint8(b(y+1));
%figure(9),subplot(1,3,3),imshow(z);title('enhanced image');