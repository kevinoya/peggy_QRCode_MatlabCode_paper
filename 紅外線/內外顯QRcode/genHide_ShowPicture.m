%
% ���{���|���ͤ��~�㵲�X���Ϥ�
%


k5a=imread('NTNU22.jpg');%�ϥΪ��Ϥ��ɦW(660x660)

% �E�I���|�I�쪺QR Code�j�p���@�ˡA
% �E�I�� = (49*49) QR Code�����j�p147*147 cut 49*49
% �|�I�� = (41*41) QR Code�����j�p123*123 cut 41*41
% �|�I�� = (33*33) QR Code�����j�p99*99 cut 33*33
% �|�I�� = (29*29) 
qr1=imread('NTNUQR Code-out41H.tif');  % �~�㪺QR code  logical
qr2=imread('158word-41L.tif'); % ���ê�QR code  logical
%

ss=1529524; %����QRCode��ܪ��Ʀr�A�Ĥ@�X������]���|���
%%�����ܷ|+3�A�]�|�U������ ss+3

%�E���I�쪺�{�� START%
%res1_120=[myCmykQR33_181128v8(k5a,4,qr1,qr2,70,ss+3)]; 
%�E���I�쪺�{�� END%

%�|���I��(41*41)���{�� START%
res1_120=[myCmykQR33_181128v6(k5a,4,qr1,qr2,70,ss+3)];
%�|���I��(41*41)���{�� END%

%�|���I��(33*33)���{�� START%
%res1_120=[myCmykQR33_181128v4(k5a,4,qr1,qr2,70,ss+3)];
%�|���I��(33*33)���{�� END%

%�|���I��(29*29)���{�� START%
%res1_120=[myCmykQR33_181128v3(k5a,4,qr1,qr2,70,ss+3)];
%�|���I��(29*29)���{�� END%


imwrite(res1_120,'158word-41L-out.tif');
imshow(imadjust(255-res1_120(:,:,4),[0.5 1],[0 1]));title('hidden QR');



