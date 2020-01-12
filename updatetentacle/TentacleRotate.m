%实现坐标绕（W,H)旋转角度rotate_the，
%旋转前：（x0，y0），旋转后：（x1，y1）
%参考：https://blog.csdn.net/Bryan_QAQ/article/details/78805201
function [x1,y1]=TentacleRotate(x0,y0,W,H,rotate_the)
x1=(x0-W).*cos(rotate_the)-(y0-H).*sin(rotate_the)+W;%.*cos(rotate_the)+H.*sin(rotate_the);
y1=(x0-W).*sin(rotate_the)+(y0-H).*cos(rotate_the)+H;%.*cos(rotate_the)+W.*sin(rotate_the);
% x1=x0.*cos(rotate_the)+y0.*sin(rotate_the)+W.*cos(rotate_the)+H.*sin(rotate_the);
% y1=-x0.*sin(rotate_the)+y0.*cos(rotate_the)-W.*sin(rotate_the)+H.*cos(rotate_the);
end

%  旋转中心（W,H）
%  平移阵：M=[ 1  0  0;
%              0  1  0;
%             -W -H  1 ];
%  旋转阵：M1=[ cos(the)   sin(the)   0;
%               -sin(the)  cos(the)   0;
%               0          0          1 ];
%  变回原来的坐标系： M2=[ 1  0  0;
%                          0  1  0;
%                          W  H  1 ];
%   P0=[x y 1];
%   P1=[x1 y1 1] = P0*M*M1*M2;