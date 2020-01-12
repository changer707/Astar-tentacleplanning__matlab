%求第k条触须执行0.1s后的位置
%输入：速度v，触须编号k
%输出：位置增量dx，dy;执行长度对应的角度the_k
function [dx,dy,the_k]=IndexCarpoint(v,k,r)
if k==41
    dx=0;
    dy=0.1*v;
else
    L=0.1*v;
    the_k=L./r(k);%绝对值
    %dx，dy均为绝对值
    dx=r(k)-r(k).*cos(the_k);
    dy=r(k).*sin(the_k);
end
end
