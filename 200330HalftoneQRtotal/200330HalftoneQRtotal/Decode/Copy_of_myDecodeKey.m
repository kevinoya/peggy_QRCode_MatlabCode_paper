% 解密 165x165 Graphic QR (33x33)
%
%  input- res : 165x165 binary
%          nn : key  
%
%  output - mydecode : 33x33 binary

function mydecode=Copy_of_myDecodeKey(res,nn);

%nn=3;   % key
%nn=key;
rand('seed',25);
a1=uint8(ceil(rand(33,33)*24));
a2=a1+uint8(double(a1>=13));       
%  1  2  3  4  5
%  6  7  8  9 10
% 11 12    14 15 
% 16 17 18 19 20 
% 21 22 23 24 25
% (對5x5而言 不要有第13的位置)  33x33 矩陣
%
mydecode=logical(ones(33,33));
for i=1:33
for j=1:33
    mm=res( (i-1)*5+1:i*5, (j-1)*5+1:j*5);
    mydecode(i,j)=mm(a2(i,j));    
end
end
mydec6=imresize(mydecode,6,'nearest');  % 246x246 
imshow(mydec6);title(['decoded 2nd QR, key=',num2str(nn)]);
