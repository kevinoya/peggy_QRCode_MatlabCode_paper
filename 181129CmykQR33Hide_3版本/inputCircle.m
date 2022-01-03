tt=-329.5:1:329.5;            
dd=350;
[X,Y] = meshgrid(tt/dd, tt/dd);
%B=0.8;

Z = (exp(-(X.^2 + Y.^2)/B^2));
Z1=Z/max(max(Z));
% k3=uint8(double(k3a).*Z1);
Z2=Z1>0.5;  % 165x165
Z3=logical(zeros(660+140,660+140));
Z3(140+1:140+660,140+1:140+660)=Z2;
Z4=conv2(double(Z3),ones(21,21)/21/21,'same');
Z5=Z4(140+1:140+660,140+1:140+660);      % <--------Mask