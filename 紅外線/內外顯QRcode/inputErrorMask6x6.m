m12=[
    1 1 1 1 1 1;
    1 2 2 2 2 2;
    1 2 2 2 2 2;
    1 2 2 1 1 1;
    1 2 2 1 1 0;
    1 2 2 1 0 0];

m16=[
    1 1 1 1 1 1;
    1 2 2 2 2 2;
    1 2 2 2 2 2;
    1 2 2 1 1 1;
    1 2 2 1 0 0;
    1 2 2 1 0 0];

m20=[
    1 1 1 1 1 1;
    1 2 2 2 2 2;
    1 2 2 2 2 2;
    1 2 2 1 1 0;
    1 2 2 1 0 0;
    1 2 2 1 0 0];

m24=[
    1 1 1 1 1 1;
    1 2 2 2 2 2;
    1 2 2 2 2 2;
    1 2 2 1 1 0;
    1 2 2 1 0 0;
    1 2 2 0 0 0];

m4=zeros(6,6,4);
m4(:,:,1)=m12;
m4(:,:,2)=m16;
m4(:,:,3)=m20;
m4(:,:,4)=m24;