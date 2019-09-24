function path=ASTAR(obstacle,map)
open=[];
close=[];
path=[];

open=[map.start(1),map.start(2),0+h(map.start,map.goal),0,map.start(1),map.start(2)];
next=indexmode();
flagreach=false;%抵达目标标志符

while ~flagreach
    if isempty(open(:,1))
        disp('no path!');
        flagreach=true;
        return;
    end
    
   %判断目标点是否出现在open列表中
    [isopenFlag,Id]=isopen(map.goal,open);
    if isopenFlag
        disp('Find Goal!!');
        close = [open(Id,:);close];
        flagreach=true;
        break;
    end
    
   
    
    %---找出F最小的邻节点放入closelist，作为当前节点---
    [Y,I]=sort(open(:,3));
    open=open(I,:);
    close=[open(1,:);close];
    current=open(1,:);
    open(1,:)=[];
    
    for i=1:length(next(:,1))
        m=[current(1)+next(i,1),current(2)+next(i,2),0,0,0,0];
        m(4)=current(4)+next(i,3); %相邻节点G值
        m(3)=m(4)+h(m(1:2),map.goal); %相邻节点F值
   
        
        %去掉相邻节点中的障碍物
        if isobstacle(m,obstacle)
            continue;
        end
        
        %对节点进行分类
        [k,flaglist]=FINDLIST(m,open,close);
        
        %已在closelist中
        if flaglist==1
            continue;
            %不在openlist中，加入openlist并将当前节点作为其父节点
        elseif flaglist==2
            m(5:6)=[current(1),current(2)];
            open=[open;m];
            %已在openlist中，计算其F，与原来的相比是否更小，若是，则更改父节点为当前节点
        else
            if m(3)<=open(k,3)
                m(5:6)=[current(1),current(2)];
                open(k,:)=m;
            end
        end
    end
    
    PLOTGRID(map);
    hold on;
    pause(0.01);
    %绘制
    FILLGRID(close,'p');
    hold on;
    FILLGRID(open,'r');
    hold on;
end
    
 path=GetPath(close,map.start);
end

        
    
