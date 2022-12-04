%
%  input / data  偵測 99x99   
%          y99   true 99x99
%  output / [錯誤數 偽白 為黑 錯誤率  QR1錯誤數 錯誤率 錯誤codeword 錯誤cw率  QR2錯誤數 錯誤率
%  錯誤codeword 錯誤cw率 ]

function res=myErrorAnalysisQR99(data,y99);

% recognition rate for 99x99
%
recogErrorRate=1-sum(sum(data==y99))/33/33;
recogError=sum(sum(data~=y99));
%
% figure(7),imshow(data==y99);title('error map');
%
FP=(y99==0)&(data==1);
FN=(y99==1)&(data==0);
num_FW= sum(sum(FP));
num_FB=   sum(sum(FN));
% figure(8),imshow(~FP);title([num2str(num_FW),' false WHITE 黑0->白1']);
% figure(9),imshow(~FN);title([num2str(num_FB),' false BLACK 白1->黑0']);
recogE=[recogError num_FW num_FB recogErrorRate];
% disp(recogE);
resImg=[y99  data==y99 data ; ~FP logical(zeros(33,33))  ~FN];
figure(7),imshow(resImg);
title('GraphicQR99    ErrorMap      RecognizeImage');
%xlabel({[num2str(num_FW),' false WHITE (黑0->白1) ',num2str(num_FB),' false BLACK (白1->黑0)'] ...
%    ,['recogErrorRate:',num2str(recogErrorRate),'    recogError:',num2str(recogError)]});

%
%imwrite(~FP, 'Scan1012laser_FP_me21.png')
%imwrite(~FN, 'Scan1012laser_FN_me21.png')

%
%
%
%                         <=======  分析 1st QR
% 呼叫qr33_matrix產生  a  <=== 33x33 codeword labels
qr33_matrix;
%
% ErrorCodeword33   %%codeword解密
% 總共172個codeword（33x33）
%
%x1=(data(2:3:end,2:3:end)==y99(2:3:end,2:3:end));   % x1 : 1(白):正確的判別  0(黑):錯誤的判別
x1 = data ==y99;
cw=myErrorCodeword33(x1,a);
%res8=[mm nn cw(1)  cw(2:4)];
% disp('QR_1  bitError bitErrorRate codewordError codewordErrorRate')
% disp(res8)
% mydata9=[mydata9;res8 ];
xlabel({[num2str(num_FW),' false WHITE (黑0->白1) ',num2str(num_FB),' false BLACK (白1->黑0)'] ...
    ,['recogErrorRate:',num2str(recogErrorRate),'    recogError:',num2str(recogError)] ...
    ,['module錯誤數(%)', num2str(cw(1,1)),'(',num2str(cw(1,2)*100),'%)'] ...
    ,['codeword錯誤數(%)', num2str(cw(1,3)),'(',num2str(cw(1,4)*100),'%)']...
    });

res=[recogE cw ];