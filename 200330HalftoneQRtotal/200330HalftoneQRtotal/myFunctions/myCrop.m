function y=myCrop(k0,vv,hh);
%    k0: input color image
% 
%    vv, hh: output image height and width  (object aspect ratio is the same)
%
%    usage: y=myCrop(k0,vv,hh);
%

% k0=imread('ntnu743x748.tif');
[m n p]=size(k0);  % input dimension

% vv=600;  % output dimension
% hh=472;

if (vv/hh) < (m/n)        %  ���W�U(�H���׬���¦)
    % k0=[uint8(255*ones(m,n,3)) k0 uint8(255*ones(m,n,3))];
    % [m2 n2 p2]=size(k0);
    v=round(n*vv/hh);     % �j�P�ݭn������
    s1=round((m-v)/2);
    k1=k0(s1+1:s1+v,:,:);
else                   %  �����k
n1=round(m*hh/vv);         % �j�P�ݭn���e��
s1=round((n-n1)/2);
k1=k0(:,s1+1:s1+n1,:);
end

y=imresize(k1,[vv,hh]);