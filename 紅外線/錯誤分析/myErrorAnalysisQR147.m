%
%  input / data  偵測 147x147   
%          y147   true 147x147
%  output / [錯誤數 偽白 為黑 錯誤率  QR1錯誤數 錯誤率 錯誤codeword 錯誤cw率  QR2錯誤數 錯誤率
%  錯誤codeword 錯誤cw率 ]

function res=myErrorAnalysisQR147(data,y147);

% recognition rate for 147x147
%
recogErrorRate=1-sum(sum(data==y147))/49/49;
recogError=sum(sum(data~=y147));

FP=(y147==0)&(data==1);
FN=(y147==1)&(data==0);
num_FW= sum(sum(FP));
num_FB=   sum(sum(FN));
recogE=[recogError num_FW num_FB recogErrorRate];
resImg=[y147  data==y147 data ; ~FP logical(zeros(49,49))  ~FN];
figure(7),imshow(resImg);
title('GraphicQR147    ErrorMap      RecognizeImage');

%
%
%                         <=======  分析 1st QR
% 呼叫qr49_matrix產生  a  <=== 147x147 codeword labels
qr49_matrix;
%
% ErrorCodeword49   %%codeword解密
% 總共2401個codeword（49x49）
%
%x1=(data(2:3:end,2:3:end)==y147(2:3:end,2:3:end));   % x1 : 1(白):正確的判別  0(黑):錯誤的判別
x1 = data ==y147;
cw=myErrorCodeword49(x1,c);

xlabel({[num2str(num_FW),' false WHITE (黑0->白1) ',num2str(num_FB),' false BLACK (白1->黑0)'] ...
    ,['recogErrorRate:',num2str(recogErrorRate),'    recogError:',num2str(recogError)] ...
    ,['module錯誤數(%)', num2str(cw(1,1)),'(',num2str(cw(1,2)*100),'%)'] ...
    ,['codeword錯誤數(%)', num2str(cw(1,3)),'(',num2str(cw(1,4)*100),'%)']...
    });

res=[recogE cw ];