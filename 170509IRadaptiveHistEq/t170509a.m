y=imread('fig170508.png');
y1=rgb2gray(y(854:1461,1774:2435,:));%将 RGB 图像或颜色图转换为灰度图
figure(1),imshow(y1);
%
figure(2),
for a=3:3:9
ya=medfilt2(y1,[a,a]);%二维中位数滤波(平滑處理):第一個引數是要平滑的影象，第二個引數是輸入影象畫素周圍的 m×n 鄰域值
%
limit=0.1;
%
nn=8;
y2 = adapthisteq(ya,'NumTiles',[nn nn],'ClipLimit',limit);%CLAHE的英文是Contrast Limited Adaptive Histogram Equalization 限制對比度的自適應直方圖均衡
subplot(1,3,a/3),imshow(y2); %將當前圖窗劃分為 m×n 網格並在 p 指定的位置創建軸。
%example : subplot(1,3,2),imshow(y2);
end