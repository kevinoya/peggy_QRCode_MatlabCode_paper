function [y5b,dat]=myFindQR33(y5a);
%
% input:  y5a  : grayscale image about 700x700 (600dpi)
%
% output: y5b  : �ק�ᤧ�Ƕ��v�� (���� row column)
%         dat  : 4�զ�m (i,j)     4   3
%                                 1    2

[m n]=size(y5a);
y5b=y5a(1:m-rem(m,2),1:n-rem(n,2));   % �e�B�z������row column�v��
% figure(1),clf;subplot(2,4,1),imshow(y5b);title('sample');


%mask1=ones(36,36)/36/36;   % 3x12  3x3 modules 600 dpi ���y�ؤo
m2=ones(7,7);    % ��k�U�I
m2(2:6,2:6)=0;
m2(3:5,3:5)=1;
m3=imresize(logical(m2),12,'nearest'); % imshow(m3);
mask1=m3/sum(sum(m3));
[m1 n1]=size(y5b);
y6=conv2(double(y5b),mask1,'same');   % m1 x n1
% subplot(2,4,2),imshow(uint8(y6)); title('smoothed');

buf=30; % ����t30�ܥզ�
y7=(ones(m1,n1)*255);
y7(buf+1:m1-buf,buf+1:n1-buf)=y6(buf+1:m1-buf,buf+1:n1-buf);
%  subplot(2,4,3),imshow(uint8(y7)); title('edge');

blank=255*ones(m1/2,n1/2);

y71=y7(1:m1/2,1:n1/2);    % �쥪�W�I
aa=mymin2(y71);
% subplot(2,4,4),imshow(y5b);title('���W');
% hold; plot(aa(2),aa(1),'r+'); hold;

y72=[blank y7(1:m1/2,n1/2+1:n1); blank blank];    % ��k�W�I
bb=mymin2(y72);
% subplot(2,4,5),imshow(y5b);title('�k�W');
% hold; plot(bb(2),bb(1),'r+'); hold;

y73=[blank blank; y7(m1/2+1:m1,1:n1/2) blank];    % �쥪�U�I
cc=mymin2(y73);
% subplot(2,4,6),imshow(y5b);title('���U');
% hold; plot(cc(2),cc(1),'r+'); hold;

m2=ones(5,5);    % ��k�U�I
m2(2:4,2:4)=0;
m2(3,3)=1;
m3=imresize(logical(m2),12,'nearest'); % imshow(m3);
m4=m3/sum(sum(m3));
y8=conv2(double(y5b),double(m4),'same');
% subplot(2,4,7),imshow(uint8(y8));  title('smoothed mode2');

buf=30; % ����t30�ܥզ�
y9=(ones(m1,n1)*255);
y9(buf+1:m1-buf,buf+1:n1-buf)=y8(buf+1:m1-buf,buf+1:n1-buf);
% subplot(2,4,3),imshow(uint8(y7)); title('edge');

y9d=[blank blank; blank y9(m1/2+1:m1,n1/2+1:n1) ];
dd=mymin2(y9d);


dat=[cc;dd;bb;aa];   % show ���G
 clf;imshow(y5b);
 hold;
 plot(datuv(:,1),datuv(:,2),'r.');
 hold; plot(dat(:,2),dat(:,1),'r+'); hold;

