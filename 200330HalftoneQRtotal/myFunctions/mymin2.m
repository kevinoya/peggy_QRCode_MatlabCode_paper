%
%  Find the max point in a 2-D matrix      2009-04-15
%
%  Input: 2D matrix      Output: [i j] position
%  Usage:   y=mymin(2d_matrix)   y(1): Y coordinate; y(2): X coordinate;

function y=mymin2(d)

[k8 n8]=min(d);
[k9 n9]=min(k8);
n10=n8(n9);

y=[n8(n9) n9];
