%
%  usage: y=myPut720scale(a0,scale);
%            input: a0  --  color image
%                   scale ---  scaling factor
%            output: y  -- 720x720x3 color image
%   
%
function y=myPut720scale(a0,scale);
%
% a0=imread('new.tif');  % 660x660x3
% scale=0.9;
a=imresize(a0,scale);
%
t=uint8(255*ones(720,720,3));
[m n p]=size(a);
i2= round((720-m)/2);
j2= round((720-n)/2);
t(i2+1:i2+m,j2+1:j2+n,:)=a;
y=t;