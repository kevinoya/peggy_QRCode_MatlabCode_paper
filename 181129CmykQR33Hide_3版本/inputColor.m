%  �s�@�~��v��
%
%  k0=imread('lin160615.jpg');  % 3024 x 4032 x 3
clf;
k0=imread('140530.jpg');  % 3024 x 4032 x 3
imshow(k0);
 uv=ginput(2);    % ������I �j�P��X�n�쪺�v��
 % uv=[1398.5 1202.5; 1610.5 1386.5];
 %
 uvc=mean(uv);  % 1x2  ���ߦ�m    ��X�����
 h9=(uv(2,1)-uv(1,1));  % ���e�� 
 v9=(uv(2,2)-uv(1,2));  % ��찪��
 hv9=(h9+v9)/4*660/396;   %   <-----------�w�d�h��ϰ� 660x660
 %k2p=k2(round(uv(1,2)):round(uv(2,2)),round(uv(1,1)):round(uv(2,1)));
 k2p=k0(round(uvc(2)-hv9):round(uvc(2)+hv9), round(uvc(1)-hv9):round(uvc(1)+hv9),:);
%
%  k3=k2(3113:5097,521:3976,:);  % ��w�n
%  zz=390+140;  % �L�զ�m
%  k3=k2(3113:5097,521+zz:2670+zz,:);(
%
k4a=imresize(k2p,[660,660]);    % 660x660 image
aa=(660-396)/2;
k4=k4a(aa+1:aa+396,aa+1:aa+396,:);
subplot(2,2,1),imshow(k4a);title('RGB 600x600x3');
subplot(2,2,2),imshow(k4);title('RGB 396x396x3');


%f=iii*0.02;   �վ�Ƕ� (�ثe�Ӳ`�F)
f1=0.3;
f2=0.9;
 k5a = imadjust(k4a,[0 0 0; 1 1 1],[ f1 f1 f1; f2 f2 f2]);
%k1=k4;
[n1 n2 n3]=size(k5a);
k5=k5a(aa+1:aa+396,aa+1:aa+396,:);
subplot(2,2,3),imshow(k5a); title('adjusted image (660x660x3)');
subplot(2,2,4),imshow(k5); title('adjusted image (396x396x3)');
imwrite(k5a,'inputColor660_1220.tif');