function FILLGRID(obstacle,color)
for i=1:length(obstacle(:,1))
    fill([obstacle(i,1)-0.5,obstacle(i,1)-0.5,obstacle(i,1)+0.5,obstacle(i,1)+0.5],[obstacle(i,2)+0.5,obstacle(i,2)-0.5,obstacle(i,2)-0.5,obstacle(i,2)+0.5],color);
end
end
