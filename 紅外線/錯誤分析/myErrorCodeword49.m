function y=myErrorCodeword41(ErrorMap,A);
x1=ErrorMap;
nBitError=49*49-sum(sum(x1));
BitErrorRate=nBitError/49/49;
x2 = double(~x1).*A;

t=0:1:302;
x3=reshape(x2,49*49,1);
h=hist(x3,t);
CWerror=sum(h(2:303)~=0);   % 去掉標號0 只留codeword 1-302
CWerrorRate=CWerror/301;
y=[nBitError BitErrorRate CWerror CWerrorRate];
