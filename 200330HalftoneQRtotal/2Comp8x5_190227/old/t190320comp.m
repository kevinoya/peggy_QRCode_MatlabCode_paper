%  t190227a.m      format 8x5 graphic QR codes for output
%
clear all
path(path,'..\myMatlabFunctions')
path(path,'..\..\PrintScan')

a1=imread('new660.tif');    % input 2 images
 a2=imread('old660.tif');
%
%  
% dat=[1 0.85 0.65 0.5];   % different scale factors
dat=ones(1,4);
%
%
s=uint8(255*ones(5760,3600,3));
for i=1:4
    for j=1:5
        s((i-1)*720+1:i*720,(j-1)*720+1:j*720,:)=myPut720scale(a1,dat(i));
    end
end

for i=5:8
    for j=1:5
        s((i-1)*720+1:i*720,(j-1)*720+1:j*720,:)=myPut720scale(a1,dat(i-4));
    end
end

s(1:4,1:4,:)=0;              % insert 2 (ul & lr ) control points
s(end-3:end,end-3:end,:)=0;

imwrite(s,'190320res.tif','Resolution',600);