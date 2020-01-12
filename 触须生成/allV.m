% q=1/80;
n=16;     %16个速度集
f=(1.2*2+pi)/2;  %第一个速度集最弯曲的触须对应弧度
p=1.15;

r=[];%触须半径集
V=[];%速度集
l=[];%触须弧长集
themax=[];%触须最大角度集


%16个速度集速度
for j=1:16
    Vs=0.25;
    Ve=10;
    q(j)=(j-1)/(n-1);
    V(j)=Vs+(q(j)^1.2)*(Ve-Vs);     %q^1.2作用：使低速集数量多一些
end

%每个速度集触须生成
for j=1:1%%%%%%%%%%%%%%%
    L=8+33.5*(q(j)^1.2);
    Rj=L/(f*(1-q(j)^0.9)); %最外侧触须的半径
    
    for k=1:81
        if k<41
            r(k)=(p^(k-1))*Rj;  % p^(k-1)作用：使小曲率段多采样，大曲率段采样分散
        elseif k==41
            r(k)=inf;
        else
            r(k)=(-1)*(p^(k-42))*Rj; %对应于0-80时的（k-41）
        end
    end
    
    for k=1:81
        if k<=41
            l(k)=L+20*sqrt((k-1)/40);      %弧长
            themax(k)=l(k)/r(k);           %弧长对应的角度
        else
            l(k)=L+20*sqrt((k-42)/40);
            themax(k)=l(k)/abs(r(k));
        end
    end
    
    %图像分块
%     subplot(4,4,j);
    title([num2str(V(j)) 'm/s']);
    xlabel('Y轴/m');
    ylabel('X轴/m');
    axis([-15,15,-3,60])
    
    hold on
    for k=1:81
        if k<41
            the=(pi/2-themax(k)):2*pi/36000:pi/2;  %取样点要多，不够会导致两边看起来不对称
            x=r(k)*cos(the);
            y=r(k)*sin(the)-r(k);
            plot(y,x);
        elseif k==41        %中间一条为直线
            x=0:0.01:l(k);
            y=0;
            plot(y,x,'-b');
        else
            the=0.5*pi:2*pi/36000:(0.5*pi+themax(k));
            x=r(k)*cos(the);
            y=r(k)*sin(the)-r(k); %因为r定义时有正负分类，故这里上下公式一样，不用分类讨论
            plot(y,x);
        end
    end
    hold off
end
