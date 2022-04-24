
%clear all;
%
myb=uint8(255*ones(756,564,3));   % ¶ñªÅ¥Õ
%
p=4;q=567;
res=[
myb dat(:,4:567,:,1)  myb  dat(:,4:567,:,7)  myb dat(:,p:q,:,13)  myb  dat(:,p:q,:,19)  myb  dat(:,p:q,:,25);
myb dat(:,4:567,:,2)  myb  dat(:,4:567,:,8)  myb dat(:,p:q,:,14)  myb  dat(:,p:q,:,20)  myb  dat(:,p:q,:,26);
myb dat(:,4:567,:,3)  myb  dat(:,4:567,:,9)  myb dat(:,p:q,:,15)  myb  dat(:,p:q,:,21)  myb  dat(:,p:q,:,27);
myb dat(:,4:567,:,4)  myb  dat(:,4:567,:,10) myb dat(:,p:q,:,16)  myb  dat(:,p:q,:,22)  myb  dat(:,p:q,:,28);
myb dat(:,4:567,:,5)  myb  dat(:,4:567,:,11) myb dat(:,p:q,:,17)  myb  dat(:,p:q,:,23)  myb  dat(:,p:q,:,29);
myb dat(:,4:567,:,6)  myb  dat(:,4:567,:,12) myb dat(:,p:q,:,18)  myb  dat(:,p:q,:,24)  myb  dat(:,p:q,:,30)];
%
%  4536x5640x3

final=uint8(255*ones(4961,7016,3));
ii=round(8/25.4*600);
jj=round(45/25.4*600);
final(ii+1:ii+4536,jj+1:jj+5640,:)=res;
imwrite(final,'190503stamp30output.tif','Resolution',600);
%




