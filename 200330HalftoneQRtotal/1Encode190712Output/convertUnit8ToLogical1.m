%
% ���{���ΨӱNunit8�নlogical
%
A=imread('JJ.png');%Ū��

y=(A==1); %�নlogical
%�]���৹����A�¥շ|��աA�ҥH�n�A��զ^�ӡC
%�¥չ�� Start
x=find(y==0);
y(find(y==1))=0;
y(x)=1; 
%�¥չ�� Start

imwrite(y,'JJ.tif');%����