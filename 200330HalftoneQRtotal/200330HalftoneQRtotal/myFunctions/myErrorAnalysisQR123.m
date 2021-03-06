%
%  input / data  偵測 123x123   
%          y123  true 123x123
%          key    9  (大多)
%  output / [錯誤數 偽白 為黑 錯誤率  QR1錯誤數 錯誤率 錯誤codeword 錯誤cw率  QR2錯誤數 錯誤率
%  錯誤codeword 錯誤cw率 ]

function res=myErrorAnalysisQR123(data,y123,key);

% recognition rate for 123x123
%
recogErrorRate=1-sum(sum(data==y123))/41/41/3/3;
recogError=sum(sum(data~=y123));
%
% figure(7),imshow(data==y123);title('error map');
%
FP=(y123==0)&(data==1);
FN=(y123==1)&(data==0);
num_FW= sum(sum(FP));
num_FB=   sum(sum(FN));
% figure(8),imshow(~FP);title([num2str(num_FW),' false WHITE 黑0->白1']);
% figure(9),imshow(~FN);title([num2str(num_FB),' false BLACK 白1->黑0']);
recogE=[recogError num_FW num_FB recogErrorRate];
% disp(recogE);
resImg=[y123  data==y123 data ; ~FP logical(zeros(123,123))  ~FN];
figure(7),imshow(resImg);
title('GraphicQR123    ErrorMap      RecognizeImage');
xlabel([num2str(num_FW),' false WHITE (黑0->白1) ',num2str(num_FB),' false BLACK (白1->黑0)']);
%
%imwrite(~FP, 'Scan1012laser_FP_me21.png')
%imwrite(~FN, 'Scan1012laser_FN_me21.png')

%
%
%
%                         <=======  分析 1st QR
% 呼叫qr41_matrix產生  a  <=== 41x41 codeword labels
qr41_matrix;
%
% ErrorCodeword41   %%codeword解密
% 總共172個codeword（41x41）
%
x1=(data(2:3:end,2:3:end)==y123(2:3:end,2:3:end));   % x1 : 1(白):正確的判別  0(黑):錯誤的判別
cw=myErrorCodeword41(x1,a);
%res8=[mm nn cw(1)  cw(2:4)];
% disp('QR_1  bitError bitErrorRate codewordError codewordErrorRate')
% disp(res8)
% mydata9=[mydata9;res8 ];


figure(10),a1=myDecodeKey(data,key);        %  辨識的 2nd QR
%qr2b=imread('dummyQR41.tif');   % 真實藏的 2nd QR
qr2b=myDecodeKey(y123,9);
y1=(qr2b==a1);   % QR_2 error map
dat2=myErrorCodeword41(y1,a);
% disp('QR_2  bitError bitErrorRate codewordError codewordErrorRate')
% disp(dat2)
res=[recogE cw dat2];