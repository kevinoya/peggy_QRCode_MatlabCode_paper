a=imread('987654321B.tif');
b=imread('11111.tif');
figure, subplot(2,1,1), imshow(a), subplot(2,1,2), imshow(b);
%pic1 = imresize(a,1/3,"bicubic");
%pic2 = imresize(b,1/3,"bicubic");
%pic1 = a(2:3:end,2:3:end);
pic2 = b(2:3:end,2:3:end);

pic3 = a(1:3:end,1:3:end);
pic6 = a(2:3:end,2:3:end);
pic9 = a(3:3:end,3:3:end);

%figure, subplot(3,1,1), imshow(pic3), subplot(3,1,2), imshow(pic6), subplot(3,1,3), imshow(pic9);

res = myErrorAnalysisQR123 (pic6,pic2,9);


disp(['module錯誤數(%)', num2str(res(1,5)),'(',num2str(res(1,6)),'%)']);
disp(['codeword錯誤數(%)', num2str(res(1,7)),'(',num2str(res(1,8)),'%)']);


