clear;
clc;
%起点
x0=0;
y0=0;
rotate_the=0;%记录当前触须的偏转角

[r,V]=singleV(x0,y0,rotate_the);
k=25;
clf;
%获取下一个位置的坐标（x1，y1）
[dx,dy,the_k]=IndexCarpoint(V,k,r);
[x1,y1]=UpdateCarpoint(x0,y0,dx,dy,k);
%记录轨迹
MarkPath(r,k,x0,y0,V,rotate_the);
%更新旋转角度rotate_the
rotate_thek=IndexThe_k(V,r);%每条触须（0.1s）和中央触须之间的夹角集
rotate_the=rotate_the+rotate_thek(k);
[r,V]=singleV(x1,y1,rotate_the);









