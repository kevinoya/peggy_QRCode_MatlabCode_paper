dat2=zeros(4,2);
for ss=1:4
ii=dat(ss,1);
jj=dat(ss,2);
[m,n]=size(y5b);
myb=uint8(255*ones(m,n));
if ss==2
  myb(ii-12:ii+12,jj-12:jj+12)=y5b(ii-12:ii+12,jj-12:jj+12);  
else
myb(ii-24:ii+24,jj-24:jj+24)=y5b(ii-24:ii+24,jj-24:jj+24);
end

%
% 計算重心位置
myK=1-double(myb)/255;
ti=1:m;
iii=sum(sum(myK').*ti)/sum(sum(myK));
%
tj=1:n;
jjj=sum(sum(myK).*tj)/sum(sum(myK));
%
dat2(ss,:)=[iii jjj];
end
imshow(y5b);
hold;
plot(dat2(:,2),dat2(:,1),'r+');
hold;
