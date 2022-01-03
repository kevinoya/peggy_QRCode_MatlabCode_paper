
% t171114a;   % 前處理  產生 33x33x20 兩階數據 zz
%
clear all;
%
D=dir('*.png');
zz=logical(zeros(33,33,20));
for i=1:20
    y=imread(D(i).name);
    y1=(y==0);
   z1=imresize(y1,[37 37],'nearest');
   zz(:,:,i)=z1(3:35,3:35);  % 正排列
    % zz(:,:,21-i)=z1(3:35,3:35);  % 反排列
    subplot(4,5,i),imshow(zz(:,:,i));
end

 qrA20=zz;   save('qrA20.mat','qrA20');  % 正排列

% qrB20=zz;   save('qrB20.mat','qrB20');  % 反排列
