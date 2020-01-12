function globalpath=ASTAR(obstacle,map)
% open=zeros(500,500);
% close=zeros(500,500);
% globalpath=zeros(200,200);
open=[];
close=[];
globalpath=[];
findflag=false; %判断是否找到路径

%open=[x,y,F,G,parentx,parenty]
open=[map.start(1),map.start(2),0+h(map.start,map.goal),0,map.start(1),map.start(2)];
next=MOTIONMODEL();

while ~findflag
    if isempty(open(:,1))
       % findflag=true;
        disp('no path!');
        return;
    end
    
    [inopenflag,inline]=ISINOPEN(map.goal,open);%判断目标点是否在open中
    if inopenflag
        findflag=true;
        disp('find goal');
        close=[open(inline,:);close];%把找到的open行放入close中
        break;
    end
    
    [B,I]=sort(open(:,3));%升序
    open=open(I,:);%把open也做F的升序排列
    
    close=[open(1,:);close];%把F最小的点从open放入close
    current=close(1,:);
    open(1,:)=[];%放入close的点要及时在open中移除
    
    %依次对每个相邻节点做处理
    for i=1:length(next(:,1))
        m=[current(1)+next(i,1),current(2)+next(i,2),0,0,0,0];
        m(4)=current(4)+next(i,3);%G
        m(3)=m(4)+h(m(1:2),map.goal);%F
        
        if ISOBSTACLE(m,obstacle)
            continue;
        end
        
        %typeflag==1,在close中；
        %typeflag==2,不在open中；
        %typeflag==3,已经在open中；
        [typeflag,inc]=FINDTYPE(m,open,close);
        
        if typeflag==1  %在close中
            continue;
        
        elseif typeflag==2 %不在open中
            m(5:6)=[current(1),current(2)];
            open=[open;m];
        
        else  %已经在open中
           if m(3)<open(inc,3)  %若当前节点作为父节点更好，则变更父节点
               m(5:6)=[current(1),current(2)];  
               open(inc,:)=m;%%%%%%更新open中的对应行的父节点，因为实际筛选当前节点是在open中选出
           end
        end
        
    end
    
%     画网格线
    LINEGRID(map);
    hold on;
    pause(0.001);
    %绘制close和open节点
    FillPlot(close,'g');
    hold on;
    FillPlot(open,'r')
    hold on;
end

globalpath=GETPATH(close,map.start);
end
        
        
            
        
        
        
    
  
    
    
    
    
    
    
    
    
    
    