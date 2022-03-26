% 解密 123x123 Graphic QR (41x41)
%
%  input- res : 123x123 binary
%          nn : key  
%
%  output - mydecode : 41x41 binary

function mydecode=myDecodeKey(res,nn);

%nn=3;   % key
%nn=key;
rand('seed',nn);
a1=uint8(ceil(rand(41,41)*8));
a2=a1+uint8(double(a1>=5));       % 1 2 3 4 6 7 8 9   (對3x3而言 不要有第5的位置)  41x41 矩陣
%
mydecode=logical(ones(41,41));
for i=1:41
for j=1:41
    mm=res( (i-1)*3+1:i*3, (j-1)*3+1:j*3);
    mydecode(i,j)=mm(a2(i,j));    
end
end
mydec6=imresize(mydecode,6,'nearest');  % 246x246 
imshow(mydec6);title(['decoded 2nd QR, key=',num2str(nn)]);
