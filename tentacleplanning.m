clear;
clc;
disp('tentacles planning start!');
% map.XYMAX=100; %地图大小100*100，算起来太慢
% map.start=[50,0];%起点
% map.goal=[90,90];%终点

map.XYMAX=50; %地图大小100*100，算起来太慢
map.start=[5,0];%起点
map.goal=[45,45];%终点

obstacle=Getboundary(map);%获取地图边界坐标点
nobstacle=450;%障碍物数量
obstacle=GetObstacle(nobstacle,obstacle,map);%加入地图中障碍物坐标
obstacle=[obstacle;[25,22]];

LINEGRID(map);%画网格线
hold on;
FillPlot(obstacle,'k');%画出障碍方块

%--------A算法找出全局路径--------
globalpath=ASTAR(obstacle,map);

% if length(globalpath)>=1
    plot(globalpath(:,1),globalpath(:,2),'-c','LineWidth',3);%画出路径
%     hold on;
% end





