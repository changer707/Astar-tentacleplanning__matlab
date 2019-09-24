%---画网格图、起点、终点---
function PLOTGRID(map)
for i=1:(map.XMAX+4)
    line([i-2.5,i-2.5],[-1.5,map.YMAX+1.5]);
end
for j=1:(map.YMAX+4)
    line([-1.5,map.XMAX+1.5],[j-2.5,j-2.5]);
end

hold on
plot(map.start(1),map.start(2),'*r');
hold on
plot(map.goal(1),map.goal(2),'*r');

axis([-1.5,map.XMAX+1.5,-1.5,map.YMAX+1.5]);
axis equal;

end

