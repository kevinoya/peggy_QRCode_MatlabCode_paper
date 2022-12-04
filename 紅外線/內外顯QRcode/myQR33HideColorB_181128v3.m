function zz=myQR33HideColor(k5,y29,m7);
%
% input:   k5: 396x396x3 color image
%          y33: 33x33 QR binary
%          m7:  6x6 error mask (1/4 of 12x12)
% output:  zz: 396x396x3 color image with 33x33 QR


m9=[m7 rot90(rot90(rot90(m7)));  rot90(m7)  rot90(rot90(m7))];   % 12x12 mask for error diffusion


y348=imresize(y29,12,'nearest');
y348b=uint8(double(y348)*255);
y348c=uint8(zeros(348,348,3));     % 396x396x3 color image (外顯是 33x33 QR)
for i=1:3
    y348c(:,:,i)=y348b;
end


%  製作外框
%
mk1=zeros(29,29);
mk1(1:8,1:8)=1;
mk1(1:8,1+21:8+21)=1;
mk1(1+21:8+21,1:8)=1;
mk1(21:25,21:25)=1;
%subplot(2,3,4),imshow(logical(mk1));title('QR frame');  % 33x33 0/1 mask
mk348=imresize(mk1,12,'nearest');
%mk396b=double(mk396);


k1=k5;
% 加密
%
for m=1:12
    for n=1:12
        for p=1:3
            if m9(m,n)==0
                k1(m:12:348,n:12:348,p)=uint8(double(y29)*255);
            else
                k1(m:12:348,n:12:348,p)=k1(m:12:348,n:12:348,p);
            end
        end
    end
end


% subplot(2,3,5),imshow(k1);title('only hiding');  % 加密影像


% error diffusion
%
x=double(zeros(348,348,3));
for i=1:27
    for j=1:27
       for p=1:3
           x1= double(k5( (i-1)*12+1 : i*12, (j-1)*12+1 : j*12, p)).* double(m9==0) ;  % 中心區之灰階值
           q1= double(y348c( (i-1)*12+1 : i*12, (j-1)*12+1 : j*12, p)).* double(m9==0) ; % 中心區之QR值
           error=sum(sum(x1))-sum(sum(q1));
           x( (i-1)*12+1 : i*12, (j-1)*12+1 : j*12, p)=error*m9/sum(sum(m9));
       end
    end
end
% k1(145:250,145:250,:)=k5(145:250,145:250,:);
% k1(145:240,180:220,:)=k5(145:240,180:220,:);
  k1(145:240,181:216,:)=k5(145:240,181:216,:);
k7=uint8(double(k1)+x);
zz=k7;
%zz=myBlendColorImages(k7,y396c,~mk396);  % 加密影像/QR影像 透過外框合成
%subplot(2,3,6),imshow(z);title('final result'); % Graphic QR

