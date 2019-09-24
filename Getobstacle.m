% function mapobstacle=Getobstacle(nobstacle,map)
%  %生成障碍物坐标
% mapobstacle=round(rand([nobstacle,2])*map.XMAX);%只适用于正方形？
% nremove=[];
% for i=1:nobstacle
%     if (isequal(mapobstacle(i,:),map.start)||isequal(mapobstacle(i,:),map.goal))
%         nremove=[nremove;mapobstacle(i,:)];
%     end
% end
% nremove=[];
% end

function obstacle=Getobstacle(nob,obstacle,map)
%生成障碍点的坐标
ob=round(rand([nob,2])*map.XMAX);
%生成的障碍点有可能是和start点和goal点坐标重合的，需要删除，removeInd为重合点的数组索引index
removeInd=[];

%遍历ob数组，检查哪些坐标与start和goal重合，并将其索引存在removeInd中
for io=1:length(ob(:,1))
   if(isequal(ob(io,:),map.start) || isequal(ob(io,:),map.goal))
        removeInd=[removeInd;io];
    end  
end

%将重复的节点置空，去掉
ob(removeInd,:)=[];
%将ob障碍点加入到obstacle中（obstacle中已经包括边界节点的坐标了，这里还要再加上内部障碍点的坐标）
obstacle=[obstacle;ob];
