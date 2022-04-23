
clear all;
%
myb=uint8(255*ones(756,567,3));   % ¶ñªÅ¥Õ
%
res=[
myb imread('res68.tif')     myb  imread('resA.tif')  myb imread('resA.tif')   myb  imread('resD.tif')   myb  imread('resD.tif');
myb imread('res69.tif')     myb  imread('resA2.tif') myb imread('resB2.tif')  myb  imread('resB2.tif')  myb  imread('resB2.tif');
myb imread('reschen1.tif')  myb  imread('resB.tif')  myb imread('resB.tif')   myb  imread('resE.tif')   myb  imread('resE.tif');
myb imread('reschen2.tif')  myb  imread('resB2.tif') myb imread('resA2.tif')  myb  imread('resA2.tif')  myb  imread('resA2.tif');
myb imread('reschen2.tif')  myb  imread('resC.tif')  myb imread('resC.tif')   myb  imread('res68.tif')  myb  imread('res71.tif');
myb imread('reschen1.tif')  myb  imread('resD.tif')  myb imread('resA2.tif')  myb  imread('res69.tif')  myb  imread('res71.tif')];
%
%  4536x5670

final=uint8(255*ones(4961,7016,3));
ii=round(8/25.4*600);
jj=round(45/25.4*600);
final(ii+1:ii+4536,jj+1:jj+5670,:)=res;
imwrite(final,'181204stamp30output.tif','Resolution',600);
%




