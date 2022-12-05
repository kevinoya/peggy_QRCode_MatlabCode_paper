a=imread('20221205A.tif');
b=imread('20221205B.tif');
figure, subplot(2,1,1), imshow(a), subplot(2,1,2), imshow(b);

pic2 = b(2:3:end,2:3:end);

pic3 = a(1:3:end,1:3:end);
pic6 = a(2:3:end,2:3:end);
pic9 = a(3:3:end,3:3:end);

res = myErrorAnalysisQR147 (pic6,pic2);


disp(['module錯誤數(%)', num2str(res(1,5)),'(',num2str(res(1,6)),'%)']);
disp(['codeword錯誤數(%)', num2str(res(1,7)),'(',num2str(res(1,8)),'%)']);


