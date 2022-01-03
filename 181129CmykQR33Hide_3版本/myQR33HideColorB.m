function zz=myQR33HideColor(k5,y33,m7);
%
% input:   k5: 396x396x3 color image
%          y33: 33x33 QR binary
%          m7:  6x6 error mask (1/4 of 12x12)
% output:  zz: 396x396x3 color image with 33x33 QR


m9=[m7 rot90(rot90(rot90(m7)));  rot90(m7)  rot90(rot90(m7))];   % 12x12 mask for error diffusion


y396=imresize(y33,12,'nearest');
y396b=uint8(double(y396)*255);
y396c=uint8(zeros(396,396,3));     % 396x396x3 color image (外顯是 33x33 QR)
for i=1:3
    y396c(:,:,i)=y396b;
end


%  製作外框
%
mk1=zeros(33,33);
mk1(1:8,1:8)=1;
mk1(1:8,1+25:8+25)=1;
mk1(1+25:8+25,1:8)=1;
mk1(25:29,25:29)=1;
%subplot(2,3,4),imshow(logical(mk1));title('QR frame');  % 33x33 0/1 mask
mk396=imresize(mk1,12,'nearest');
%mk396b=double(mk396);


k1=k5;
% 加密
%
for m=1:12
    for n=1:12
        for p=1:3
            if m9(m,n)==0
                k1(m:12:396,n:12:396,p)=uint8(double(y33)*255);
            else
                k1(m:12:396,n:12:396,p)=k1(m:12:396,n:12:396,p);
            end
        end
    end
end


% subplot(2,3,5),imshow(k1);title('only hiding');  % 加密影像


% error diffusion
%
x=double(zeros(396,396,3));
for i=1:31
    for j=1:31
       for p=1:3
           x1= double(k5( (i-1)*12+1 : i*12, (j-1)*12+1 : j*12, p)).* double(m9==0) ;  % 中心區之灰階值
           q1= double(y396c( (i-1)*12+1 : i*12, (j-1)*12+1 : j*12, p)).* double(m9==0) ; % 中心區之QR值
           error=sum(sum(x1))-sum(sum(q1));
           x( (i-1)*12+1 : i*12, (j-1)*12+1 : j*12, p)=error*m9/sum(sum(m9));
       end
    end
end

k7=uint8(double(k1)+x);
zz=k7;
%zz=myBlendColorImages(k7,y396c,~mk396);  % 加密影像/QR影像 透過外框合成
%subplot(2,3,6),imshow(z);title('final result'); % Graphic QR

