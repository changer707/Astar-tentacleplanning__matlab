clear;
clc;
disp('A star path planning start!');

%--------初始化--------
map.XMAX=30;  %地图X向长度
map.YMAX=30;  %地图Y向长度
map.start=[1,1];    %起点
map.goal=[30,20];   %终点

PLOTGRID(map);   %画方格图
hold on;

%---------画障碍物---------
obstacle=Getboundary(map); %获取边界坐标
nobstacle=200;     %障碍物数目
obstacle=Getobstacle(nobstacle,obstacle,map);%obstacle=[obstacle;Getobstacle(nobstacle,map)];%获取所有障碍物坐标

FILLGRID(obstacle,'k');%填充障碍物方格

%--------A*算法寻找路径-------
path=ASTAR(obstacle,map); %输出路径点

if length(path(:,1))>=1
    plot(path(:,1),path(:,2),'-c','LineWidth',5);hold on;
end




