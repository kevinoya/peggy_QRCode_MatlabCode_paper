%
% ���{���|���ͤ��~�㵲�X���Ϥ�
%


k5a=imread('peggy.jpg');%�ϥΪ��Ϥ��ɦW(660x660)

% �E�I���|�I�쪺QR Code�j�p���@�ˡA
% �E�I�� = (49*49)
% �|�I�� = (41*41)
qr1=imread('peggyOutQR.tif');  % �~�㪺QR code  logical
qr2=imread('peggyHideQR.tif'); % ���ê�QR code  logical
%

ss=1529524; %����QRCode��ܪ��Ʀr�A�Ĥ@�X������]���|���(�ڷd����)
%%�����ܷ|+3�A�]�|�U������ ss+3

%�E���I�쪺�{�� START%
res1_120=[myCmykQR33_181128v8(k5a,4,qr1,qr2,50,ss+3)]; 
%�E���I�쪺�{�� END%

%�|���I�쪺�{�� START%
%res1_120=[myCmykQR33_181128v6(k5a,4,qr1,qr2,70,ss+3)];
%�|���I�쪺�{�� END%


imwrite(res1_120,'20211210.tif');
imshow(imadjust(255-res1_120(:,:,4),[0.5 1],[0 1]));title('hidden QR');



