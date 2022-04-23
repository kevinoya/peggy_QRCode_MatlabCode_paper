function y=myErrorCodeword33(ErrorMap,A);
x1=ErrorMap;
nBitError=33*33-sum(sum(x1));
BitErrorRate=nBitError/33/33;
x2 = double(~x1).*A;
%figure(8),imshow(x2);
t=0:1:164;
x3=reshape(x2,33*33,1);
h=hist(x3,t);
CWerror=sum(h(2:165)~=0);   % 去掉標號0 只留codeword 1-212
CWerrorRate=CWerror/100;
y=[nBitError BitErrorRate CWerror CWerrorRate];
%figure(9),plot(t(2:213),h(2:213));