function y=myErrorCodeword41(ErrorMap,A);
x1=ErrorMap;
nBitError=41*41-sum(sum(x1));
BitErrorRate=nBitError/41/41;
x2 = double(~x1).*A;
%figure(8),imshow(x2);
t=0:1:212;
x3=reshape(x2,41*41,1);
h=hist(x3,t);
CWerror=sum(h(2:213)~=0);   % 去掉標號0 只留codeword 1-212
CWerrorRate=CWerror/172;
y=[nBitError BitErrorRate CWerror CWerrorRate];
%figure(9),plot(t(2:213),h(2:213));