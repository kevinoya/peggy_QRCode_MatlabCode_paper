
% t171114a;   % �e�B�z  ���� 33x33x20 �ⶥ�ƾ� zz
%
clear all;
%
D=dir('*.png');
zz=logical(zeros(33,33,20));
for i=1:20
    y=imread(D(i).name);
    y1=(y==0);
   z1=imresize(y1,[37 37],'nearest');
   zz(:,:,i)=z1(3:35,3:35);  % ���ƦC
    % zz(:,:,21-i)=z1(3:35,3:35);  % �ϱƦC
    subplot(4,5,i),imshow(zz(:,:,i));
end

 qrA20=zz;   save('qrA20.mat','qrA20');  % ���ƦC

% qrB20=zz;   save('qrB20.mat','qrB20');  % �ϱƦC
