%
%  input :    ss='9369180'
%  output:    binary TITLE
%
function t2=myPCidTitle(ss);

t1=imread('Ttw.tif');  % 92x396x4 uint8
t2=t1(:,:,1)>128;
%
% ss='9369180';  % input 10 ­Ó ¼Æ¦r
nn=logical(ones(400,400,10));
for i=1:10
    fn=['h',num2str(i-1),'.tif'];
    nn(:,:,i)=imrotate(imread(fn),90);
end

ee=100;
dd=[];
for j=1:7
    n7=str2num(ss(j));
    dd=[dd nn(:,ee:400-ee,n7+1)];
end
imshow(dd);  % 400x1407
   
z8=imresize(dd,0.17,'nearest');
[m8 n8]=size(z8);
m9=10;
n9=140;
t2(m9+1:m9+m8,n9+1:n9+n8)=~z8;
%imshow(t2);
