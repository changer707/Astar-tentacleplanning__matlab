%记录每次触须的轨迹
%输入：半径集r，触须编号k，旋转中心（车点）：（W,H）， 速度V ，旋转角rotate_the
function [ ]=MarkPath(r,k,W,H,V,rotate_the)
L=0.1*V;
the_k=L./r(k);
        if k<41
            the=(pi/2-the_k):2*pi/36000:pi/2;  %取样点要多，不够会导致两边看起来不对称
            y=r(k)*cos(the)+H;
            x=r(k)*sin(the)-r(k)+W;
           [x1,y1]=TentacleRotate(x,y,W,H,rotate_the);
            plot(x1,y1,'r');
        elseif k==41        %中间一条为直线
            y=0+H:0.01:l(k)+H;
            x=0+W;
            [x1,y1]=TentacleRotate(x,y,W,H,rotate_the);
            plot(x1,y1,'-r');
        else
            the=0.5*pi:2*pi/36000:(0.5*pi+the_k);
            y=r(k)*cos(the)+H;
            x=r(k)*sin(the)-r(k)+W; %因为r定义时有正负分类，故这里上下公式一样，不用分类讨论
            [x1,y1]=TentacleRotate(x,y,W,H,rotate_the);
            plot(x1,y1,'r');
        end
   
%    text(W,H,['(',num2str(W),',',num2str(H),')']);
  
end