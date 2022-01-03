
% http://qr.calm9.com/tw/) 產生QRCODE
%  尺寸M
%  版本密度6(41*41)
%  容錯率隨意
%  QRCode只能是四個點位，若為九點位，請嘗試將網址縮短或調整容錯率
%  另存後把白邊切除，裁切過後的QRCode大小為123*123:

%輸入QRcode檔名，此程式會轉成41x41的tif檔
y=imread('QRcode_TUNNEL.png');
y1=y(1:3:123,1:3:123);
y2=y1>128;
imshow(y1);
%imshow(y2);
imwrite(y2,'20211127_QRcode_TUNNEL.tif');
