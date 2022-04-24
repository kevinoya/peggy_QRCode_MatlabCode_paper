% A: color image 1
% B: color image 2
% mask: binary image


function res=myBlendColorImages(A,B,mask);
[m n p]=size(A);
res=uint8(zeros(m,n,p));
for i=1:p
    res(:,:,i)=uint8(double(A(:,:,i)).*double(mask)+double(B(:,:,i)).*(1-double(mask)));
end

%imwrite(res,'testCombo.tif');
